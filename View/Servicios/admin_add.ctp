<div class="page-title">
	<h2><span class="fa fa-map-marker"></span> Servicios</h2>
</div>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Nuevo Servicio</h3>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<?= $this->Form->create('Servicio', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
				<table class="table">
					<tr>
						<th><?= $this->Form->label('nombre', 'Nombre'); ?></th>
						<td><?= $this->Form->input('nombre', array('maxlength'=>'50')); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('Descripcion Basica', 'Descripcion Servicio'); ?></th> 
						<td><?= $this->Form->input('descripcion', array( 'class' => 'js-summernote')); ?></td>			 			
					</tr> 
					<tr>
						<th><?= $this->Form->label('imagen', 'Foto portada (590x260 px)'); ?></th>
						<td><?= $this->Form->input('imagen', array('type' => 'file', 'class' => '')); ?></td>
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
