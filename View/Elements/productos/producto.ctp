<div class="col-md-4 col-xs-6 foto js-talla-contenedor">
	<div class="caja-gris">
		<?= $this->Html->link(
				$this->Html->image($this->App->imagen($producto['Producto']['sku']), array('class' => 'img-responsive')),
				 array('controller' => 'productos', 'action' => 'view', $categoria, 'marca' => $producto['Marca']['slug'], 'slug' => $producto['Producto']['slug']),
				array('class' => 'contenedor-imagen', 'escape' => false)
		); ?>
	
		<p><?=$producto['Producto']['nombre'];?></p>
		<p class="isbn">SKU: <span style="font-size: inherit; font-weight: inherit;" class="js-talla-isbn"><?= $producto['Producto']['sku']; ?></span></p>
		
		<div class="precio-full">
			<p class="precio">
				<span class="js-talla-precio">$ <?= number_format($producto['Producto']['preciofinal_publico'], 0, null, '.'); ?></span>
			</p>
		</div>

		<?= $this->Html->link(
			'Agregar al carro <i class="fa fa-shopping-cart"></i>',
			'#',
			array(
				'class'				=> 'js-producto-stock js-talla-stock agregar js-agregar-producto',
				'data-id'			=> $producto['Producto']['id'],
				'data-nombre'		=> h($producto['Producto']['nombre']),
				'data-imagen'		=> "img/{$this->App->imagen($producto['Producto']['sku'], true)}",
				'data-cantidad'		=> 1,
				'escape'			=> false
			)
		); ?>

		<?if($producto['Producto']['stock'] <= 0):?>
			<span class="js-producto-nostock no-stock js-talla-nostock">Sin Stock <i class="fa fa-ban"></i></span>
		<?endif;?>
	</div>
</div>