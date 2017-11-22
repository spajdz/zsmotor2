<div class="page-title">
	<h2><span class="fa fa-users"></span> Usuarios</h2>
</div>

<?= $this->Form->create('Usuario', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Editar usuario</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table">
					<?= $this->Form->input('id'); ?>
					<tr>
						<th><?= $this->Form->label('tipo_usuario_id', 'Tipo usuario'); ?></th>
						<td><?= $this->Form->input('tipo_usuario_id', array('class' => 'form-control select')); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('nombre', 'Nombre'); ?></th>
						<td><?= $this->Form->input('nombre'); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('apellido_paterno', 'Apellido paterno'); ?></th>
						<td><?= $this->Form->input('apellido_paterno'); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('apellido_materno', 'Apellido materno'); ?></th>
						<td><?= $this->Form->input('apellido_materno'); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('genero', 'Genero'); ?></th>
						<td>
							<?= $this->Form->input('genero', array('type' => 'radio', 'class' => '', 'legend' => false, 'label' => array('class' => 'sex'), 'options' => array('Masculino', 'Femenino'))); ?>
						</td>
					</tr>
					<tr>
						<th><?= $this->Form->label('email', 'Email'); ?></th>
						<td><?= $this->Form->input('email'); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('celular', 'Celular'); ?></th>
						<td><?= $this->Form->input('celular', array('type' => 'text', 'maxlength' => 8)); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('fono', 'Fono'); ?></th>
						<td><?= $this->Form->input('fono', array('type' => 'text', 'maxlength' => 8)); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('fecha_nacimiento', 'Fecha nacimiento'); ?></th>
						<td><?= $this->Form->input('fecha_nacimiento', array('class' => 'form-inline', 'empty' => true)); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('activo', 'Activo'); ?></th>
						<td><?= $this->Form->input('activo', array('class' => 'icheckbox')); ?></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="panel-heading">
			<h3 class="panel-title">Cambiar contraseña de acceso del usuario</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table">
					<?= $this->Form->input('id'); ?>
					<tr>
						<th><?= $this->Form->label('clave', 'Clave'); ?></th>
						<td><?= $this->Form->input('clave', array('type' => 'password', 'autocomplete' => 'off', 'value' => '', 'required' => false)); ?></td>
					</tr>
					<tr>
						<th><?= $this->Form->label('repetir_clave', 'Repetir clave'); ?></th>
						<td><?= $this->Form->input('repetir_clave', array('type' => 'password', 'autocomplete' => 'off', 'value' => '', 'required' => false)); ?></td>
					</tr>
				</table>

				<div class="pull-right">
					<input type="submit" class="btn btn-primary esperar-carga" autocomplete="off" data-loading-text="Espera un momento..." value="Guardar cambios">
					<?= $this->Html->link('Cancelar', array('action' => 'index'), array('class' => 'btn btn-danger')); ?>
				</div>
			</div>
		</div>
	</div>
<?= $this->Form->end(); ?>
