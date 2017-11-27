<?php
App::uses('AppController', 'Controller');
class SucursalesController extends AppController
{
	public function admin_index()
	{
		$sucursales = $this->Sucursal->find('all', array(
				'contain' => array(
					'TipoSucursal'
				)
			)
		);		
		$this->set(compact('sucursales'));
	}
	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->Sucursal->create();
			$this->request->data['Sucursal']['slug'] = strtolower(Inflector::slug($this->request->data['Sucursal']['nombre'], '-'));
			// prx($this->request->data);
			if ( $this->Sucursal->save($this->request->data) )
			{
				$this->Session->setFlash('Registro agregado correctamente.', null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
			
			}
		}
		$tipoSucursales	= $this->Sucursal->TipoSucursal->find('list');
		$servicios	= $this->Sucursal->Servicio->find('list');
		$this->set(compact('tipoSucursales','servicios'));
	}
	public function admin_edit($id = null)
	{
		if ( ! $this->Sucursal->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}
		if ( $this->request->is('post') || $this->request->is('put') )
		{
			$this->request->data['Sucursal']['slug'] = strtolower(Inflector::slug($this->request->data['Sucursal']['nombre'], '-'));
			if($this->request->data['Sucursal']['imagen']['error'] != 0)
			{
				unset($this->request->data['Sucursal']['imagen']);
			}
			if ( $this->Sucursal->save($this->request->data) )
			{
				$this->Session->setFlash('Registro editado correctamente', null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
			}
		}
		else
		{
			$this->request->data	= $this->Sucursal->find('first', array(
				'conditions'	=> array('Sucursal.id' => $id),
				'contain'	=> array('Servicio')
			));
			//prx($this->request->data);
		}
		$tipoSucursales	= $this->Sucursal->TipoSucursal->find('list');
		$servicios	= $this->Sucursal->Servicio->find('list');
		$FotoActual = "";
		if ($this->request->data['Sucursal']['imagen']) {
			$FotoActual = $this->request->data['Sucursal']['imagen']['mini'];
		}
		$this->set(compact('tipoSucursales', 'FotoActual','servicios'));
	}
	public function admin_delete($id = null)
	{
		$this->Sucursal->id = $id;
		if ( ! $this->Sucursal->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}
		$this->request->onlyAllow('post', 'delete');
		if ( $this->Sucursal->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}
	public function admin_exportar()
	{
		$datos			= $this->Sucursal->find('all', array(
			'recursive'				=> -1
		));
		$campos			= array_keys($this->Sucursal->_schema);
		$modelo			= $this->Sucursal->alias;
		//prx($datos); 
		$this->set(compact('datos', 'campos', 'modelo'));
	}
	public function index() {
		//BANNER
        $tipocorte = 'bannerhome';
        $Slider = $this->requestAction(array('controller' => 'imagenes', 'action'=>'get_list', 4, 2));
        $banners = $this->requestAction(array('controller' => 'imagenes', 'action'=>'get_list', 4, 5));
        //filtros neumaticos
        $anchosNeumatico = $this->requestAction(array('controller'=>'Productos', 'action'=>'get_list_anchos', 2, 136));
        $perfilesNeumatico = $this->requestAction(array('controller'=>'Productos', 'action'=>'get_list_perfiles', 2, 136));
        $arosNeumatico = $this->requestAction(array('controller'=>'Productos', 'action'=>'get_list_aros', 2, 136)); 
        //filtros llantas
        $arosllanta = $this->requestAction(array('controller'=>'Productos', 'action'=>'get_list_aros', 1, 93));
        $apernadurasllanta = $this->requestAction(array('controller'=>'Productos', 'action'=>'get_list_apernaduras', 1));
        //filtros vehiculos
        $marcas_vehiculos = $this->requestAction(array('controller' => 'productos', 'action' => 'get_list_marcas_vehiculos'));
        //servicios
        $this->Servicio       = ClassRegistry::init('Servicio'); 
        $ListaServicios = $this->Servicio->find('all');  
        //$PaginaID, $UbicacionID
        $banner = $this->requestAction(array('controller' => 'imagenes', 'action'=>'get_list', 3, 5));
        $banners = $this->requestAction(array('controller' => 'imagenes', 'action'=>'get_list', 3, 6));
        //prx($banners);
		$ListaSucursales = $this->Sucursal->find('all',
			array(
				'conditions' => array(
					'Sucursal.tipo_sucursal_id' => '1'
				),
				'contain'	=> array('Servicio')
			)
		);
		$ListaDistribuidores = $this->Sucursal->find('all',
			array(
				'conditions' => array(
					'Sucursal.tipo_sucursal_id' => '2'
				),
				'contain'	=> array('Servicio')
			)
		);
		// prx(!empty($ListaDistribuidores));
        if(count($ListaSucursales)<=0){
            $this->redirect('/');
        }
		$this->set('CFG_PageTitle', 'Encuentra tu sucursal. Accesorios y servicios para autos | ZS Motor');
		$this->set('CFG_PageDescription', 'Encuentra tu sucursal o centro de distribución más cercano. No dudes en visitarnos, contamos con el mejor servicio. Llámanos al 22 630 77 20. ');
		$this->set('CFG_PageKeywords', 'sucursales zs motor, tiendas zs motor, tiendas accesorios auto, tiendas neumáticos, sucursal neumáticos, centros de distribución llantas');
        /**
        * Camino de migas
        */
        BreadcrumbComponent::add('/ Sucursales');
        $this->set('title', 'Productos');		
		$this->set(
			compact(
			'Slider',
			'tipocorte',
			'banners',
			'banner',
			'ListaSucursales',
			'anchosNeumatico',
			'perfilesNeumatico',
			'arosNeumatico',
			'arosllanta',
			'apernadurasllanta',
			'marcas_vehiculos',
			'ListaServicios',
			'ListaDistribuidores'				
			)
		);
	}
	public function view($slug = null) {
		//obtiene la info de la sucursal
		$sucursal = $this->Sucursal->find(
			'all',
			array(
				'conditions' => array(
					'Sucursal.slug' => $slug
				),
				'contain' => array(
					'TipoSucursal'
				)
			)
		);
		$InfoSucursal = $sucursal[0]['Sucursal'];
		$InfoTipoSucursal = $sucursal[0]['TipoSucursal'];
		$tipocorte = 'bannerinterior';
		$Slider = $this->requestAction(array('controller'=>'Imagenes', 'action'=>'get_list', 16, 14));
		$BannerNeumaticos = $this->requestAction(array('controller'=>'Imagenes', 'action'=>'get_list', 14, 19));
		$BannerLlantas = $this->requestAction(array('controller'=>'Imagenes', 'action'=>'get_list', 14, 20));
		$BannerPromociones = $this->requestAction(array('controller'=>'Imagenes', 'action'=>'get_list', 14, 21));
        /**
        * Camino de migas
        */
 		
        BreadcrumbComponent::add('/ Sucursales', array('controller' => 'Sucursales' , 'action' => 'index'));        
        BreadcrumbComponent::add('/ '.$InfoSucursal['nombre']);
        $this->set('title', 'Productos');
		$this->set(compact('InfoSucursal', 'InfoTipoSucursal', 'Slider', 'tipocorte', 'BannerNeumaticos', 'BannerLlantas', 'BannerPromociones'));
		if ($sucursal[0]['TipoSucursal']['id'] == 1) {
			$CFG_TipoSucursal = "Sucursal Directa";
		}
		else {
			$CFG_TipoSucursal = "Centro de Distribución";
		}
		$this->set('CFG_PageTitle', $CFG_TipoSucursal. " " .$sucursal[0]['Sucursal']['nombre']);
		$this->set('CFG_PageDescription', $CFG_TipoSucursal. " " .$sucursal[0]['Sucursal']['nombre']);
		$this->set('CFG_PageKeywords', $CFG_TipoSucursal);
	}
}
