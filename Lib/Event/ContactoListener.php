<?php
App::uses('CakeEventListener', 'Event');
App::uses('View', 'View');
class ContactoListener implements CakeEventListener
{
	public $View				= null;
	public $Configuracion		= null;
	public $Email				= null;
	public $sender				= null;
	public $staff				= null;


	public function implementedEvents()
	{
		return array(
			'Model.Contacto.afterSave'	=> 'enviarEmail'
		);
	}

	public function enviarEmail(CakeEvent $evento)
	{
		/**
		 * Instancia las clases necesarias e inicializa la configuracion
		 * requerida para guardar los emails
		 */
		if ( ! $this->View || ! $this->Configuracion || ! $this->Email )
		{
			/**
			 * Instancias
			 */
			$this->View					= new View();
			$this->Configuracion		= ClassRegistry::init('Configuracion');
			$this->Email				= ClassRegistry::init('Email');

			/**
			 * Configuracion
			 */
			$this->View->viewPath		= 'Emails' . DS . 'html';
			$this->View->layoutPath		= 'Emails' . DS . 'html';

			/**
			 * Sender y staff mail
			 */
			$this->Configuracion		= ClassRegistry::init('Configuracion');
			$this->sender				= $this->Configuracion->findByNombre('MAILING_CONTACTO');
			$this->staff				= $this->Configuracion->findByNombre('MAIL_STAFF_CONTACTO');
		}

		$this->enviarEmailUsuario($evento);
		$this->enviarEmailStaff($evento);
	}

	public function enviarEmailUsuario(CakeEvent $evento)
	{
		/**
		 * Html del correo
		 */
		$contacto					= $evento->data;
		$this->View->hasRendered	= false;
		$this->View->set(compact('contacto'));
		$html						= $this->View->render('contacto_usuario', 'default');

		/**
		 * Guarda el mail a enviar al usuario
		 */
		$this->Email->create();
		$this->Email->save(array(
			'asunto'					=> 'Contacto Web',
			'destinatario_email'		=> (! empty($contacto['Usuario']['id']) ? $contacto['Usuario']['email'] : $contacto['Contacto']['email']),
			'destinatario_nombre'		=> (
												! empty($contacto['Usuario']['id']) ?
												sprintf('%s %s %s', $contacto['Usuario']['nombre'], $contacto['Usuario']['apellido_paterno'], $contacto['Usuario']['apellido_materno']) :
												$contacto['Contacto']['nombre']
										   ),
			'remitente_email'			=> $this->sender['Configuracion']['valor'],
			'remitente_nombre'			=> $this->sender['Configuracion']['adicional'],
			'cc'						=> null,
			'bcc'						=> null,
			'origen'					=> null,
			'via'						=> null,
			'procesado'					=> false,
			'enviado'					=> false,
			'reintentos'				=> 0,
			'html'						=> $html,
			'atachado'					=> null,
			'traza'						=> null,
		));
	}

	public function enviarEmailStaff(CakeEvent $evento)
	{
		/**
		 * Html del correo
		 */
		$contacto					= $evento->data;
		$this->View->hasRendered	= false;
		$this->View->set(compact('contacto'));
		$html						= $this->View->render('contacto_staff', 'default');

		/**
		 * Guarda el mail a enviar al staff
		 */
		$this->Email->create();
		$this->Email->save(array(
			'asunto'					=> 'Contacto Web',
			'destinatario_email'		=> $this->staff['Configuracion']['valor'],
			'destinatario_nombre'		=> 'Staff Contacto Hookipa',
			'remitente_email'			=> $this->sender['Configuracion']['valor'],
			'remitente_nombre'			=> $this->sender['Configuracion']['adicional'],
			'cc'						=> null,
			'bcc'						=> null,
			'origen'					=> null,
			'via'						=> null,
			'procesado'					=> false,
			'enviado'					=> false,
			'reintentos'				=> 0,
			'html'						=> $html,
			'atachado'					=> null,
			'traza'						=> null,
		));
	}
}
