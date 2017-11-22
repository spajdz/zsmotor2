<?php
App::uses('AppController', 'Controller');
class SucursalesController extends AppController
{
	public function index()
	{
		$sucursales		= $this->Sucursal->getSucursales();
		if ( ! $sucursales )
		{
			$this->redirect('/');
		}
		$sucursal		= $sucursales[0];

		/**
		 * Camino de migas
		 */
		BreadcrumbComponent::add('Nuestras Sucursales');
		$this->set('title', 'Nuestras Sucursales');

		$this->set(compact('sucursales', 'sucursal'));
	}

	public function view($slug = null)
	{
		if ( ! $this->Sucursal->findByslug($slug) )
		{
			$this->redirect(array('action' => 'index'));
		}

		$sucursal		= $this->Sucursal->getSucursal($slug);
		$sucursales		= $this->Sucursal->getSucursales();
		if ( ! $sucursales )
		{
			$this->redirect('/');
		}

		/**
		 * Camino de migas
		 */
		BreadcrumbComponent::add('Nuestras Sucursales', array('action' => 'index'));
		BreadcrumbComponent::add($sucursal['Sucursal']['NOKOSU']);
		$this->set('title', 'Nuestras Sucursales');

		$this->set(compact('sucursales', 'sucursal'));
		$this->render('index');
	}

	public function admin_index()
	{
		$sucursales		= $this->Sucursal->getSucursalesAdmin();
		$this->set(compact('sucursales'));
	}

	public function admin_activar_fijas()
	{
		$this->Sucursal->updateAll(
			array('Sucursal.activo'		=> true),
			array('Sucursal.temporal'	=> false)
		);
		$this->Session->setFlash('Sucursales fijas activadas', null, array(), 'success');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_activar_temporales()
	{
		$this->Sucursal->updateAll(
			array('Sucursal.activo'		=> true),
			array('Sucursal.temporal'	=> true)
		);
		$this->Session->setFlash('Sucursales temporales activadas', null, array(), 'success');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_desactivar_fijas()
	{
		$this->Sucursal->updateAll(
			array('Sucursal.activo'		=> false),
			array('Sucursal.temporal'	=> false)
		);
		$this->Session->setFlash('Sucursales fijas desactivadas', null, array(), 'success');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_desactivar_temporales()
	{
		$this->Sucursal->updateAll(
			array('Sucursal.activo'		=> false),
			array('Sucursal.temporal'	=> true)
		);
		$this->Session->setFlash('Sucursales temporales desactivadas', null, array(), 'success');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_ajax_reorden()
	{
		$this->layout			= 'ajax';
		$this->autoRender		= false;

		if ( $this->request->is('post') )
		{
			if ( ! empty($this->request->data['Sucursal']['orden']) )
			{
				$data			= array();
				foreach ( $this->request->data['Sucursal']['orden'] as $id => $orden )
				{
					array_push($data, array(
						'Sucursal'		=> array(
							'id'			=> $id,
							'orden'			=> $orden
						)
					));
				}
				$this->Sucursal->saveAll($data);
			}
		}
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->Sucursal->create();
			if ( $this->Sucursal->save($this->request->data) )
			{
				$this->Session->setFlash("Registro agregado correctamente (ID {$this->Sucursal->id})", null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
				$this->Session->setFlash('Error al guardar el registro. Por favor revisa los mensajes de validación.', null, array(), 'danger');
		}
		$administradores	= $this->Sucursal->Administrador->find('list');
		$this->set(compact('administradores'));
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
			if ( $this->Sucursal->save($this->request->data) )
			{
				$this->Session->setFlash("Registro editado correctamente (ID {$this->Sucursal->id})", null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
				$this->Session->setFlash('Error al guardar el registro. Por favor revisa los mensajes de validación.', null, array(), 'danger');
		}
		else
		{
			$this->request->data	= $this->Sucursal->find('first', array(
				'conditions'	=> array('Sucursal.id' => $id)
			));
		}
		$administradores	= $this->Sucursal->Administrador->find('list');
		$this->set(compact('administradores'));
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
		$this->Session->setFlash('Error al eliminar el registro. Por favor intentalo nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_activar($id = null)
	{
		$this->Sucursal->id = $id;
		if ( ! $this->Sucursal->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->Sucursal->saveField('activo', true) )
		{
			$this->Session->setFlash('Registro activado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al activar el registro. Por favor intentalo nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_desactivar($id = null)
	{
		$this->Sucursal->id = $id;
		if ( ! $this->Sucursal->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->Sucursal->saveField('activo', false) )
		{
			$this->Session->setFlash('Registro desactivado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al desactivar el registro. Por favor intentalo nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}
}
