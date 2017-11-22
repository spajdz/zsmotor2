<div class="page-title">
	<h2><span class="fa fa-home"></span> Sucursales</h2>
</div>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Nuevo sucursal</h3>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<?= $this->Form->create('Sucursal', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
				<table class="table">
					<tr>
						<th><?= $this->Form->label('KOSU', 'KOSU'); ?></th>
						<td><?= $this->Form->input('KOSU'); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('imagen', 'Imagen'); ?></th>
						<td><?= $this->Form->input('imagen', array('type' => 'file')); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('latitud', 'Latitud'); ?></th>
						<td><?= $this->Form->input('latitud'); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('longitud', 'Longitud'); ?></th>
						<td><?= $this->Form->input('longitud'); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('map', 'Map'); ?></th>
						<td><?= $this->Form->input('map'); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('activo', 'Activo'); ?></th>
						<td><?= $this->Form->input('activo', array('class' => 'icheckbox')); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('administrador_id', 'Administrador'); ?></th>
						<td><?= $this->Form->input('administrador_id', array('class' => 'form-control select')); ?></td>
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
