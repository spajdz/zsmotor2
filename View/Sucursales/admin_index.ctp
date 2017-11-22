<div class="page-title">
	<h2><span class="fa fa-home"></span> Sucursales</h2>
</div>

<div class="page-content-wrap">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de sucursales</h3>
			<div class="btn-group pull-right" style="margin-left: 10px;">
				<?= $this->Html->link('<i class="fa fa-square-o"></i> Desactivar fijas', array('action' => 'desactivar_fijas'), array('class' => 'btn btn-danger', 'escape' => false)); ?>
				<?= $this->Html->link('<i class="fa fa-square-o"></i> Desactivar temporales', array('action' => 'desactivar_temporales'), array('class' => 'btn btn-danger', 'escape' => false)); ?>
			</div>
			<div class="btn-group pull-right">
				<?= $this->Html->link('<i class="fa fa-check-square-o"></i> Activar fijas', array('action' => 'activar_fijas'), array('class' => 'btn btn-success', 'escape' => false)); ?>
				<?= $this->Html->link('<i class="fa fa-check-square-o"></i> Activar temporales', array('action' => 'activar_temporales'), array('class' => 'btn btn-success', 'escape' => false)); ?>
			</div>
		</div>
		<div class="panel-heading">
			<p class="help-block">Para reordenar, arrastra las filas con el mouse</p>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<?= $this->Form->create('Sucursal', array('url' => array('action' => 'ajax_reorden'))); ?>
					<table class="table">
						<thead>
							<tr class="sort">
								<th width="5%">Orden</th>
								<th>Código</th>
								<th>Nombre</th>
								<th width="25%">Dirección</th>
								<th width="15%">Temporada</th>
								<th>Temporal</th>
								<th>Activa</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody class="js-generico-contenedor-sort">
							<? foreach ( $sucursales as $sucursal ) : ?>
							<tr>
								<td class="js-generico-orden">
									<a href="#" class="js-generico-handle-sort"><i class="fa fa-arrows"></i></a>
									<?= $this->Form->hidden(sprintf('Sucursal.orden.%d', $sucursal['Sucursal']['id'])); ?>
									<span><?= h($sucursal['Sucursal']['orden']); ?>&nbsp;</span>
								</td>
								<td><?= h($sucursal['Sucursal']['KOSU']); ?>&nbsp;</td>
								<td><?= h($sucursal['Sucursal']['NOKOSU']); ?>&nbsp;</td>
								<td><?= h($sucursal['Sucursal']['DISU']); ?>&nbsp;</td>
								<td><?= h($sucursal['Sucursal']['TEMPORADA']); ?>&nbsp;</td>
								<td><?= ($sucursal['Sucursal']['temporal'] ? '<i class="fa fa-check"></i>' : '<i class="fa fa-remove"></i>'); ?>&nbsp;</td>
								<td><?= ($sucursal['Sucursal']['activo'] ? '<i class="fa fa-check"></i>' : '<i class="fa fa-remove"></i>'); ?>&nbsp;</td>
								<td>
									<?= $this->Html->link('<i class="fa fa-edit"></i> Editar', array('action' => 'edit', $sucursal['Sucursal']['id']), array('class' => 'btn btn-mini btn-info', 'rel' => 'tooltip', 'title' => 'Editar este registro', 'escape' => false)); ?>
									<? if ( $sucursal['Sucursal']['activo'] ) : ?>
									<?= $this->Html->link('<i class="fa fa-square-o"></i> Desactivar', array('action' => 'desactivar', $sucursal['Sucursal']['id']), array('class' => 'btn btn-danger', 'rel' => 'tooltip', 'title' => 'Desactivar este registro', 'escape' => false)); ?>
									<? else : ?>
									<?= $this->Html->link('<i class="fa fa-check-square-o"></i> Activar', array('action' => 'activar', $sucursal['Sucursal']['id']), array('class' => 'btn btn-primary', 'rel' => 'tooltip', 'title' => 'Activar este registro', 'escape' => false)); ?>
									<? endif; ?>
								</td>
							</tr>
							<? endforeach; ?>
						</tbody>
					</table>
				<?= $this->Form->end(); ?>
			</div>
		</div>
	</div>
</div>
