<?php
App::uses('AppController', 'Controller');
class DireccionesController extends AppController
{
	public function add()
	{
		$lista				= $this->Session->check('Flujo.Lista.colegio_id');

		/**
		 * Comprueba que el usuario este logeado
		 */
		if ( ! $this->Auth->user() )
		{
			$this->Session->write('Flujo.loginPending', array('controller' => 'direcciones', 'action' => 'add'));
			$this->redirect(array('controller' => 'usuarios', 'action' => 'login'));
		}

		/**
		 * Comprueba que existan productos en el carro
		 */
		$carro				= $this->Carro->estado();

		if ( ! $carro['Cantidad'] )
		{
			if ( $lista )
			{
				$this->redirect(array('controller' => 'listas', 'action' => 'add'));
			}
			$this->redirect('/');
		}

		/**
		 * Guarda o actualiza la direccion
		 */
		if ( $this->request->is('post') )
		{
			
			$this->Direccion->create();
			if ( $direccion = $this->Direccion->save($this->request->data) )
			{
				$this->Session->write('Flujo.Carro.direccion_id', $direccion['Direccion']['id']);
				// prx($this->Session->read('Carro.Catalogos.catalogo.Productos'));
				$productonoLista = $this->Session->read('Carro.Catalogos.catalogo.Productos');
				if ( $lista && !$productonoLista )
				{
					$this->redirect(array('controller' => 'listas', 'action' => 'resumen'));
				}
				$this->redirect(array('controller' => 'compras', 'action' => 'resumen'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar tu dirección. Por favor intenta nuevamente.', null, array(), 'danger');
			}
		}
		// prx($lista);
		/**
		 * Lista de direcciones preexistentes
		 */
		$direcciones		= $this->Direccion->find('list', array(
			'conditions'		=> array(
				'Direccion.usuario_id'		=> $this->Auth->user('id'),
				'Direccion.activo'			=> true
			)
		));
		$regiones			= $this->Direccion->Comuna->Region->find('list');

		/**
		 * Camino de migas
		 */
		if ( $lista )
		{
			BreadcrumbComponent::add('Uniformes por colegio', array('controller' => 'listas', 'action' => 'add'));
		}
		else
		{
			BreadcrumbComponent::add('Carro de compras', array('controller' => 'productos', 'action' => 'carro'));
		}
		BreadcrumbComponent::add('Despacho');
		$this->set('title', 'Despacho');

		$this->set(compact('regiones', 'direcciones', 'lista'));
	}

	public function ajax_view($id = null)
	{
		$this->layout		= 'ajax';
		$data				= array('success' => false);

		if ( $this->Direccion->exists($id) )
		{
			$direccion			= $this->Direccion->find('first', array(
				'conditions'		=> array('Direccion.id' => $id),
				'contain'			=> array('Comuna')
			));
			$comunas			= $this->Direccion->Comuna->find('list', array(
				'conditions'		=> array('Comuna.region_id' => $direccion['Comuna']['region_id'])
			));
			$despacho			= $this->requestAction(sprintf('/tarifa_despachos/ajax_tarifa/%d', $direccion['Direccion']['comuna_id']), array('return'));
			$data				= array(
				'success'			=> true,
				'data'				=> array(
					'Direccion'			=> $direccion,
					'Comunas'			=> $comunas,
					'Despacho'			=> json_decode($despacho)
				)
			);
		}

		$this->set(compact('data'));
	}

	public function index()
	{
		if ( ! $this->Auth->user() )
		{
			$this->redirect('/');
		}

		$direcciones		= $this->Direccion->find('all', array(
			'conditions'		=> array(
				'Direccion.usuario_id'	=> $this->Auth->user('id'),
				'Direccion.activo'		=> true
			),
			'contain'			=> array('Comuna' => array('Region'))
		));
		$this->set(compact('direcciones'));
	}

	public function edit($id = null)
	{
		$this->Direccion->id		= $id;
		if ( ! $this->Direccion->exists() )
		{
			$this->redirect(array('action' => 'index'));
		}
		if ( ! $this->Auth->user() )
		{
			$this->redirect('/');
		}

		$direccion		= $this->Direccion->find('first', array(
			'conditions'		=> array(
				'Direccion.usuario_id'	=> $this->Auth->user('id'),
				'Direccion.activo'		=> true
			)
		));
		if ( ! $direccion )
		{
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') )
		{
			if ( $this->Direccion->save($this->request->data) )
			{
				$this->Session->setFlash('Dirección editada correctamente.', null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al editar la dirección. Por favor intentalo nuevamente.', null, array(), 'danger');
			}
		}
		else
		{
			$this->request->data		= $direccion;
		}

		$regiones			= $this->Direccion->Comuna->Region->find('list');
		$comuna				= $this->Direccion->Comuna->findById($direccion['Direccion']['comuna_id']);
		$comunas			= $this->Direccion->Comuna->find('list', array(
			'conditions'		=> array('Comuna.region_id' => $comuna['Comuna']['region_id'])
		));
		$this->request->data['Direccion']['region_id']		= $comuna['Comuna']['region_id'];
		$this->set(compact('regiones', 'comunas', 'region'));
	}

	public function delete($id = null)
	{
		$this->Direccion->id = $id;
		if ( ! $this->Direccion->exists() )
		{
			$this->Session->setFlash('Dirección no válida.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->Direccion->saveField('activo', false) )
		{
			$this->Session->setFlash('Dirección eliminada correctamente.', null, array(), 'success');
		}
		else
		{
			$this->Session->setFlash('Error al eliminar la dirección. Por favor intentalo nuevamente.', null, array(), 'danger');
		}
		$this->redirect(array('action' => 'index'));
	}

	public function admin_index()
	{
		$this->paginate		= array(
			'recursive'			=> 0
		);
		$direcciones	= $this->paginate();
		$this->set(compact('direcciones'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->Direccion->create();
			if ( $this->Direccion->save($this->request->data) )
			{
				$this->Session->setFlash("Registro agregado correctamente (ID {$this->Direccion->id})", null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
				$this->Session->setFlash('Error al guardar el registro. Por favor revisa los mensajes de validación.', null, array(), 'danger');
		}
		$usuarios	= $this->Direccion->Usuario->find('list');
		$comunas	= $this->Direccion->Comuna->find('list');
		$this->set(compact('usuarios', 'comunas'));
	}

	public function admin_edit($id = null)
	{
		if ( ! $this->Direccion->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->Direccion->save($this->request->data) )
			{
				$this->Session->setFlash("Registro editado correctamente (ID {$this->Direccion->id})", null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
				$this->Session->setFlash('Error al guardar el registro. Por favor revisa los mensajes de validación.', null, array(), 'danger');
		}
		else
		{
			$this->request->data	= $this->Direccion->find('first', array(
				'conditions'	=> array('Direccion.id' => $id)
			));
		}
		$usuarios	= $this->Direccion->Usuario->find('list');
		$comunas	= $this->Direccion->Comuna->find('list');
		$this->set(compact('usuarios', 'comunas'));
	}
}
