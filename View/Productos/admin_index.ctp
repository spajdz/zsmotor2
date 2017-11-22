<div class="page-title">
	<h2><span class="fa fa-list-ol"></span> Productos</h2>
</div>

<div class="page-content-wrap">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de productos</h3>
			<div class="btn-group pull-right">
				<?= $this->Html->link('<i class="fa fa-file-excel-o"></i> Exportar', array('action' => 'excel'), array('class' => 'btn btn-success', 'escape' => false)); ?>
			</div>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr class="sort">
							<th>ID Catálogo</th>
							<th>Código</th>
							<th>ISBN</th>
							<th>Precio</th>
							<th>Nombre</th>
							<th>Talla</th>
							<th>Código Artículo</th>
							<th>Código Talla</th>
							<th>Código Colegio</th>
							<th>Stock</th>
							<th>Activo</th>
							<th>Imagen</th>
						</tr>
					</thead>
					<tbody>
						<? foreach ( $productos as $producto ) : ?>
						<tr>
							<td><?= h($producto['Producto']['id']); ?></td>
							<td><?= h($producto['Producto']['codigo']); ?></td>
							<td><?= h($producto['Producto']['isbn']); ?></td>
							<td><?= h($producto['Producto']['precio']); ?></td>
							<td><?= h($producto['Producto']['nombre']); ?></td>
							<td><?= h($producto['Producto']['talla']); ?></td>
							<td><?= h($producto['Producto']['codigo_articulo']); ?></td>
							<td><?= h($producto['Producto']['codigo_talla']); ?></td>
							<td><?= h($producto['Producto']['codigo_colegio']); ?></td>
							<td><?= h($producto['Producto']['stock']); ?></td>
							<td><?= ($producto['Producto']['activo'] ? '<i class="fa fa-check"></i>' : '<i class="fa fa-remove"></i>'); ?>&nbsp;</td>
							<td><?= $this->Hookipa->imagen($producto['Producto']['codigo'], false); ?></td>
						</tr>
						<? endforeach; ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="pull-right">
	<ul class="pagination">
		<?= $this->Paginator->prev('« Anterior', array('tag' => 'li'), null, array('tag' => 'li', 'disabledTag' => 'a', 'class' => 'first disabled hidden')); ?>
		<?= $this->Paginator->numbers(array('tag' => 'li', 'currentTag' => 'a', 'modulus' => 2, 'currentClass' => 'active', 'separator' => '')); ?>
		<?= $this->Paginator->next('Siguiente »', array('tag' => 'li'), null, array('tag' => 'li', 'disabledTag' => 'a', 'class' => 'last disabled hidden')); ?>
	</ul>
</div>
