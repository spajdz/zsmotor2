<?php
App::uses('AppModel', 'Model');
class Compra extends AppModel
{
	/**
	 * Estados de compra
	 */
	var $pendiente				= 1;
	var $rechazo_transbank		= 2;
	var $rechazo_comercio		= 3;
	var $rechazo				= array(2, 3);
	var $pagado					= 4;

	/**
	 * CONFIGURACION DB
	 */

	/**
	 * BEHAVIORS
	 */
	var $actsAs			= array();

	/**
	 * VALIDACIONES
	 */
	public $validate = array(
		'usuario_id' => array(
			'validateForeignKey' => array(
				'rule'			=> array('validateForeignKey'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'estado_compra_id' => array(
			'validateForeignKey' => array(
				'rule'			=> array('validateForeignKey'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'direccion_id' => array(
			'validateForeignKey' => array(
				'rule'			=> array('validateForeignKey'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'subtotal' => array(
			'numeric' => array(
				'rule'			=> array('numeric'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'valor_despacho' => array(
			'numeric' => array(
				'rule'			=> array('numeric'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'total' => array(
			'numeric' => array(
				'rule'			=> array('numeric'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'peso' => array(
			'numeric' => array(
				'rule'			=> array('numeric'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
	);

	/**
	 * ASOCIACIONES
	 */
	public $belongsTo = array(
		'Usuario' => array(
			'className'				=> 'Usuario',
			'foreignKey'			=> 'usuario_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'counterCache'			=> false,
			'counterScope'			=> array('Asociado.modelo' => 'Usuario')
		),
		'EstadoCompra' => array(
			'className'				=> 'EstadoCompra',
			'foreignKey'			=> 'estado_compra_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'counterCache'			=> false,
			'counterScope'			=> array('Asociado.modelo' => 'EstadoCompra')
		),
		'EstadoCompraDespacho' => array(
			'className'				=> 'EstadoCompraDespacho',
			'foreignKey'			=> 'estado_compra_despacho_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'counterCache'			=> false,
			'counterScope'			=> array('Asociado.modelo' => 'EstadoCompraDespacho')
		),
		'Direccion' => array(
			'className'				=> 'Direccion',
			'foreignKey'			=> 'direccion_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'counterCache'			=> false,
			'counterScope'			=> array('Asociado.modelo' => 'Direccion')
		),
		'DespachoGratuito' => array(
			'className'				=> 'DespachoGratuito',
			'foreignKey'			=> 'despacho_gratuito_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'counterCache'			=> false,
			'counterScope'			=> array('Asociado.modelo' => 'DespachoGratuito')
		)
	);
	public $hasMany = array(
		'Despacho' => array(
			'className'				=> 'Despacho',
			'foreignKey'			=> 'compra_id',
			'dependent'				=> false,
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'limit'					=> '',
			'offset'				=> '',
			'exclusive'				=> '',
			'finderQuery'			=> '',
			'counterQuery'			=> ''
		),
		'DetalleCompra' => array(
			'className'				=> 'DetalleCompra',
			'foreignKey'			=> 'compra_id',
			'dependent'				=> false,
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'limit'					=> '',
			'offset'				=> '',
			'exclusive'				=> '',
			'finderQuery'			=> '',
			'counterQuery'			=> ''
		)
	);
	public $hasAndBelongsToMany = array(
		'Descuento' => array(
			'className'				=> 'Descuento',
			'joinTable'				=> 'descuentos_compras',
			'foreignKey'			=> 'compra_id',
			'associationForeignKey'	=> 'descuento_id',
			'unique'				=> true,
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'limit'					=> '',
			'offset'				=> '',
			'finderQuery'			=> '',
			'deleteQuery'			=> '',
			'insertQuery'			=> ''
		)
	);


	/**
	 * Registra o actualiza los datos del carro de compra actual a la base de datos
	 * para finalizar la compra con Transbank
	 *
	 * @param			array			$productos			Productos directamente desde el carro
	 * @param			array			$direccion_id		ID de la direccion de despacho
	 * @param			array			$peso				Peso total del carro (para calcular despacho)
	 * @param			array			$reserva			Si la transaccion es via reserva o no
	 * @return			array								Data full de la compra ingresada
	 */
	public function registrarCarro($productos = array(), $direccion_id = null, $peso = 0, $reserva = false, $lista = false, $retiro_tienda = false, $tienda_retiro = false, $observacion = '')
	{
		if ( empty($productos) )
		{
			return false;
		}

		/**
		 * Informacion de la direccion
		 */
		$direccion		= null;
		if ( ! empty($direccion_id) )
		{
			$direccion				= $this->Direccion->find('first', array(
				'conditions'			=> array('Direccion.id' => $direccion_id),
				'callbacks'				=> false
			));
			if ( ! $direccion )
			{
				return false;
			}
		}

		/**
		 * Calcula el subtotal y formatea el detalle de la compra
		 */
		$subtotal				= 0;
		$valor_despacho			= 0;
		$detalles				= array();
		foreach ( $productos as $catalogo => $data )
		{
			/**
			 * Detecta multi catalogos
			 */
			$productos_carro		= array();
			if ( empty($data['Productos']) )
			{
				foreach ( $data as $subcatalogo => $subdata )
				{
					foreach ( $subdata['Productos'] as $subid => $subproducto )
					{
						$productos_carro[]	= $subproducto;
					}
				}
			}
			else
			{
				$productos_carro		= $data['Productos'];
			}

			foreach ( $productos_carro as $producto )
			{
				$subtotal				+= ($producto['Meta']['Precio'] * $producto['Meta']['Cantidad']);
				$detalle				= array(
					'producto_id'				=> $producto['Data']['Producto']['id'],
					'cantidad'					=> $producto['Meta']['Cantidad'],
					'precio_unitario'			=> $producto['Data']['Producto']['preciofinal_publico'],
					'total'						=> ($producto['Data']['Producto']['preciofinal_publico'] * $producto['Meta']['Cantidad']),
					'peso'						=> (empty($producto['Data']['Producto']['peso']) ? 0 : $producto['Data']['Producto']['peso'])
				);

				/**
				 * Determina el origen del producto
				 */
				switch ( $catalogo )
				{
					case 'lista':
					{
						$detalle		= array_merge($detalle, array(
							'via_lista'			=> true,
							'lista_id'			=> $producto['Meta']['lista_id']
						));
						break;
					}
					case 'reserva':
					{
						$detalle		= array_merge($detalle, array(
							'via_reserva'		=> true,
							'reserva_id'		=> $producto['Meta']['reserva_id']
						));
						break;
					}
					case 'catalogo':
					{
						$detalle		= array_merge($detalle, array(
							'via_catalogo'		=> true,
							'lista_precio'		=> 'catalogo'
						));
						break;
					}
					case 'deportes':
					{
						$detalle		= array_merge($detalle, array(
							'via_catalogo'		=> true,
							'lista_precio'		=> 'deportes'
						));
						break;
					}
					case 'bits':
					{
						$detalle		= array_merge($detalle, array(
							'via_catalogo'		=> true,
							'lista_precio'		=> 'bits'
						));
						break;
					}
				}
				array_push($detalles, $detalle);
			}
		}
		$data					= array(
			'Compra'				=> array(
				'usuario_id'				=> AuthComponent::user('id'),
				'estado_compra_id'			=> 1,
				'direccion_id'				=> $direccion_id,
				'despacho_gratis'			=> 0, 
				'subtotal'					=> $subtotal,
				'valor_despacho'			=> $valor_despacho,
				'total_descuentos'			=> 0,
				'total'						=> ($subtotal + $valor_despacho),
				'pagado'					=> false,
				'aceptado'					=> false,
				'reversado'					=> false,
				'modified'					=>  date('Y-m-d H:i:s'),
				'created'					=>  date('Y-m-d H:i:s'),
			),
			'DetalleCompra'			=> $detalles
		);

		/**
		 * Si la compra ya existe, actualiza sus datos y borra el detalle para reescribirlo
		 */
		if ( $this->id )
		{
			$data['Compra']['id']		= $this->id;
			$this->DetalleCompra->deleteAll(
				array('DetalleCompra.compra_id' => $this->id),
				false, false
			);
		}

		// prx($data);

		/**
		 * Guarda la compra
		 */
		if ( $this->saveAll($data) )
		{
			return $this->find('first', array(
				'conditions'		=> array('Compra.id' => $this->id),
				'contain'			=> array(
					'Usuario',
					'DetalleCompra'		=> array('Producto'),
					'EstadoCompra',
					'Direccion'			=> array('Comuna' => array('Region')),
				)
			));
		}else{
			prx($this->validationErrors );
		}

		return false;
	}


	/**
	 * Devuelve el estado actual de una compra
	 *
	 * @param			array			$id					ID de la compra en proceso
	 * @return			int									ID del estado actual de la compra
	 */
	public function estado($id = null)
	{
		if ( ! $this->exists($id) )
		{
			return false;
		}

		$compra		= $this->find('first', array(
			'fields'		=> array('Compra.estado_compra_id'),
			'conditions'	=> array('Compra.id' => $id),
			'callbacks'		=> false
		));
		return (int) $compra['Compra']['estado_compra_id'];
	}


	/**
	 * Devuelve si la compra esta pendiente de pago
	 *
	 * @param			array			$id					ID de la compra en proceso
	 * @return			int									ID del estado actual de la compra
	 */
	public function pendiente($id = null)
	{
		if ( ! $this->exists($id) )
		{
			return false;
		}

		return (bool) $this->find('count', array(
			'conditions'	=> array(
				'Compra.id'						=> $id,
				'Compra.estado_compra_id'		=> $this->pendiente
			),
			'callbacks'		=> false
		));
	}


	/**
	 * Devuelve si la compra esta rechazada
	 *
	 * @param			array			$id					ID de la compra en proceso
	 * @return			int									ID del estado actual de la compra
	 */
	public function rechazada($id = null)
	{
		if ( ! $this->exists($id) )
		{
			return false;
		}

		return (bool) $this->find('count', array(
			'conditions'	=> array(
				'Compra.id'						=> $id,
				'Compra.estado_compra_id'		=> $this->rechazo
			),
			'callbacks'		=> false
		));
	}


	/**
	 * Devuelve si la compra esta pagada
	 *
	 * @param			array			$id					ID de la compra en proceso
	 * @return			int									ID del estado actual de la compra
	 */
	public function pagada($id = null)
	{
		if ( ! $this->exists($id) )
		{
			return false;
		}
		
		return (bool) $this->find('count', array(
			'conditions'	=> array(
				'Compra.id'						=> $id,
				'Compra.estado_compra_id'		=> $this->pagado
			),
			'callbacks'		=> false
		));
	}


	/**
	 * Cambia el estado de una compra
	 *
	 * @param			array			$id					ID de la compra en proceso
	 * @param			string			$estado				Identificador del estado (ver mas abajo)
	 * @param			string			$detalle			[OPCIONAL] Detalle del cambio de estado
	 * @param			bool			$aceptado			[OPCIONAL] OC aceptada por comercio
	 * @param			bool			$reversado			[OPCIONAL] OC reversada por comercio
	 * @return			int									ID del estado actual de la compra
	 */
	public function cambiarEstado($id = null, $estado = null, $detalle = null, $aceptado = false, $reversado = false)
	{
		if ( ! $this->exists($id) || ! $estado )
		{
			return false;
		}
		$data					= array();

		switch ( $estado )
		{
			case 'PENDIENTE':
				$data		= array(
					'estado_compra_id'	=> $this->pendiente
				);
				break;
			case 'RECHAZO_TRANSBANK':
				$data		= array(
					'estado_compra_id'	=> $this->rechazo_transbank
				);
				break;
			case 'RECHAZO_COMERCIO':
				$data		= array(
					'estado_compra_id'	=> $this->rechazo_comercio
				);
				break;
			case 'PAGADO':
				$data		= array(
					'estado_compra_id'	=> $this->pagado,
					'pagado'			=> true
				);
				break;
		}

		if ( empty($data) )
		{
			return false;
		}

		$save = $this->save(array(
			'id'					=> $id,
			'detalle_estado'		=> $detalle,
			'aceptado'				=> $aceptado,
			'reversado'				=> $reversado
		) + $data);

		return (bool) $save;
	}

	public function afterSave($created, $options = array())
	{
		parent::afterSave($created, $options);


		/**
		 * Envia mail al usuario por su compra pagada
		 * Tambien envia el o los emails con la reserva, si corresponde
		 */
		if ( ! empty($this->data[$this->name]['estado_compra_id']) && $this->data[$this->name]['estado_compra_id'] == $this->pagado )
		{
			/**
			 * Informacion completa de la compra
			 */
			$compra			= $this->find('first', array(
				'conditions'		=> array('Compra.id' => $this->data[$this->name]['id']),
				'contain'			=> array(
					'Usuario',
					'DetalleCompra'		=> array('Producto'),
					'EstadoCompra',
					'Direccion'			=> array('Comuna' => array('Region')),
					'Sucursal'
				)
			));


			/**
			 * Tipo de pago y cuota
			 */
			$compra['Compra']['tipo_pago']		= TransbankComponent::tipoPago($compra['Compra']['tbk_tipo_pago']);
			$compra['Compra']['tipo_cuota']		= TransbankComponent::tipoCuota($compra['Compra']['tbk_tipo_pago']);

			// $evento			= new CakeEvent('Model.Compra.afterSave', $this, $compra);
			// $this->getEventManager()->dispatch($evento);
		}
	}

	/**
	 * Funcion que permite organizar un arreglo de condiciones, de acuerdo con el filtro
	 * realizado en el index.
	 * @param			Object			$filtros			arreglo con los datos del filtro
	 * @return			object								arreglo con las condiciones necesarias
	 */
	public function condicionesFiltros($filtros = null)
	{
		$condiciones		= array();
		if ( ! empty($filtros['filtro']) )
		{
			// LIBRE
			if ( ! empty($filtros['filtro']['buscar']) )
			{
				// Cuando la busqueda libre es un numero
				if ( is_numeric($filtros['filtro']['buscar']) )
				{
					array_push($condiciones, array(
						'OR'	=> array(
							'Compra.id'					=> $filtros['filtro']['buscar'],
							'Compra.total'				=> $filtros['filtro']['buscar'],
							'Usuario.celular'			=> $filtros['filtro']['buscar'],
						)
					));
				}
				else
				{
					array_push($condiciones, array(
						'OR'	=> array(
							'[Usuario].[nombre] + [Usuario].[apellido_paterno] + [Usuario].[apellido_materno] + [Usuario].[email] LIKE' => sprintf('%%%s%%', $filtros['filtro']['buscar'])
						)
					));
				}
			}
			// FECHA INICIAL
			if ( ! empty( $filtros['filtro']['fecha_min']) )
			{
				/** Se agrega la condicion al arreglo */
				array_push($condiciones, array(
					'OR'	=> array(
						'Compra.created >='		=> sprintf('%s 00:00:00', $filtros['filtro']['fecha_min'])
					)
				));
			}
			// FECHA FINAL
			if ( ! empty( $filtros['filtro']['fecha_max']) )
			{
				/** Se agrega la condicion al arreglo */
				array_push($condiciones, array(
					'OR'	=> array(
						'Compra.created <= '	=> sprintf('%s 23:59:59', $filtros['filtro']['fecha_max'])
					)
				));
			}
			// ESTADO COMPRA
			if ( ! empty( $filtros['filtro']['estado']) )
			{
				array_push($condiciones, array(
					'OR'	=> array(
						'Compra.estado_compra_id'	=> $filtros['filtro']['estado']
					)
				));
			}
			// RANGO ID
			if ( ! empty($filtros['filtro']['oc_min']) )
			{
				array_push($condiciones, array(
					'AND'	=> array(
						'Compra.id >='		=> $filtros['filtro']['oc_min'],
						'Compra.id <='		=> $filtros['filtro']['oc_max']
					)
				));
			}
			// RANGO VALOR
			if ( ! empty($filtros['filtro']['monto_min']) )
			{
				array_push($condiciones, array(
					'AND'	=> array(
						'Compra.total >='		=> $filtros['filtro']['monto_min'],
						'Compra.total <='		=> $filtros['filtro']['monto_max']
					)
				));
			}
			// FILTRO POR RESERVA Y LISTA
			array_push($condiciones, array(
				'AND'	=> array(
					'Compra.reserva'	=> ( ! empty($filtros['filtro']['reserva']) ? true : false),
					'Compra.lista'		=> ( ! empty($filtros['filtro']['lista']) ? true : false)
				)
			));
		}
		if ( ! empty($condiciones) )
		{
			return $condiciones;
		}
		return false;
	}

	/**
	 * Funcion que permite obtener el listado de las OC, dependiedo el tipo
	 * @param			object			$reserva			Tipo de resgitro de OC (compra - reserva)
	 * @param			object			$resgistro			Cantidad de registro que se desea obtener
	 * @return			object								Arreglo con el listados de los registros
	 */
	public function registrosOC($reserva = false, $lista = false, $resgistro = null)
	{
		$datos_oc		=	$this->find('all', array(
			'conditions'		=> array(
				'Compra.reserva' 	=> ($reserva ? true : false),
				'Compra.lista'		=> ($lista ? true : false)
			),
			'contain'			=> array('Usuario', 'EstadoCompra'),
			'order'				=> array('Compra.created' => 'DESC'),
			'limit'				=> $resgistro
		));

		if ( ! empty($datos_oc) )
		{
			return $datos_oc;
		}
		return false;
	}
	/**
	 * Funcion que permite obtener la suma de los valores de acuardo al tipo,
	 * en un rago de fechas determinado
	 * @param			object			$fecha_incio
	 * @param			object			$fecha_fin
	 * @param			Boolean			$reserva				Variable que indica si es compra o reserva
	 * @param			Boolean			$lista					Variable que indica si es lista o no
	 * @return			object									Arreglo con el valor obtenido
	 */
	public function valorTotalRegistroOC($fecha_incio, $fecha_fin, $reserva = false, $lista = false)
	{
		$alias = ( $lista ? 'total_lista' : ( ! $reserva ? 'total_compra' : 'total_reserva'));

		$valor_total 	= $this->find('first', array(
			'conditions'					=>	array(
				'estado_compra_id' 				=> 4,
				'Compra.reserva'				=> $reserva,
				'Compra.lista'					=> $lista,
				'Compra.created >='				=> sprintf('%s 00:00:00', $fecha_incio),
				'Compra.created <='				=> sprintf('%s 23:59:59', $fecha_fin)
			),
			'fields'						=>	array(sprintf('SUM(total) AS %s', $alias)),
		));
		if ( empty($valor_total[0][$alias]) )
		{
			$valor_total[0][$alias] = "0";
		}
		return $valor_total[0];
	}

	public function widgetsDashboard($fecha, $mesOperacional)
	{
		$widgets 		= array(
			'total_compras'						=> 0,
			'total_compras_mes_actual'			=> 0,
			'total_compras_mes_anterior'		=> 0,

			'total_valor_compra'				=> 0,
			'valor_compra_mes_actual'			=> 0,
			'valor_compra_mes_anterior'			=> 0,

			'total_reserva'						=> 0,
			'total_reserva_mes_actual'			=> 0,
			'total_reserva_mes_anterior'		=> 0,
			'total_valor_reservas'				=> 0,
			'total_valor_reservas_actual'		=> 0,
			'total_valor_reservas_anterior'		=> 0,

			'total_listas'						=> 0,
			'total_lista_mes_actual'			=> 0,
			'total_lista_mes_anterior'			=> 0,
			'total_valor_listas'				=> 0,
			'total_valor_listas_actual'			=> 0,
			'total_valor_listas_anterior'		=> 0,
			'mesOperacionalAnterior'			=> $mesOperacional
		);

		if ( $this->find('first') )
		{
			$widgets 		= array(
				/** Cantidad total de compras*/
				'total_compras'					=>	$this->find('count', array(
					'conditions'					=>	array('estado_compra_id' => 4),
				)),
				/** Cantidad total de compras del mes actual*/
				'total_compras_mes_actual'		=>	$this->find('count', array(
					'conditions'					=>	array(
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[0]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[0]['fin']),
						'estado_compra_id' 				=> 4
					)
				)),
				/** Cantidad total de compras del mes actual*/
				'total_compras_mes_anterior'	=>	$this->find('count', array(
					'conditions'					=>	array(
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[1]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[1]['fin']),
						'estado_compra_id' 				=> 4
					)
				)),

				/** Valor total de las compras */
				'total_valor_compra'			=>	$this->find('first', array(
					'conditions'					=>	array('estado_compra_id' => 4),
					'fields'						=>	array('SUM(total) AS total')
				))[0]['total'],
				/** Valor total de las compras del mes actual*/
				'valor_compra_mes_actual'		=>	$this->find('first', array(
					'conditions'					=>	array(
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[0]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[0]['fin']),
						'estado_compra_id' 				=> 4
					),
					'fields'						=>	array('SUM(total) AS total')
				))[0]['total'],
				/** Valor total de las compras del mes anterior*/
				'valor_compra_mes_anterior'		=>	$this->find('first', array(
					'conditions'					=>	array(
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[1]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[1]['fin']),
						'estado_compra_id' 				=> 4
					),
					'fields'						=>	array('SUM(total) AS total')
				))[0]['total'],

				/** Cantidad total de reservas */
				'total_reserva'					=>	$this->find('count', array(
					'conditions'					=>	array(
						'Compra.reserva'	=>	true,
						'estado_compra_id' 				=> 4
					)
				)),
				/** Cantidad total de reservas mes actual */
				'total_reserva_mes_actual'		=>	$this->find('count', array(
					'conditions'					=>	array(
						'Compra.reserva'				=>	true,
						'estado_compra_id' 				=> 4,
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[0]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[0]['fin']),
					)
				)),
				/** Cantidad total de reservas mes anterior*/
				'total_reserva_mes_anterior'	=>	$this->find('count', array(
					'conditions'					=>	array(
						'Compra.reserva'				=>	true,
						'estado_compra_id' 				=> 4,
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[1]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[1]['fin']),
					)
				)),
				/** Valor total reservas */
				'total_valor_reservas'			=>	$this->find('first', array(
					'conditions'					=>	array(
						'estado_compra_id' 				=> 4,
						'Compra.reserva'				=>	true
					),
					'fields'						=>	array('SUM(total) AS total_reserva')
				))[0]['total_reserva'],
				/** Valor total reservas mes actual */
				'total_valor_reservas_actual'			=>	$this->find('first', array(
					'conditions'					=>	array(
						'estado_compra_id' 				=> 4,
						'Compra.reserva'				=>	true,
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[0]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[0]['fin'])
					),
					'fields'						=>	array('SUM(total) AS total_reserva_actual')
				))[0]['total_reserva_actual'],
				/** Valor total reservas mes anterior*/
				'total_valor_reservas_anterior'			=>	$this->find('first', array(
					'conditions'					=>	array(
						'estado_compra_id' 				=> 4,
						'Compra.reserva'				=>	true,
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[1]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[1]['fin'])
					),
					'fields'						=>	array('SUM(total) AS total_reserva_anterior')
				))[0]['total_reserva_anterior'],

				/** Cantidad total de listas */
				'total_listas'					=>	$this->find('count', array(
					'conditions'					=>	array(
						'Compra.lista'	=>	true,
						'estado_compra_id' 				=> 4
					)
				)),
				/** Cantidad total de listas mes actual */
				'total_lista_mes_actual'		=>	$this->find('count', array(
					'conditions'					=>	array(
						'Compra.lista'				=>	true,
						'estado_compra_id' 				=> 4,
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[0]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[0]['fin']),
					)
				)),
				/** Cantidad total de listas mes anterior*/
				'total_lista_mes_anterior'	=>	$this->find('count', array(
					'conditions'					=>	array(
						'Compra.lista'				=>	true,
						'estado_compra_id' 				=> 4,
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[1]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[1]['fin']),
					)
				)),
				/** Valor total listas */
				'total_valor_listas'			=>	$this->find('first', array(
					'conditions'					=>	array(
						'Compra.lista'				=>	true,
						'estado_compra_id' 				=> 4
					),
					'fields'						=>	array('SUM(total) AS total_lista')
				))[0]['total_lista'],
				/** Valor total listas mes actual */
				'total_valor_listas_actual'			=>	$this->find('first', array(
					'conditions'					=>	array(
						'Compra.lista'				=>	true,
						'estado_compra_id' 				=> 4,
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[0]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[0]['fin'])
					),
					'fields'						=>	array('SUM(total) AS total_lista_actual')
				))[0]['total_lista_actual'],
				/** Valor total listas mes anterior*/
				'total_valor_listas_anterior'			=>	$this->find('first', array(
					'conditions'					=>	array(
						'Compra.lista'				=>	true,
						'estado_compra_id' 				=> 4,
						'Compra.created >='				=> sprintf('%s 00:00:00', $fecha[1]['inicio']),
						'Compra.created <= '			=> sprintf('%s 23:59:59', $fecha[1]['fin'])
					),
					'fields'						=>	array('SUM(total) AS total_lista_anterior')
				))[0]['total_lista_anterior'],
				/** Mes operacional anterior */
				'mesOperacionalAnterior'		=>	$mesOperacional
			);
		}
		return $widgets;
	}

	public function EnviarCorreoDespacho($info_compra = null)
	{
		$evento			= new CakeEvent('Model.CompraDespacho.preparacionBodega', $this, $info_compra);
		$this->getEventManager()->dispatch($evento);
	}

	public function EnviarCorreoEntregaDespacho($info_compra = null)
	{
		$evento			= new CakeEvent('Model.CompraEntregaDespacho.entregaDespacho', $this, $info_compra);
		$this->getEventManager()->dispatch($evento);
	}

}
