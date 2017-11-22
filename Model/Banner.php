<?php
App::uses('AppModel', 'Model');
class Banner extends AppModel
{
	/**
	 * CONFIGURACION DB
	 */
	public $displayField	= 'nombre';

	/**
	 * BEHAVIORS
	 */
	var $actsAs			= array(
		/**
		 * IMAGE UPLOAD
		 */
		'Image'		=> array(
			'fields'	=> array(
				'imagen'	=> array(
					'versions'	=> array(
						array(
							'prefix'	=> 'banner',
							'width'		=> 670,
							'height'	=> 320,
							'crop'		=> true
						),
						array(
							'prefix'	=> 'mini',
							'width'		=> 50,
							'height'	=> 30,
							'crop'		=> true
						)
					)
				),
				'imagen_mobile'	=> array(
					'versions'	=> array(
						array(
							'prefix'	=> 'mobile',
							'width'		=> 295,
							'height'	=> 273,
							'crop'		=> true
						),
						array(
							'prefix'	=> 'mini',
							'width'		=> 50,
							'height'	=> 30,
							'crop'		=> true
						)
					)
				)
			)
		)
	);

	/**
	 * VALIDACIONES
	 */
	public $validate = array(
		'nombre' => array(
			'notBlank' => array(
				'rule'			=> array('notBlank'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'imagen' => array(
			'notBlank' => array(
				//'rule'			=> array('notBlank'),
				//'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				'allowEmpty'		=> false
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
				),
			),
		'imagen_mobile' => array(
			'notBlank' => array(
				//'rule'			=> array('notBlank'),
				//'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				'allowEmpty'		=> false
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
				),
			),
		'fecha_inicio' => array(
			'datetime' => array(
				'rule'			=> array('datetime'),
				'last'			=> true,
				'allowEmpty'    => true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'fecha_fin' => array(
			'datetime' => array(
				'rule'			=> array('datetime'),
				'last'			=> true,
				'allowEmpty'    => true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
			'checkDate' => array(
				'rule'            => array('checkDate'),
				'last'            => true,
				'message'        => 'La fecha fin debe ser mayor a la fecha inicio.',
				//'allowEmpty'    => true,
				//'required'        => false,
				//'on'            => 'update', // Solo valida en operaciones de 'create' o 'update'
			)
		),
		'activo' => array(
			'boolean' => array(
				'rule'			=> array('boolean'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'orden' => array(
			'numeric' => array(
				'rule'			=> array('numeric'),
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
		),
		'TipoBanner' => array(
			'className'				=> 'TipoBanner',
			'foreignKey'			=> 'tipo_banner_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'counterCache'			=> false,
			'counterScope'			=> array('Asociado.modelo' => 'TipoBanner')
		)
	);

	public function checkDate($a, $b)
	{
		$fecha_inicio        = DateTime::createFromFormat('Y-m-d H:i:s', $this->data['Banner']['fecha_inicio']);
		$fecha_fin           = DateTime::createFromFormat('Y-m-d H:i:s', $this->data['Banner']['fecha_fin']);
		if ( $fecha_inicio != '' || $fecha_inicio != null )
		{
			if ( $fecha_fin != '' || $fecha_fin != null )
			{
				$diff = $fecha_inicio->diff($fecha_fin);
				if ( $fecha_inicio == $fecha_fin || $fecha_inicio > $fecha_fin )
				{
					return false;
				}
			}
		}
		return true;
	}

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

		/**
		 * Orden inicial
		 */
		if ( ! $this->id && ! isset($this->data[$this->alias][$this->primaryKey]) )
		{
			$this->data[$this->alias]['orden']					= $this->find('count') + 1;
		}

		return true;
	}
}
