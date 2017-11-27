<?php
App::uses('AppController', 'Controller');
class BannersController extends AppController
{
	public function admin_ajax_reorden()
	{
		$this->layout			= 'ajax';
		$this->autoRender		= false;
		if ( $this->request->is('post') )
		{
			if ( ! empty($this->request->data['Banner']['orden']) )
			{
				$data			= array();
				foreach ( $this->request->data['Banner']['orden'] as $id => $orden )
				{
					array_push($data, array(
						'Banner'		=> array(
							'id'			=> $id,
							'orden'			=> $orden
						)
					));
				}
				$this->Banner->saveAll($data);
			}
		}
	}

	public function admin_index()
	{
		$banners		= $this->Banner->find('all', array(
			'contain'		=> array('Administrador'),
			'order'			=> array('Banner.orden' => 'ASC'),
		));

		$this->set(compact('banners'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->request->data	= $this->Banner->normalizaFechaVacia($this->request->data, array('fecha_inicio', 'fecha_fin'));
			$this->Banner->create();
			if ( $this->Banner->save($this->request->data) )
			{
				$this->Session->setFlash("Registro agregado correctamente", null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor revisa los mensajes de validación.', null, array(), 'danger');
			}
		}

		$paginas		= $this->Banner->Pagina->find('list');
		$this->set(compact('paginas'));
	}

	public function admin_edit($id = null)
	{
		if ( ! $this->Banner->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			$this->request->data	= $this->Banner->normalizaFechaVacia($this->request->data, array('fecha_inicio', 'fecha_fin'));
			if ( $this->Banner->save($this->request->data) )
			{
				$this->Session->setFlash("Registro editado correctamente", null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
				$this->Session->setFlash('Error al guardar el registro. Por favor revisa los mensajes de validación.', null, array(), 'danger');
		}
		else
		{
			$this->request->data	= $this->Banner->find('first', array(
				'conditions'	=> array('Banner.id' => $id)
			));
		}

		$tipoBanners		= $this->Banner->TipoBanner->find('list');
		$this->set(compact('tipoBanners'));
	}

	public function admin_delete($id = null)
	{
		$this->Banner->id = $id;
		if ( ! $this->Banner->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index' ));
		}

		$this->request->onlyAllow('post', 'delete');
		if ( $this->Banner->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intentalo nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_activar($id = null)
	{
		$this->Banner->id = $id;
		if ( ! $this->Banner->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index') );
		}

		if ( $this->Banner->saveField('activo', true) )
		{
			$this->Session->setFlash('Registro activado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index') );
		}
		$this->Session->setFlash('Error al activar el registro. Por favor intentalo nuevamente.', null, array(), 'danger');

		$this->redirect(array('action' => 'index') );
	}

	public function admin_desactivar($id = null)
	{
		$this->Banner->id = $id;
		if ( ! $this->Banner->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index') );
		}

		if ( $this->Banner->saveField('activo', false) )
		{
			$this->Session->setFlash('Registro desactivado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index') );
		}
		$this->Session->setFlash('Error al desactivar el registro. Por favor intentalo nuevamente.', null, array(), 'danger');

		$this->redirect(array('action' => 'index') );
	}

}
