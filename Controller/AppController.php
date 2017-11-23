<?php
App::uses('Controller', 'Controller');
//App::uses('FB', 'Facebook.Lib');
class AppController extends Controller
{
	public $helpers		= array(
		'Session',
		'Html',//			=> array('className' => 'BoostCake.BoostCakeHtml'),
		'Form',//			=> array('className' => 'BoostCake.BoostCakeForm'),
		'Paginator',//		=> array('className' => 'BoostCake.BoostCakePaginator'),
		'PhpExcel',
		'Hookipa'
		//'AssetCompress.AssetCompress'
		//, 'Facebook.Facebook'
	);

	public $components	= array(
		'Session',
		'Auth' => array(
			'loginAction'		=> array('controller' => 'administradores', 'action' => 'login', 'admin' => true),
			'loginRedirect'		=> '/admin',
			'logoutRedirect'	=> '/admin',
			'authError'			=> 'No tienes permisos para entrar a esta sección.',
			'authenticate'		=> array(
				'Form'				=> array(
					'userModel'			=> 'Usuario',
					'fields'				=> array(
						'username'				=> 'email',
						'password'				=> 'clave'
					)
				)
			)
		),
		'DebugKit.Toolbar',
		'Carro',
		'Webpay.PagoSimultaneo',
		'Transbank',
		'RequestHandler',
		'Breadcrumb' => array(
			'crumbs'		=> array(
				array('Estás en:', null),
				array('Inicio', '/'),
			)
		)
		//'Facebook.Connect'	=> array('model' => 'Usuario'),
		//'Facebook'
	);

	public function beforeFilter()
	{
		/**
		 * Layout administracion y permisos publicos
		 */
		if ( ! empty($this->request->params['admin']) )
		{
			$this->layoutPath	= 'backend';
			AuthComponent::$sessionKey	= 'Auth.Administrador';
			$this->Auth->authenticate['Form']['userModel']		= 'Administrador';

			/**
			 * Bloqueo de pantalla
			 */
			if ( $this->Session->check('Admin.lock') )
			{
				if ( ! ( $this->request->params['controller'] === 'administradores' && $this->request->params['action'] === 'admin_lock' ) )
				{
					$this->redirect(array('controller' => 'administradores', 'action' => 'lock'));
				}
			}

			/**
			 * Permiso de acceso al modulo
			 */
			if ( $this->Auth->user() )
			{
				$permiso_usuario	= json_decode($this->Auth->user('Perfil')['permisos']);
				$perfil_usuario		= $this->Auth->user('perfil_id');

				if ( $this->request->params['controller'] != 'administradores' && ( $this->request->params['action'] != 'admin_login' || $this->request->params['action'] != 'admin_logout') )
				{
					$modulo = $this->request->params['controller'];

					if ($this->request->params['controller'] == 'compras' && $this->request->params['action'] == 'admin_dashboard')
					{
						$modulo = 'dashboard';
					}
					if ( ! permisosPerfilBackend($perfil_usuario, $permiso_usuario, $modulo) )
					{
						$modulo_home = obtenerPrimerModuloPermiso($permiso_usuario);
						if ( $modulo_home == 'dashboard')
						{
							$this->redirect(array('controller' => 'compras', 'action' => 'dashboard', 'admin' => true));
						}
						else
						{
							$this->redirect(array('controller' => $modulo_home, 'action' => 'index', 'admin' => true));
						}
					}
				}
			}
		}
		else
		{
			AuthComponent::$sessionKey	= 'Auth.Usuario';
			$this->Auth->allow();
		}

		/**
		 * Logout FB
		 */
		/*
		if ( ! isset($this->request->params['admin']) && ! $this->Connect->user() && $this->Auth->user() )
			$this->Auth->logout();
		*/

		/**
		 * Detector cliente local
		 */
		$this->request->addDetector('localip', array(
			'env'			=> 'REMOTE_ADDR',
			'options'		=> array('::1', '127.0.0.1')
		));

		/**
		 * Detector Transbank
		 */
		$this->request->addDetector('transbank', array(
			'env'			=> 'REMOTE_ADDR',
			'options'		=> array('200.10.12.55', '200.10.12.162', '200.10.12.163', '200.10.14.34', '200.10.14.162', '200.10.14.163', '200.10.14.177')
		));

		/**
		 * Detector entrada via iframe FB
		 */
		$this->request->addDetector('iframefb', array(
			'env'			=> 'HTTP_REFERER',
			'pattern'		=> '/facebook\.com/i'
		));

		/**
		 * Cookies IE
		 */
		header('P3P:CP="IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT"');
	}

	public function beforeRender()
	{
		if ( empty($this->request->params['admin']) )
		{
			// Cargo las categorias de los accesorios
			$Categoria			= ClassRegistry::init('Categoria');
			$categorias_menu	= array(
				'accesorios'	=> $Categoria->menu(3),
			);
			$this->set(compact('categorias_menu'));

			/**
			 * Camino de migas
			 */
			$breadcrumbs		= BreadcrumbComponent::get();
			if ( ! empty($breadcrumbs) && count($breadcrumbs) > 2 )
			{
				$this->set(compact('breadcrumbs'));
			}


			/**
			 * Estado carro
			 */
			$estado_carro		= $this->Carro->estado();
			$this->set(compact('estado_carro'));

			$usuario = AuthComponent::user();
			$esMayorista = false;
			if(!empty($usuario) && $usuario['tipo_usuario_id'] == 2){
				$esMayorista = true;
			}

			$this->set(compact('esMayorista'));
		}
	}

	/**
	 * Guarda el usuario Facebook
	 */
	public function beforeFacebookSave()
	{
		if ( ! isset($this->request->params['admin']) )
		{
			$this->Connect->authUser['Usuario']		= array_merge(array(
				'nombre_completo'	=> $this->Connect->user('name'),
				'nombre'			=> $this->Connect->user('first_name'),
				'apellido'			=> $this->Connect->user('last_name'),
				'usuario'			=> $this->Connect->user('username'),
				'clave'				=> $this->Connect->authUser['Usuario']['password'],
				'email'				=> $this->Connect->user('email'),
				'sexo'				=> $this->Connect->user('gender'),
				'verificado' 		=> $this->Connect->user('verified'),
				'edad'				=> $this->Session->read('edad')
			), $this->Connect->authUser['Usuario']);
		}

		return true;
	}
}
