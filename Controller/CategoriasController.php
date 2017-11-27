<?php
App::uses('AppController', 'Controller');
class CategoriasController extends AppController
{

	public function admin_index()
	{
	
        if ( $this->request->is('post') )
        {
        	//LIMPIIO EL MENU 
			$categoriasSeleccionadas = $this->Categoria->find('list',array(
					'fields'=>array('id'),
					'conditions'=>array('Categoria.menu <> 0')
				)
			);
	        $categoriasChangeMenu = array();
	        $i = 0;
	        foreach ($categoriasSeleccionadas as $key => $value) {
	        	# code...
	        	$categoriasChangeMenu[$i]['Categoria']['id'] = $value;
	        	$categoriasChangeMenu[$i]['Categoria']['menu'] = 0;
	        	$i++;
	        }
	        $this->Categoria->saveAll($categoriasChangeMenu);
        	//CARGO EL NUEVO MENU
            $categoriasIn = array();
	        $j = 0;
            foreach ($this->request->data['categoriasSeleccionadas'] as $key => $value) {
            	$categoriasIn[$j]['Categoria']['id'] = $value;
            	$categoriasIn[$j]['Categoria']['menu'] = 1;
	        	$j++;
            }
	        
            if ( $this->Categoria->saveAll($categoriasIn) )
            {
                $this->Session->setFlash('Menu guardado correctamente.', null, array(), 'success');
                $this->redirect(array('action' => 'index'));
            }
            else
            {
                $this->Session->setFlash('Error al guardar el Menu. Por favor intenta nuevamente.', null, array(), 'danger');
            }
        }	
		$categorias = $this->Categoria->find('threaded',array(
				'fields'=>array(
					'id'
					,'nombre'
					,'slug'
					,'parent_id'
				),
				'conditions' => array(
					'NOT' => array(
						'Categoria.id' => array(1,2,3)
					)
				)
			)
		);
		$categoriasSeleccionadas = $this->Categoria->find('list',array(
				'fields'=>array('id'),
				'conditions'=>array('Categoria.menu <> 0'),
			)
		);
		// prx($categorias);
		$this->set(compact('categorias','categoriasSeleccionadas'));
	}
	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->Categoria->create();
			if ( $this->Categoria->save($this->request->data) )
			{
				$this->Session->setFlash("Registro agregado correctamente (ID {$this->Categoria->id})", null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor revisa los mensajes de validación.', null, array(), 'danger');
			}
		}
		$parents	= $this->Categoria->Parent->find('list');
		$this->set(compact('parents'));
	}
	public function admin_edit($id = null)
	{
		if ( ! $this->Categoria->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}
		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->Categoria->save($this->request->data) )
			{
				$this->Session->setFlash("Registro editado correctamente (ID {$this->Categoria->id})", null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
				$this->Session->setFlash('Error al guardar el registro. Por favor revisa los mensajes de validación.', null, array(), 'danger');
		}
		else
		{
			$this->request->data	= $this->Categoria->find('first', array(
				'conditions'	=> array('Categoria.id' => $id)
			));
		}
		$parents	= $this->Categoria->Parent->find('list');
		$this->set(compact('parents'));
	}
	public function admin_delete($id = null)
	{
		$this->Categoria->id = $id;
		if ( ! $this->Categoria->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}
		$this->request->onlyAllow('post', 'delete');
		if ( $this->Categoria->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intentalo nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}
}
