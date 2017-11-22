<?= $this->Html->script(array(
	'vendor/jquery.validate.min',
	'vendor/jquery.alphanumeric.pack',
	'vendor/bootstrap3-typeahead',
	'listas.add'
), array('inline' => false)) ;?>
<? if ( ! empty($colegios) ) : ?>
<?= $this->Html->scriptBlock(sprintf('var colegios = %s;', json_encode($colegios))); ?>
<? //pr($colegios); ?>
<? endif; ?>

<div class="contenedor">
	<div class="row cont-pasos">
		<div class="col-xs-4">
			<div class="pasos-carro active">
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
			<div class="pasos-carro no-margin">
			<span class="visible-xs">Paso 03</span>
			<h3><span>03</span> Finaliza tu Compra</h3>
			</div>
		</div>
	</div>

	<?= $this->element('alertas'); ?>

	<? if ( ! empty($colegio) ) : ?>
	<h2 class="datos">Datos de tus Listas</h2>
	<div class="row datos-personales2">
		<div class="col-sm-2">
			<?= $this->Html->image($this->Hookipa->imagenColegio($colegio['Colegio']['codigo']), array('class' => 'logoCole img-responsive')); ?>
		</div>
		<div class="col-sm-7">
			<h2><?= h($colegio['Colegio']['nombre']); ?></h2>
			<div class="col-sm-6"><div class="form-group"><p><span>Nombre:</span> <?= h(AuthComponent::user('nombre')); ?></p></div></div>
			<div class="col-sm-6"><div class="form-group"><p><span>Apellido:</span> <?= sprintf('%s %s', h(AuthComponent::user('apellido_paterno')), h(AuthComponent::user('apellido_materno'))); ?></p></div></div>
			<div class="col-sm-6"><div class="form-group"><p><span>Celular:</span> <?= h(AuthComponent::user('celular')); ?></p></div></div>
			<div class="col-sm-6"><div class="form-group"><p><span>Email:</span> <?= h(AuthComponent::user('email')); ?></p></div></div>
		</div>
		<div class="col-sm-3 text-center">
			<?= $this->Html->link(
				'<i class="fa fa-exchange"></i> Cambiar Colegio',
				array('action' => 'cambiar_colegio'),
				array('class' => 'btn', 'escape' => false)
			); ?>
			<a href="#" class="btn js-agregar-alumno"><i class="fa fa-user-plus"></i> Agregar alumno</a>
		</div>
	</div>
	<? endif; ?>

	<? if ( empty($colegio) ) : ?>
	<h2 class="datos">Seleccionar colegio</h2>
	<div class="row js-lista-nuevo-alumno-container js-container">
		<div class="col-sm-12">
			<div class="cabecera-colegio-reserva">
				<?= $this->Form->create('Lista', array('url' => array('action' => 'colegio'), 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
					<?= $this->Form->label('colegio', 'Selecciona el Colegio'); ?>
					<?= $this->Form->input('colegio', array(
						'type'				=> 'text',
						'value'				=> null,
						'class'				=> 'form-control colegio',
						'placeholder'		=> 'Escribe el nombre del colegio',
						'data-provide'		=> 'typeahead',
						'autocomplete'		=> 'off'
					)); ?>
					<?= $this->Form->hidden('colegio_id'); ?>
					<?= $this->Form->submit('Seleccionar colegio', array('div' => false, 'class' => 'btn')); ?>
				<?= $this->Form->end(); ?>
			</div>
		</div>
	</div>
	<? endif; ?>

	<? if ( ! empty($colegio) ) : ?>
	<div class="row js-lista-nuevo-alumno-container js-container hidden">
		<div class="col-sm-12">
			<div class="cabecera-colegio-reserva">
				<a href="#" class="equis js-cerrar-container">x</a>
				<?= $this->Form->create('Lista', array('inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
					<?= $this->Form->label('nombre_alumno', 'Nombre del Alumno'); ?>
					<?= $this->Form->input('nombre_alumno', array('class' => 'form-control nombre primero', 'placeholder' => 'Nombre del Alumno (opcional)', 'required' => false)); ?>
					<?= $this->Form->input('apellido_alumno', array('class' => 'form-control nombre', 'placeholder' => 'Apellido del Alumno (opcional)', 'required' => false)); ?>
					<?= $this->Form->label('nivel', 'Selecciona el nivel del Alumno'); ?>
					<?= $this->Form->input('nivel', array(
						'type'		=> 'select',
						'options'	=> Hash::combine($colegio, 'Nivel.{n}.id', 'Nivel.{n}.nombre'),
						'empty'		=> '-- Selecciona el nivel',
						'class'		=> 'form-control nivel js-nivel'
					)); ?>
					<?= $this->Form->hidden('colegio_id', array('value' => $colegio['Colegio']['id'])); ?>
					<?= $this->Form->hidden('nivel_id'); ?>
					<?= $this->Form->submit('Agregar', array('div' => false, 'class' => 'btn')); ?>
				<?= $this->Form->end(); ?>
			</div>
		</div>
	</div>

	<?= $this->Form->create(null, array('url' => array('action' => 'confirmar'))); ?>
		<? foreach ( $listas as $x => $lista ) : $lista_id = $lista['Lista']['id']; ?>
		<div class="alumno-colegio" data-id="<?= $lista_id; ?>">
			<?= $this->Form->hidden(sprintf('%d.Lista.id', $x), array('value' => $lista_id)); ?>
			<div class="row">
				<div class="col-sm-12">
					<div class="cabecera-colegio resultado">
						<a href="#" class="equis js-eliminar-lista">x</a>
						<h2>
							<?= sprintf(
								'%s %s %s',
								$lista['Lista']['nombre_alumno'],
								$lista['Lista']['apellido_alumno'],
								(! empty($lista['Lista']['nombre_alumno']) || ! empty($lista['Lista']['apellido_alumno']) ? '-' : '')
							); ?>
							<?= h($lista['Nivel']['nombre']); ?>
						</h2>
						<h3 style="color: #FFF;"><?= h($colegio['Colegio']['nombre']); ?></h3>
					</div>
				</div>
			</div>

			<? if ( $flash = $this->Session->flash('danger') ) : ?>
				<div class="alert alert-danger" data-dismiss="alert" role="alert">
					<?= $flash; ?>
				</div>
			<? endif; ?>

			<div class="row js-contenedor-lista" id="no-more-tables">
				<table class="table-condensed cf">
					<thead class="cf">
						<tr>
							<th class="numeric" class="hidden-xs">Imagen</th>
							<th class="numeric">Nombre</th>
							<th class="numeric">Código</th>
							<th class="numeric">Talla</th>
							<th class="numeric">Precio</th>
							<th class="numeric">Cantidad</th>
							<th class="numeric">Total</th>
						</tr>
					</thead>
					<tbody>
						<? foreach ( $lista['Producto'] as $y => $producto ) : ?>
						<tr class="js-talla-contenedor js-contenedor-producto <?= (! $producto['Producto']['stock'] ? 'sin-stock' : ''); ?>">
							<td data-title="Imagen:" class="hidden-xs">
								<?= $this->Html->image($this->Hookipa->imagen($producto['Producto']['codigo']), array('class' => 'img-responsive imagen-producto-lista')); ?>
							</td>

							<td data-title="Nombre:" class="nombre">
								<?= $this->Html->link(
									sprintf('<span class="js-talla-nombre">%s</span>', $producto['Producto']['articulo']),
									array('controller' => 'productos', 'action' => 'view', $producto['Producto']['codigo']),
									array('escape' => false, 'target' => '_blank' )
								); ?>
							</td>
							<td data-title="Código:" class="isbn js-talla-isbn"><?= $producto['Producto']['codigo']; ?></td>
							<td data-title="Talla:" class="talla">
								<select name="data[<?= $x; ?>][Producto][<?= $y; ?>][id]" class="form-control talla js-talla-select">
									<option
										value="<?= h($producto['Producto']['id']); ?>"
										data-id="<?= h($producto['Producto']['id']); ?>"
										data-talla="<?= h($producto['Producto']['talla']); ?>"
										data-precio="$ <?= number_format($producto['Producto']['precio'], 0, null, '.'); ?>"
										data-precio-raw="<?= $producto['Producto']['precio']; ?>"
										data-stock="<?= h($producto['Producto']['stock']); ?>"
										data-isbn="<?= h($producto['Producto']['isbn']); ?>"
										data-nombre="<?= h($producto['Producto']['articulo']); ?>"
										data-descripcion="<?= h($producto['Producto']['descripcion']); ?>">
										<?= h($producto['Producto']['talla']); ?>
									</option>
									<? foreach ( $producto['ProductoHijo'] as $productoHijo ) : ?>
										<option
											value="<?= h($productoHijo['id']); ?>"
											data-id="<?= h($productoHijo['id']); ?>"
											data-talla="<?= h($productoHijo['talla']); ?>"
											data-precio="$ <?= number_format($productoHijo['precio'], 0, null, '.'); ?>"
											data-precio-raw="<?= $productoHijo['precio']; ?>"
											data-stock="<?= h($productoHijo['stock']); ?>"
											data-isbn="<?= h($productoHijo['isbn']); ?>"
											data-nombre="<?= h($productoHijo['articulo']); ?>"
											data-descripcion="<?= h($productoHijo['descripcion']); ?>">
											<?= h($productoHijo['talla']); ?>
										</option>
									<? endforeach; ?>
								</select>
							</td>
							<td data-title="Precio:" class="js-precio-libro js-talla-precio">$ <?= number_format($producto['Producto']['precio'], 0, null, '.'); ?></td>
							<td data-title="Cantidad:" class="js-cantidad-libro">
								<?= $this->Form->input('cantidad', array(
									'name'			=> sprintf('data[%d][Producto][%d][cantidad]', $x, $y),
									'options'		=> array(0, 1, 2, 3, 4),
									'value'			=> 1,
									'label'			=> false,
									'class'			=> 'form-control js-cantidad-select'
								)); ?>
							</td>
							<td data-title="Total:" class="precio js-total-libro">$ <?= ($producto['Producto']['stock'] ? number_format($producto['Producto']['precio'], 0, null, '.') : '0'); ?></td>
						</tr>
						<? endforeach; ?>
					</tbody>
				</table>
				<div class="row padd20">
					<div class="col-sm-8 suma-compra">
						&nbsp;
					</div>
					<div class="col-sm-4 total-compra">
						<p>Total lista: <span class="js-subtotal-lista">$ <?= number_format($producto['Producto']['precio'], 0, null, '.'); ?></span></p>
					</div>
				</div>
			</div>
		</div>
		<? endforeach; ?>
		<? endif; ?>

		<div class="row">
			<div class="col-sm-8 col-xs-4"></div>
			<div class="col-sm-4 col-xs-8 right">
				<? $this->Html->link(
					'Continuar',
					array('controller' => 'direcciones', 'action' => 'add'),
					array('class' => array(
						'btn',
						'todo',
						'js-accion-lista',
						(empty($listas) ? 'hidden' : '')
					))
				); ?>
				<input type="submit" class="btn" value="Continuar">
			</div>
		</div>
	<?= $this->Form->end(); ?>
</div>
