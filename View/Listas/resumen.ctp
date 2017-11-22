<?= $this->Html->script(array('productos.carro'), array('inline' => false)) ;?>

<div class="contenedor">
	<div class="row cont-pasos">
		<div class="col-xs-4">
			<div class="pasos-carro">
				<span class="visible-xs">Paso 01</span>
				<h3><span>01</span> Selecciona tus Listas</h3>
			</div>
		</div>
		<div class="col-xs-4">
			<div class="pasos-carro">
				<span class="visible-xs">Paso 02</span>
				<h3><span>02</span> Ingresa tu Dirección</h3>
			</div>
		</div>
		<div class="col-xs-4">
			<div class="pasos-carro no-margin active">
				<span class="visible-xs">Paso 03</span>
				<h3><span>03</span> Finaliza tu Compra</h3>
			</div>
		</div>
	</div>
	<h2 class="datos">Datos de la Orden de Compra N° <?= $compra['Compra']['id']; ?></h2>
	<div class="row datos-personales">
		<div class="col-sm-6"><div class="form-group"><span>Nombre:</span> <p><?= sprintf('%s %s %s', $compra['Usuario']['nombre'], $compra['Usuario']['apellido_paterno'], $compra['Usuario']['apellido_materno']); ?></p></div></div>
		<div class="col-sm-6"><div class="form-group"><span>Email:</span> <p><?= $compra['Usuario']['email']; ?></p></div></div>
		<? if ( ! empty($compra['Direccion']['id']) ) : ?>
		<div class="col-sm-6"><div class="form-group"><span>Dirección:</span> <p><?= sprintf('%s %s %s', $compra['Direccion']['calle'], $compra['Direccion']['numero'], $compra['Direccion']['depto']); ?></p></div></div>
		<div class="col-sm-6"><div class="form-group"><span>Comuna:</span> <p><?= $compra['Direccion']['Comuna']['nombre']; ?></p></div></div>
		<div class="col-sm-6"><div class="form-group"><span>Región:</span> <p><?= $compra['Direccion']['Comuna']['Region']['nombre']; ?></p></div></div>
		<div class="col-sm-6"><div class="form-group"><span>Teléfono:</span> <p><?= vsprintf('%d %d%d%d %d%d%d%d', str_split($compra['Direccion']['telefono'])); ?></p></div></div>
		<div class="col-sm-6"><div class="form-group"><span>Código Postal:</span> <p><?= $compra['Direccion']['codigo_postal']; ?></p></div></div>
		<? endif; ?>
		<div class="col-sm-6"><div class="form-group"><span>Estado de Compra:</span> <p><?= $compra['EstadoCompra']['nombre']; ?></p></div></div>
		<div class="col-sm-6"><div class="form-group"><span>Fecha:</span> <p><?= $compra['Compra']['created']; ?></p></div></div>
	</div>

	<? foreach ( $listas as $lista ) : $lista_id = $lista['Lista']['id']; ?>
	<div class="alumno-colegio">
		<div class="row">
			<div class="col-sm-12">
				<div class="cabecera-colegio resultado">
					<h2>
						<?= sprintf(
							'%s %s %s',
							$lista['Lista']['nombre_alumno'],
							$lista['Lista']['apellido_alumno'],
							(! empty($lista['Lista']['nombre_alumno']) || ! empty($lista['Lista']['apellido_alumno']) ? '-' : '')
						); ?>
						<?= h($lista['Nivel']['nombre']); ?>
					</h2>
					<h3><?= h($lista['Colegio']['nombre']); ?></h3>
				</div>
			</div>
		</div>

		<div class="row" id="no-more-tables">
			<table class="table-condensed cf">
				<thead class="cf">
					<tr>
						<th class="numeric" class="hidden-xs">Imagen</th>
						<th class="numeric">Nombre</th>
						<th class="numeric">Código</th>
						<th class="numeric">Precio</th>
						<th class="numeric">Talla</th>
						<th class="numeric">Cantidad</th>
						<th class="numeric">Subtotal</th>
					</tr>
				</thead>
				<tbody>
					<? foreach ( $compra['DetalleCompra'] as $detalle ) : ?>
					<? if ( $detalle['lista_id'] != $lista_id ) continue; ?>
					<tr class="js-contenedor-producto">
						<td data-title="Imagen:" class="hidden-xs">
							<?= $this->Html->link(
								$this->Html->image($this->Hookipa->imagen($detalle['Producto']['codigo']), array('class' => 'img-responsive imagen-producto-lista')),
								array('action' => 'view', $detalle['Producto']['codigo']),
								array('escape' => false)
							); ?>
						</td>
						<td data-title="Nombre:">
							<?= h($detalle['Producto']['articulo']); ?>
							<? $this->Html->link(
								$detalle['Producto']['articulo'],
								array('controller' => 'productos', 'action' => 'view', $detalle['Producto']['codigo'])
							); ?>
						</td>
						<td data-title="Código:" class="isbn"><?= $detalle['Producto']['codigo']; ?></td>
						<td data-title="Precio:" class="precio">$<?= number_format($detalle['precio_unitario'], 0, null, '.'); ?></td>
						<td data-title="Talla:">
							<?= h($detalle['Producto']['talla']); ?>
						</td>
						<td data-title="Cantidad:"><?= $detalle['cantidad']; ?></td>
						<td data-title="Subtotal:" class="precio js-producto-subtotal">$<?= number_format(($detalle['precio_unitario'] * $detalle['cantidad']), 0, null, '.'); ?></td>
					</tr>
					<? endforeach; ?>
				</tbody>
			</table>
		</div>
	</div>
	<? endforeach; ?>

	<div class="row" id="no-more-tables">
		<div class="row padd20">
			<div class="col-sm-4 suma-compra">
				<p>Subtotal : $<?= number_format($compra['Compra']['subtotal'], 0, null, '.'); ?></p>
			</div>
			<div class="col-sm-4 suma-compra">
				<p>Despacho: $<?= number_format($compra['Compra']['valor_despacho'], 0, null, '.'); ?></p>
			</div>
			<div class="col-sm-4 total-compra">
				<p>Total compra: $<?= number_format($compra['Compra']['total'], 0, null, '.'); ?></p>
			</div>
		</div>
		<div class="row padd20">
			<div class="col-sm-8 col-xs-12">
				<?= $this->Html->link('volver', array('controller' => 'direcciones', 'action' => 'add'), array('class' => 'btn')); ?>
			</div>
			<div class="col-sm-4 col-xs-12 right">
				<?= $this->Html->image('logo-webpay.jpg', array('class' => 'logo-webpay')); ?>
				<?= $this->Html->link('Pagar', array('controller' => 'listas', 'action' => 'webpay'), array('class' => 'btn')); ?>
			</div>
		</div>
	</div>
</div>
