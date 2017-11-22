<?php
App::uses('AppModel', 'Model');
App::uses('String', 'Utility');
class Sucursal extends AppModel
{
	/**
	 * CONFIGURACION DB
	 */

	/**
	 * BEHAVIORS
	 */
	var $actsAs			= array(
		/**
		 * IMAGE UPLOAD
		 */
		/*
		'Image'		=> array(
			'fields'	=> array(
				'imagen'	=> array(
					'versions'	=> array(
						array(
							'prefix'	=> 'mini',
							'width'		=> 100,
							'height'	=> 100,
							'crop'		=> true
						)
					)
				)
			)
		)
		*/
	);

	/**
	 * VALIDACIONES
	 */
	public $validate = array(
		'KOSU' => array(
			'notBlank' => array(
				'rule'			=> array('notBlank'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
	);

	/**
	 * ASOCIACIONES
	 */
	public $belongsTo = array(
		'Administrador' => array(
			'className'				=> 'Administrador',
			'foreignKey'			=> 'administrador_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'counterCache'			=> false,
			'counterScope'			=> array('Asociado.modelo' => 'Administrador')
		)
	);


	/**
	 * Obtiene el listado de sucursales para el backend
	 */
	public function getSucursalesAdmin()
	{
		$this->Query		= ClassRegistry::init('Query');
		$sucursales			= array();

		/**
		 * Obtiene las querys a ejecutar
		 */
		$carga				= $this->Query->getProductiva('SUCURSALES_CARGA');
		$lista				= $this->Query->getProductiva('SUCURSALES_LISTA');
		if ( $lista )
		{
			/**
			 * Ejecuta las querys
			 */
			try
			{
				$this->usarDsBooks();
				$this->query($carga['Query']['query']);
				$sucursales		= $this->query($lista['Query']['query']);
				$this->usarDsLocal();
			}
			catch ( PDOException $error )
			{
				// TODO: Informar error de categorias
			}
		}

		foreach ( $sucursales as &$sucursal )
		{
			$sucursal[$this->alias]		= $sucursal[0];
			unset($sucursal[0]);
		}

		return $sucursales;
	}


	/**
	 * Obtiene el listado de sucursales para la pagina publica
	 */
	public function getSucursales()
	{
		$this->Query		= ClassRegistry::init('Query');
		$sucursales			= array();

		/**
		 * Obtiene las querys a ejecutar
		 */
		$lista				= $this->Query->getProductiva('SUCURSALES_LISTA_PUBLICA');
		if ( $lista )
		{
			/**
			 * Ejecuta las querys
			 */
			try
			{
				$this->usarDsBooks();
				$sucursales		= $this->query($lista['Query']['query']);
				$this->usarDsLocal();
			}
			catch ( PDOException $error )
			{
				// TODO: Informar error de categorias
			}
		}

		foreach ( $sucursales as &$sucursal )
		{
			$sucursal[$this->alias]		= $sucursal[0];
			unset($sucursal[0]);
		}

		return $sucursales;
	}

	/**
	 * Obtiene los detalles de una sucursal especifica
	 */
	public function getSucursal($slug = null)
	{
		if ( ! $slug )
		{
			return false;
		}

		$this->Query		= ClassRegistry::init('Query');
		$sucursal			= array();

		/**
		 * Obtiene las querys a ejecutar
		 */
		$detalles			= $this->Query->getProductiva('SUCURSALES_VER');
		if ( $detalles )
		{
			/**
			 * Ejecuta las querys
			 */
			try
			{
				$this->usarDsBooks();
				$sql			= String::insert($detalles['Query']['query'], array('SLUG' => $slug));
				$sucursal		= $this->query($sql);
				$this->usarDsLocal();
			}
			catch ( PDOException $error )
			{
				// TODO: Informar error de categorias
			}
		}

		if ( $sucursal )
		{
			$sucursal['Sucursal'] = $sucursal[0][0];
			unset($sucursal[0]);
		}

		return $sucursal;
	}


	/**
	 * CALLBACKS
	 */
	public function beforeSave($options = array())
	{
		parent::beforeSave($options);

		/**
		 * Actualiza el usuario que modifica la query
		 */
		if ( ! isset($this->data[$this->alias]['administrador_id']) )
		{
			$this->data[$this->alias]['administrador_id']		= AuthComponent::user('id');
		}

		return true;
	}
}
