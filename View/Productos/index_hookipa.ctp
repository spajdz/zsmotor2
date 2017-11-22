<?//= $this->Html->script(array('productos.index'), array('inline' => false)) ;?>

<?= $this->Html->script(array(
	'vendor/jquery.validate.min',
	'vendor/jquery.alphanumeric.pack',
	'vendor/bootstrap3-typeahead',
	'productos.index'
), array('inline' => false)) ;?>


<? $this->Paginator->options(array('url' => array('controller' => 'productos', 'action' => 'index', 'lista' => $lista['slug']) + $pass)); ?>

<div class="contenedor catalogos">
	<div class="row">
		<?//= $this->element('menu_lateral'); ?>
		<div class="col-md-9 contenido">
			<div class="filtros catalogo">
				<span>Ordenar por:</span>
				<?= $this->Paginator->sort('precio', 'Precio <i class="fa fa-caret-down"></i><i class="fa fa-caret-up"></i>', array('class' => 'orden', 'escape' => false)); ?>
				<?= $this->Paginator->sort('articulo', 'Nombre <i class="fa fa-caret-down"></i><i class="fa fa-caret-up"></i>', array('class' => 'orden', 'escape' => false)); ?>
				<?= $this->Paginator->link(
					'<i class="fa fa-align-justify"></i>',
					array('vista' => 'lista'),
					array('class' => 'orden-caja por-pag ' . ($vista === 'lista' ? 'press' : ''), 'escape' => false)
				); ?>
				<?= $this->Paginator->link(
					'<i class="fa fa-th"></i>',
					array('vista' => 'grilla'),
					array('class' => 'orden-caja ' . ($vista === 'grilla' ? 'press' : ''), 'escape' => false)
				); ?>
				<span class="por-pag">Productos por página:</span>
				<? $this->Html->loadConfig('html_links_planos'); ?>
				<select class="form-control js-productos-por-pagina">
					<option value="<?= $this->Paginator->link(null, array('limite' => 12)); ?>" <?= ($limite == 12 ? 'selected="selected"' : ''); ?>>12</option>
					<option value="<?= $this->Paginator->link(null, array('limite' => 36)); ?>" <?= ($limite == 36 ? 'selected="selected"' : ''); ?>>36</option>
					<option value="<?= $this->Paginator->link(null, array('limite' => 48)); ?>" <?= ($limite == 48 ? 'selected="selected"' : ''); ?>>48</option>
				</select>
				<? $this->Html->loadConfig('html_links_normales'); ?>
				<span class="pagn"><?= $this->Paginator->counter(array('format' => '{:page} de {:pages}')); ?></span>
			</div>

			<div class="row">
				<? foreach ( $productos as $producto ) : ?>

					<div class="col-md-4 col-xs-6 foto js-talla-contenedor">
						<div class="caja-gris">
							<?= $this->Html->link(
									$this->Html->image($this->Hookipa->imagen($producto['Producto']['codigo']), array('class' => 'img-responsive')),
									array('action' => 'view', $producto['Producto']['codigo'], $tipo_catalogo ),
									array('class' => 'contenedor-imagen', 'escape' => false)
							); ?>
							<!--p class="cat"><?= $nombre_categoria; ?></p-->
							<h2 class="js-talla-nombre producto">
								<?= $this->Html->link(
									$producto['Producto']['articulo'],
									array('action' => 'view', $producto['Producto']['codigo'])
								); ?>
							</h2>

							<?= $this->Hookipa->sizeSelect($producto);  ?>

							<p class="isbn">Código: <span style="font-size: inherit; font-weight: inherit;" class="js-talla-isbn"><?= $producto['Producto']['codigo']; ?></span></p>
							<!--div class="precio-chico">
								<p class="cat">
									<span class="js-talla-precio">$ <?= number_format($producto['Producto']['precio'], 0, null, '.'); ?></span>
									Precio Internet
								</p>
							</div-->
							<? if ( $producto['Producto']['descripcion'] ) : ?>
							<p class="comentario js-talla-descripcion"><?= h($producto['Producto']['descripcion']); ?></p>
							<? endif; ?>
							<div class="precio-full">
								<p class="precio">
									<span class="js-talla-precio">$ <?= number_format($producto['Producto']['precio'], 0, null, '.'); ?></span>
									Precio Internet
								</p>
							</div>

							<?= $this->Html->link(
								'Agregar al carro <i class="fa fa-shopping-cart"></i>',
								'#',
								array(
									'class'				=> 'js-producto-stock js-talla-stock agregar js-agregar-producto',
									'data-id'			=> $producto['Producto']['id'],
									'data-nombre'		=> h($producto['Producto']['articulo']),
									'data-imagen'		=> "img/{$this->Hookipa->imagen($producto['Producto']['codigo'], true)}",
									'data-cantidad'		=> 1,
									'escape'			=> false
								)
							); ?>
							<span class="js-producto-nostock no-stock js-talla-nostock">Sin Stock <i class="fa fa-ban"></i></span>
						</div>
					</div>

				<? endforeach; ?>
			</div>
			<nav class="paginador">
				<ul class="pagination">
					<?= $this->Paginator->prev('« Anterior', array('tag' => 'li'), null, array('tag' => 'li', 'disabledTag' => 'a', 'class' => 'first disabled hidden')); ?>
					<?= $this->Paginator->numbers(array('tag' => 'li', 'currentTag' => 'a', 'modulus' => 9, 'currentClass' => 'active', 'separator' => '')); ?>
					<?= $this->Paginator->next('Siguiente »', array('tag' => 'li'), null, array('tag' => 'li', 'disabledTag' => 'a', 'class' => 'last disabled hidden')); ?>
				</ul>
			</nav>
		</div>
	</div>
</div>
