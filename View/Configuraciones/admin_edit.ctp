<div class="page-title">
	<h2><span class="fa fa-cog"></span> Configuraciones</h2>
</div>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Editar configuración</h3>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<?= $this->Form->create('Configuracion', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
				<table class="table">
					<?= $this->Form->input('id'); ?>
					<tr>
						<th><?= $this->Form->label('nombre', 'Nombre'); ?></th>
						<!-- <td><?= $this->Form->input('nombre'); ?></td> -->
						<td><?= $this->request->data['Configuracion']['nombre'] ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('valor', 'Valor'); ?></th>
						<td><?= $this->Form->input('valor', array('maxlength' => 250)); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('adicional', 'Adicional'); ?></th>
						<td><?= $this->Form->input('adicional'); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('descripcion', 'Descripcion'); ?></th>
						<td><?= $this->Form->input('descripcion'); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('activo', 'Activo'); ?></th>
						<td><?= $this->Form->input('activo', array('class' => 'icheckbox')); ?></td>
					</tr>
					<tr class="form-inline">
						<th><?= $this->Form->label('fecha_inicio', 'Fecha inicio'); ?></th>
						<td><?= $this->Form->input('fecha_inicio', array('empty' => true)); ?></td>
					</tr>
					<tr class="form-inline">
						<th><?= $this->Form->label('fecha_fin', 'Fecha fin'); ?></th>
						<td><?= $this->Form->input('fecha_fin', array('empty' => true)); ?></td>
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
