<?php
App::uses('AppController', 'Controller');
class ContactosController extends AppController
{
	public function add()
	{
		if ( $this->request->is('post') )
		{
			if ( $this->Auth->user() )
			{
				$this->request->data		= array_replace_recursive($this->request->data, array(
					'Contacto'		=> array(
						'usuario_id'		=> $this->Auth->user('id')
					)
				));
			}
			$this->Contacto->create();
			if ( $this->Contacto->save($this->request->data) )
			{
				$this->Session->setFlash('Mensaje enviado correctamente. Nos contactaremos contigo a la brevedad.', null, array(), 'success');
				$this->request->data		= null;
			}
			else
			{
				$this->Session->setFlash('Error al enviar tu mensaje. Por favor intenta nuevamente.', null, array(), 'danger');
			}
		}

		$regiones			= $this->Contacto->Comuna->Region->find('list');

		/**
		 * Datos de usuario logeado
		 */
		if ( $this->Auth->user() )
		{
			$usuario		= $this->Auth->user();
		}

		/**
		 * Camino de migas
		 */
		BreadcrumbComponent::add('Contáctanos ahora');
		$this->set('title', 'Contáctanos ahora');

		$this->set(compact('regiones', 'usuario'));
	}

	public function admin_index()
	{

		/**
		 * Inicio busqueda
		 */
		if ( $this->request->is('post') )
		{
			$busqueda		= array();
			extract($this->request->data['Contacto']);

			// Información de busqueda libre
			if ( ! empty($libre) )
			{
				$busqueda['buscar']				= $libre;
			}
			// Informacion de busqueda por region
			if ( ! empty($region_id) )
			{
				$busqueda['region']				= $region_id;
			}
			// Informacion de busqueda por comuna
			if ( ! empty($comuna_id) )
			{
				$busqueda['comuna']				= $comuna_id;
			}
			$this->redirect(array('filtro' => $busqueda));

		}

		/**
		 * Paginacion + Filtros
		 * Se declara la paginacion con sus respectivos atributos, pero dejando
		 * las condiciones vacias
		 */
		//$this->paginate		= array(
		$paginacion		= array(
			'contain'			=> array(
				'Usuario',
				'Comuna' => array('Region'),
				'Administrador'
			),
			'order'				=> array('Contacto.created' => 'DESC')
		);

		$filtros			=	$this->params['named'];
		$condicionFiltros	=	$this->Contacto->condicionesFiltros($filtros);
		if ( ! empty($condicionFiltros) )
		{
			$paginacion['conditions']	= $condicionFiltros;
		}
		$this->paginate		= $paginacion;
		$contactos			= $this->paginate();

		$regiones			= $this->Contacto->Comuna->Region->find('list');

		$this->set(compact('contactos', 'regiones', 'filtros'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->Contacto->create();
			if ( $this->Contacto->save($this->request->data) )
			{
				$this->Session->setFlash("Registro agregado correctamente (ID {$this->Contacto->id})", null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
				$this->Session->setFlash('Error al guardar el registro. Por favor revisa los mensajes de validación.', null, array(), 'danger');
		}
		$usuarios	= $this->Contacto->Usuario->find('list');
		$comunas	= $this->Contacto->Comuna->find('list');
		$administradores	= $this->Contacto->Administrador->find('list');
		$this->set(compact('usuarios', 'comunas', 'administradores'));
	}

	public function admin_edit($id = null)
	{
		if ( ! $this->Contacto->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->Contacto->save($this->request->data) )
			{
				$this->Session->setFlash("Registro editado correctamente (ID {$this->Contacto->id})", null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
				$this->Session->setFlash('Error al guardar el registro. Por favor revisa los mensajes de validación.', null, array(), 'danger');
		}
		else
		{
			$this->request->data	= $this->Contacto->find('first', array(
				'conditions'	=> array('Contacto.id' => $id)
			));
		}
		$usuarios	= $this->Contacto->Usuario->find('list');
		$comunas	= $this->Contacto->Comuna->find('list');
		$administradores	= $this->Contacto->Administrador->find('list');
		$this->set(compact('usuarios', 'comunas', 'administradores'));
	}

	public function admin_delete($id = null)
	{
		$this->Contacto->id = $id;
		if ( ! $this->Contacto->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		$this->request->onlyAllow('post', 'delete');
		if ( $this->Contacto->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intentalo nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}
}
