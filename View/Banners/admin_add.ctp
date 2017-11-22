<div class="page-title">
	<h2><span class="fa fa-image"></span> Banners</h2>
</div>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Nuevo banner</h3>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<?= $this->Form->create('Banner', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
				<table class="table">
					<!-- TIPO BANNER -->
					<tr>
						<th><?= $this->Form->label('tipo_banner_id', 'Tipo'); ?></th>
						<td><?= $this->Form->input('tipo_banner_id'); ?></td>
					</tr>

					<!-- NOMBRE -->
					<tr>
						<th><?= $this->Form->label('nombre', 'Nombre'); ?></th>
						<td><?= $this->Form->input('nombre'); ?></td>
					</tr>
					<!-- DESCRIPCION -->
					<tr>
						<th><?= $this->Form->label('descripcion', 'Descripcion'); ?></th>
						<td><?= $this->Form->input('descripcion'); ?>
					</tr>
					<!-- FECHA INICIO -->
					<tr>
						<th><?= $this->Form->label('fecha_inicio', 'Fecha inicio'); ?></th>
						<td><?= $this->Form->input('fecha_inicio', array('class' => 'form-inline', 'empty' => true)); ?>
					</tr>
					<!-- FECHA FIN -->
					<tr>
						<th><?= $this->Form->label('fecha_fin', 'Fecha fin'); ?></th>
						<td><?= $this->Form->input('fecha_fin', array('class' => 'form-inline', 'empty' => true)); ?></td>
					</tr>
					<!-- LINK -->
					<tr>
						<th><?= $this->Form->label('link', 'Link'); ?></th>
						<td><?= $this->Form->input('link'); ?></td>
					</tr>
					<!-- IMAGEN -->
					<tr>
						<th><?= $this->Form->label('imagen', 'Imagen'); ?></th>
						<td><?= $this->Form->input('imagen', array('type' => 'file', 'class' => '')); ?></td>
					</tr>
					<!-- IMAGEN MOBLIE-->
					<tr>
						<th><?= $this->Form->label('imagen_mobile', 'Imagen Mobile'); ?></th>
						<td><?= $this->Form->input('imagen_mobile', array('type' => 'file', 'class' => '')); ?></td>
					</tr>

				</table>
				<div class="pull-right">
					<input type="submit" class="btn btn-primary esperar-carga" autocomplete="off" data-loading-text="Espera un momento..." value="Guardar cambios">
					<?= $this->Html->link('Cancelar', array('action' => 'index'), array('class' => 'btn btn-danger')); ?>
				</div>
			<?= $this->Form->end(); ?>
		</div>
	</div>
</div>
