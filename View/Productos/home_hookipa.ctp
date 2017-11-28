<?= $this->Html->script(array(
	'vendor/jquery.validate.min',
	'vendor/jquery.alphanumeric.pack',
	'vendor/bootstrap3-typeahead',
	'home'
), array('inline' => false)) ;?>
<? if ( ! empty($colegios) ) : ?>
<?= $this->Html->scriptBlock(sprintf('var colegios = %s;', json_encode($colegios))); ?>
<?//= pr($colegios); ?>
<? endif; ?>

<? if ( $banners ) : ?>
<div class="row row2">
	<div class="col-md-7 col-xs-12">
		<div id="slider-principal" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<? foreach ( $banners as $index => $banner) : ?>
					<li data-target="#slider-principal" data-slide-to="<?= $index; ?>" class="<?= ($index == 0 ? 'active' : '' ); ?>"></li>
				<? endforeach; ?>
			</ol>
			<div class="carousel-inner" role="listbox">
				<? foreach ( $banners as $index => $banner) : ?>
					<div class="item <?= ($index == 0 ? 'active' : ''); ?>">
						<!-- Comprobas si exite un link para la imagen -->
						<? if ( ! empty($banner['Banner']['link']) ) : ?>
							<!-- Banner para  pantallas mayores a 768px -->
							<?=
								$this->Html->link(
									$this->Html->image($banner['Banner']['imagen']['banner']),
									$banner['Banner']['link'],
									array(
										'class'     =>  'hidden-xs img-responsive',
										'target'    =>  '_blank',
										'escape'    =>  false
									)
								);
							?>
							<!-- Banner para mobile -->
							<? if ( ! empty($banner['Banner']['imagen_mobile']['mobile']) ) : ?>
								<?=
									$this->Html->link(
										$this->Html->image($banner['Banner']['imagen_mobile']['mobile'], array(
											'width'     =>  '100%',
											'height'    =>  'Auto'
										)),
										$banner['Banner']['link'],
										array(
											'class'     =>  'visible-xs',
											'target'    =>  '_blank',
											'escape'    =>  false
										)
									);
								?>
							<? endif; ?>
						<? else : ?>
							<!-- Banner para  pantallas mayores a 768px -->
							<?= $this->Html->image(
								$banner['Banner']['imagen']['path'],
								array('class' => 'hidden-xs img-responsivex')
							) ?>
							<!-- Banner para mobile -->
							<? if ( ! empty($banner['Banner']['imagen_mobile']['mobile']) ) : ?>
								<?= $this->Html->image($banner['Banner']['imagen_mobile']['mobile'], array(
									'class'     =>  'visible-xs',
									'width'     =>  '100%',
									'height'    =>  'Auto'
								)) ?>
							<? endif; ?>
						<? endif; ?>
					</div>
				<? endforeach; ?>
			</div>
			<? if( count($banners) > 1 ) : ?>
				<a class="left carousel-control hidden-xs" href="#slider-principal" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control hidden-xs" href="#slider-principal" role="button" data-slide="next">
					<span class="glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			<? endif; ?>
		</div>
	</div>

	<div class="col-md-5 buscador hidden-sm hidden-xs">
		<div class="log-correo">
			<div class="text-center"><h2>Buscar uniformes por colegio</h2></div>
			<?= $this->Form->create('Lista', array('url' => array('controller'=>'listas', 'action' => 'add'), 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>

				<div class="col-md-12">
					<?= $this->Html->image('num-1.png', array('class' => 'num uno')); ?>
					<?= $this->Form->input('colegio', array(
						'type'				=> 'text',
						'value'				=> '',
						'class'				=> 'form-control colegio',
						'placeholder'		=> 'Ingrese su colegio',
						'data-provide'		=> 'typeahead',
						'autocomplete'		=> 'off'
					)); ?>
				</div>
			<!-- 	<div class="col-md-12">
					<?= $this->Html->image('num-2.png', array('class' => 'num dos')); ?>
					<select class="form-control js-select-nivel-vacio" id="#">
						<option value="" disabled="disabled" selected="selected">--Selecciona nivel</option>
					</select>
					<? foreach ( $colegios as $colegio ): ?>
					<?= $this->Form->input('niveles', array(
							'options'			=> Hash::combine($colegio['Nivel'], '{n}.id', '{n}.nombre'),
							'style'				=> 'display: none;',
							'empty'				=> '-- Selecciona nivel',
							'class'				=> 'form-control js-select-nivel',
							'data-colegio_id'	=> $colegio['Colegio']['id']
					)); ?>
					<? endforeach; ?>
				</div> -->

				<?= $this->Form->hidden('colegio_id'); ?>
				<?= $this->Form->hidden('nivel_id'); ?>
				<?= $this->Form->submit('Buscar', array('div' => false, 'class' => 'btn js-btnEnviar')); ?>
			<?= $this->Form->end(); ?>
		</div>
	</div>
</div>
<? endif; ?>

<? if ( $destacados ) : ?>
<div class="contenedor destacados">
	<h2 class="bg-lineas"><span class="bg-blanco">DESTACADOS</span></h2>
	<div class="row borde">
		<? $x = 0; foreach ( $destacados as $destacado ) : $x++; ?>
		<div class="col-md-3<?php /* echo ($x >= 3 ? 'col-md-push-3' : ''); */ ?> col-xs-6 foto js-talla-contenedor">
			<div class="caja-gris">
				<?= $this->Html->link(
					$this->Html->image($this->Hookipa->imagen($destacado['Producto']['codigo'], true), array('class' => 'img-responsive')),
					array('action' => 'view', $destacado['Producto']['codigo'], 'destacado'),
					array('escape' => false, 'class' => 'contenedor-imagen')
				); ?>
				<h2>
					<?= $this->Html->link(
						sprintf('<span class="js-talla-nombre">%s</span>' ,$destacado['Producto']['articulo']),
						array('action' => 'view', $destacado['Producto']['codigo']),
						array('escape' => false)
					); ?>
				</h2>
				<p class="colegio">Colegio: <?= h($destacado['Colegio']['nombre']); ?></p>
				<p class="isbn">
					Código:
					<span class="js-talla-isbn" style="font-size: inherit; font-weight: inherit;">
						<?= $destacado['Producto']['codigo']; ?>
					</span>
				</p>

				<?= $this->Hookipa->sizeSelect($destacado);?>

				<p class="precio"><span class="js-talla-precio">$<?= number_format($destacado['Producto']['precio'], 0, null, '.'); ?></span> Precio Internet</p>
				<?= $this->Html->link(
					'Agregar al Carro',
					'#',
					array(
						'class'				=> 'agregar js-agregar-producto js-talla-stock',
						'data-id'			=> $destacado['Producto']['id'],
						'data-nombre'		=> h($destacado['Producto']['articulo']),
						'data-imagen'		=> "img/{$this->Hookipa->imagen($destacado['Producto']['codigo'], true)}",
						'data-cantidad'		=> 1,
						'escape'			=> false
					)
				); ?>
				<span class="js-producto-nostock no-stock js-talla-nostock">Sin Stock <i class="fa fa-ban"></i></span>
				<span class="<?= ($x >= 3 ? 'flecha2' : 'flecha'); ?>"></span>
			</div>
		</div>
		<? endforeach; ?>
	</div>
</div>
<? endif; ?>

<? if ( $masvendidos ) : ?>
<div class="contenedor destacados vendido">
	<h2 class="bg-lineas"><span class="bg-blanco">LO MÁS VENDIDO</span></h2>
	<div class="row borde">
		<? $x = 0; foreach ( $masvendidos as $masvendido ) : $x++; ?>
		<div class="col-md-3<?php /* echo ($x >= 3 ? 'col-md-push-3' : ''); */ ?> col-xs-6 foto js-talla-contenedor">
			<div class="caja-gris">
				<?= $this->Html->link(
					$this->Html->image($this->Hookipa->imagen($masvendido['Producto']['codigo'], true), array('class' => 'img-responsive')),
					array('action' => 'view', $masvendido['Producto']['codigo'], 'masvendido'),
					array('escape' => false, 'class' => 'contenedor-imagen')
				); ?>
				<h2>
					<?= $this->Html->link(
						sprintf('<span class="js-talla-nombre">%s</span>' ,$masvendido['Producto']['articulo']),
						array('action' => 'view', $masvendido['Producto']['codigo']),
						array('escape' => false)
					); ?>
				</h2>
				<p class="colegio">Colegio: <?= h($masvendido['Colegio']['nombre']); ?></p>
				<p class="isbn">
					Código:
					<span class="js-talla-isbn" style="font-size: inherit; font-weight: inherit;">
						<?= $masvendido['Producto']['codigo']; ?>
					</span>
				</p>

				<?php echo $this->Hookipa->sizeSelect($masvendido);?>

				<p class="precio"><span class="js-talla-precio">$<?= number_format($masvendido['Producto']['precio'], 0, null, '.'); ?></span> Precio Internet</p>
				<?= $this->Html->link(
					'Agregar al Carro',
					'#',
					array(
						'class'				=> 'agregar js-agregar-producto js-talla-stock',
						'data-id'			=> $masvendido['Producto']['id'],
						'data-nombre'		=> h($masvendido['Producto']['articulo']),
						'data-imagen'		=> "img/{$this->Hookipa->imagen($masvendido['Producto']['codigo'], true)}",
						'data-cantidad'		=> 1,
						'escape'			=> false
					)
				); ?>
				<span class="js-producto-nostock no-stock js-talla-nostock">Sin Stock <i class="fa fa-ban"></i></span>
				<span class="<?= ($x >= 3 ? 'flecha2' : 'flecha'); ?>"></span>
			</div>
		</div>
		<? endforeach; ?>
	</div>
</div>
<? endif; ?>
