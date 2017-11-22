<div class="page-title">
	<h2><span class="fa fa-image"></span> Banners</h2>
</div>

<div class="page-content-wrap">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de banners</h3>
			<div class="btn-group pull-right">
				<?= $this->Html->link('<i class="fa fa-plus"></i> Nuevo banner', array('action' => 'add'), array('class' => 'btn btn-success', 'escape' => false)); ?>
			</div>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<?= $this->Form->create('Banner', array('url' => array('action' => 'ajax_reorden'))); ?>
					<table class="table">
						<thead>
							<tr class="sort">
								<th width="5%">Orden</th>
								<th>Imagen</th>
								<th>Imagen mobile</th>
								<th><?= $this->Paginator->sort('nombre', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('descripcion', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('fecha_inicio', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('fecha_fin', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('activo', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('administrador_id', 'Última modificación', array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody class="js-generico-contenedor-sort">
							<? foreach ( $banners as $banner ) : ?>
							<tr>
								<td class="js-generico-orden">
									<a href="#" class="js-generico-handle-sort"><i class="fa fa-arrows"></i></a>
									<?= $this->Form->hidden(sprintf('Banner.orden.%d', $banner['Banner']['id'])); ?>
									<span><?= h($banner['Banner']['orden']); ?>&nbsp;</span>
								</td>
								<td>
									<? if ( ! empty($banner['Banner']['imagen']) ) : ?>
									<?= $this->Html->image($banner['Banner']['imagen']['mini'], array('class'  => 'img-responsive')); ?>
									<? endif; ?>
								</td>
								<td>
									<? if ( ! empty($banner['Banner']['imagen_mobile']) ) : ?>
									<?= $this->Html->image($banner['Banner']['imagen_mobile']['mini'], array('class'  => 'img-responsive')); ?>
									<? endif; ?>
								</td>
								<td><?= h($banner['Banner']['nombre']); ?>&nbsp;</td>
								<td><?= h($banner['Banner']['descripcion']); ?>&nbsp;</td>
								<td><?= h($banner['Banner']['fecha_inicio']); ?>&nbsp;</td>
								<td><?= h($banner['Banner']['fecha_fin']); ?>&nbsp;</td>
								<td><?= ($banner['Banner']['activo'] ? '<i class="fa fa-check"></i>' : '<i class="fa fa-remove"></i>'); ?>&nbsp;</td>
								<td><?= h($banner['Administrador']['nombre']) ?></td>
								<td>
									<?= $this->Html->link('<i class="fa fa-edit"></i> Editar', array('action' => 'edit', $banner['Banner']['id']), array('class' => 'btn btn-info', 'rel' => 'tooltip', 'title' => 'Editar este registro', 'escape' => false)); ?>
									<? if ( $banner['Banner']['activo'] ) : ?>
										<?= $this->Html->link('<i class="fa fa-square-o"></i> Desactivar', array('action' => 'desactivar', $banner['Banner']['id']), array('class' => 'btn btn-danger', 'rel' => 'tooltip', 'title' => 'Desactivar este registro', 'escape' => false)); ?>
									<? else : ?>
										<?= $this->Html->link('<i class="fa fa-check-square-o"></i> Activar', array('action' => 'activar', $banner['Banner']['id']), array('class' => 'btn btn-primary', 'rel' => 'tooltip', 'title' => 'Activar este registro', 'escape' => false)); ?>
									<? endif; ?>
									<?= $this->Form->postLink('<i class="icon-remove icon-white"></i> Eliminar', array('action' => 'delete', $banner['Banner']['id']), array('class' => 'btn btn-mini btn-danger confirmar-eliminacion', 'rel' => 'tooltip', 'title' => 'Eliminar este registro', 'escape' => false)); ?>
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
<!--  **********   END  BANNER CARRUCEL  ********** -->

<!--  **********   START BANNER RESERVA  ********** -->

<!--
** 13 Sept 2016
	Se cambia la forma de acceder a reserva, ya no por banner si no por un boton

<div class="page-content-wrap">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Historial de banners para reserva</h3>
			<div class="btn-group pull-right">
				<?= $this->Html->link('<i class="fa fa-plus"></i> Nuevo banner reserva', array('action' => 'add', 'reserva'), array('class' => 'btn btn-success', 'escape' => false)); ?>
			</div>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
					<table class="table">
						<thead>
							<tr class="sort">
								<th>Imagen</th>
								<th>Imagen mobile</th>
								<th><?= $this->Paginator->sort('nombre', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('descripcion', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('fecha_inicio', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('fecha_fin', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('activo', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('administrador_id', 'Última modificación', array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<? foreach ( $banners_reserva as $banner ) : ?>
							<tr>

								<td>
									<? if ( ! empty($banner['Banner']['imagen']) ) : ?>
									<?= $this->Html->image($banner['Banner']['imagen']['mini'], array('class'  => 'img-responsive')); ?>
									<? endif; ?>
								</td>
								<td>
									<? if ( ! empty($banner['Banner']['imagen_mobile']) ) : ?>
									<?= $this->Html->image($banner['Banner']['imagen_mobile']['mini'], array('class'  => 'img-responsive')); ?>
									<? endif; ?>
								</td>
								<td><?= h($banner['Banner']['nombre']); ?>&nbsp;</td>
								<td><?= h($banner['Banner']['descripcion']); ?>&nbsp;</td>
								<td><?= h($banner['Banner']['fecha_inicio']); ?>&nbsp;</td>
								<td><?= h($banner['Banner']['fecha_fin']); ?>&nbsp;</td>
								<td><?= ($banner['Banner']['activo'] ? '<i class="fa fa-check"></i>' : '<i class="fa fa-remove"></i>'); ?>&nbsp;</td>
								<td><?= h($banner['Administrador']['nombre']) ?></td>
								<td>
									<?= $this->Html->link('<i class="fa fa-edit"></i> Editar', array('action' => 'edit', $banner['Banner']['id'], 'reserva'), array('class' => 'btn btn-info', 'rel' => 'tooltip', 'title' => 'Editar este registro', 'escape' => false)); ?>
									<? if ( $banner['Banner']['activo'] ) : ?>
										<?= $this->Html->link('<i class="fa fa-square-o"></i> Desactivar', array('action' => 'desactivar', $banner['Banner']['id'], 'reserva'), array('class' => 'btn btn-danger', 'rel' => 'tooltip', 'title' => 'Desactivar este registro', 'escape' => false)); ?>
									<? else : ?>
										<?= $this->Html->link('<i class="fa fa-check-square-o"></i> Activar', array('action' => 'activar', $banner['Banner']['id'], 'reserva'), array('class' => 'btn btn-primary', 'rel' => 'tooltip', 'title' => 'Activar este registro', 'escape' => false)); ?>
									<? endif; ?>
									<?= $this->Form->postLink('<i class="icon-remove icon-white"></i> Eliminar', array('action' => 'delete', $banner['Banner']['id']), array('class' => 'btn btn-mini btn-danger confirmar-eliminacion', 'rel' => 'tooltip', 'title' => 'Eliminar este registro', 'escape' => false)); ?>
								</td>
							</tr>
							<? endforeach; ?>
						</tbody>
					</table>
			</div>
		</div>
	</div>
</div>
-->
<!--  **********   END BANNER RESERVA  ********** -->

<!--  **********   START BANNER TEXTO POR COLEGIO  ********** -->

<!--
<div class="page-content-wrap">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Historial de banners para texto por colegio</h3>
			<div class="btn-group pull-right">
				<?= $this->Html->link('<i class="fa fa-plus"></i> Nuevo banner texto por colegio', array('action' => 'add', 'texto_colegio'), array('class' => 'btn btn-success', 'escape' => false)); ?>
			</div>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
					<table class="table">
						<thead>
							<tr class="sort">
								<th>Imagen</th>
								<th>Imagen mobile</th>
								<th><?= $this->Paginator->sort('nombre', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('descripcion', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('fecha_inicio', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('fecha_fin', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('activo', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th><?= $this->Paginator->sort('administrador_id', 'Última modificación', array('title' => 'Haz click para ordernar por este criterio')); ?></th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<? foreach ( $banners_texto_colegio as $colegio ) : ?>
							<tr>

								<td>
									<? if ( ! empty($colegio['Banner']['imagen']) ) : ?>
									<?= $this->Html->image($colegio['Banner']['imagen']['mini'], array('class'  => 'img-responsive')); ?>
									<? endif; ?>
								</td>
								<td>
									<? if ( ! empty($colegio['Banner']['imagen_mobile']) ) : ?>
									<?= $this->Html->image($colegio['Banner']['imagen_mobile']['mini'], array('class'  => 'img-responsive')); ?>
									<? endif; ?>
								</td>
								<td><?= h($colegio['Banner']['nombre']); ?>&nbsp;</td>
								<td><?= h($colegio['Banner']['descripcion']); ?>&nbsp;</td>
								<td><?= h($colegio['Banner']['fecha_inicio']); ?>&nbsp;</td>
								<td><?= h($colegio['Banner']['fecha_fin']); ?>&nbsp;</td>
								<td><?= ($colegio['Banner']['activo'] ? '<i class="fa fa-check"></i>' : '<i class="fa fa-remove"></i>'); ?>&nbsp;</td>
								<td><?= h($colegio['Administrador']['nombre']) ?></td>
								<td>
									<?= $this->Html->link('<i class="fa fa-edit"></i> Editar', array('action' => 'edit', $colegio['Banner']['id'], 'texto_colegio'), array('class' => 'btn btn-info', 'rel' => 'tooltip', 'title' => 'Editar este registro', 'escape' => false)); ?>
									<? if ( $colegio['Banner']['activo'] ) : ?>
										<?= $this->Html->link('<i class="fa fa-square-o"></i> Desactivar', array('action' => 'desactivar', $colegio['Banner']['id'], 'texto_colegio'), array('class' => 'btn btn-danger', 'rel' => 'tooltip', 'title' => 'Desactivar este registro', 'escape' => false)); ?>
									<? else : ?>
										<?= $this->Html->link('<i class="fa fa-check-square-o"></i> Activar', array('action' => 'activar', $colegio['Banner']['id'], 'texto_colegio'), array('class' => 'btn btn-primary', 'rel' => 'tooltip', 'title' => 'Activar este registro', 'escape' => false)); ?>
									<? endif; ?>
									<?= $this->Form->postLink('<i class="icon-remove icon-white"></i> Eliminar', array('action' => 'delete', $colegio['Banner']['id']), array('class' => 'btn btn-mini btn-danger confirmar-eliminacion', 'rel' => 'tooltip', 'title' => 'Eliminar este registro', 'escape' => false)); ?>
								</td>
							</tr>
							<? endforeach; ?>
						</tbody>
					</table>
			</div>
		</div>
	</div>
</div>
-->
<!--  **********   END BANNER TEXTO POR COLEGIO  ********** -->
