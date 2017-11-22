<div class="page-title">
	<h2><span class="fa fa-users"></span> Usuarios</h2>
</div>

<div class="page-content-wrap">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="row">
				<h3 class="panel-title">Listado de usuarios</h3>
			</div>
			<div class="row">
				<h3>Filtros</h3>
				<?= $this->Form->create('Usuario', array('inputDefaults' => array('label' => false, 'required' => false))); ?>
					<div class="row">

						<div class="row fila-filtro ">
							<!-- Buscador libre (Nombre, apellidos, eail, celular, fono) -->
							<div class="col-md-6">
								<label class="control-label">Búsqueda libre <a href="#" class="btn btn-primary btn-xs btn-limpiar js-limpiar-busqueda" data-tipo="libre">Limpiar</a></label>
								<div class="input-group">
									<span class="input-group-addon"><span class="fa fa-search"></span></span>
									<?= $this->Form->input('libre', array(
										'data-tipo'		=> 'libre',
										'value'			=> (! empty($filtros['filtro']['buscar']) ? $filtros['filtro']['buscar'] : ''),
										'class'			=> 'form-control',
										'placeholder'	=> 'Nombre, Apellidos, Email, Teléfono'
									)); ?>
								</div>
							</div>
							<!-- Buscador por estados -->
							<div class="col-md-6">
								<label class="control-label">Tipo de Usuario <a href="#" class="btn btn-primary btn-xs btn-limpiar js-limpiar-busqueda" data-tipo="estado">Limpiar</a></label>
								<?= $this->Form->input('tipo_usuario', array(
										'data-tipo'		=> 'tipo_usuario',
										'selected'		=> (! empty($filtros['filtro']['tipo_usuario']) ? $filtros['filtro']['tipo_usuario'] : false),
										'options'		=> $tipoUsuario,
										'multiple'		=> true,
										'class'			=> 'form-control selectpicker',
										'title'			=> '-- Selecciona el tipo de usuario'
									)
								); ?>
							</div>
						</div>


						<div class="col-md-6 pull-right">
							<label class="control-label">&nbsp;</label>
							<div class="form-group" style="text-align: right;">
								<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
								<!-- Boton exportar excel -->
								<?= $this->Html->link('<i class="fa fa-file-excel-o"></i> Exportar', array('action' => 'excel') + $filtros, array('class' => 'btn btn-success', 'escape' => false)); ?>
								<!-- Boton limpiar -->
								<?= $this->Html->link('<i class="fa fa-repeat"></i> Limpiar', array('action' => 'index'), array('class' => 'btn btn-danger', 'escape' => false)); ?>
							</div>
						</div>
					</div>
				<?= $this->Form->end(); ?>
			</div>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr class="sort">
							<th><?= $this->Paginator->sort('tipo_usuario_id', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th><?= $this->Paginator->sort('nombre', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th><?= $this->Paginator->sort('apellido_paterno', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th><?= $this->Paginator->sort('apellido_materno', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th><?= $this->Paginator->sort('email', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th><?= $this->Paginator->sort('celular', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th><?= $this->Paginator->sort('created', 'Fecha de registro', array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<? if ( ! empty ( $usuarios ) ) : ?>
							<? foreach ( $usuarios as $usuario ) : ?>
							<tr>
								<td><?= h($usuario['TipoUsuario']['nombre']); ?></td>
								<td><?= h($usuario['Usuario']['nombre']); ?>&nbsp;</td>
								<td><?= h($usuario['Usuario']['apellido_paterno']); ?>&nbsp;</td>
								<td><?= h($usuario['Usuario']['apellido_materno']); ?>&nbsp;</td>
								<td><?= h($usuario['Usuario']['email']); ?>&nbsp;</td>
								<td><?= h($usuario['Usuario']['celular']); ?>&nbsp;</td>
								<td><?= h($usuario['Usuario']['created']); ?>&nbsp;</td>
								<td>
									<?= $this->Html->link('<i class="fa fa-edit"></i> Editar', array('action' => 'edit', $usuario['Usuario']['id']), array('class' => 'btn btn-info', 'rel' => 'tooltip', 'title' => 'Editar este registro', 'escape' => false)); ?>
									<? $this->Html->link('<i class="fa fa-edit"></i> Ver actividad', array('action' => 'view', $usuario['Usuario']['id']), array('class' => 'btn btn-primary', 'rel' => 'tooltip', 'title' => 'Ver este registro', 'escape' => false)); ?>
									<? $this->Form->postLink('<i class="fa fa-remove"></i> Eliminar', array('action' => 'delete', $usuario['Usuario']['id']), array('class' => 'btn btn-mini btn-danger confirmar-eliminacion', 'rel' => 'tooltip', 'title' => 'Eliminar este registro', 'escape' => false)); ?>
								</td>
							</tr>
							<? endforeach; ?>
						<? else : ?>
							<tr>
								<td colspan="8"><h3 class="panel-title">No se encuentran registros de Usuarios</h3></td>
							</tr>
						<?  endif; ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="pull-right">
	<ul class="pagination">
		<?= $this->Paginator->prev('« Anterior', array('tag' => 'li'), null, array('tag' => 'li', 'disabledTag' => 'a', 'class' => 'first disabled hidden')); ?>
		<?= $this->Paginator->numbers(array('tag' => 'li', 'currentTag' => 'a', 'modulus' => 8, 'currentClass' => 'active', 'separator' => '')); ?>
		<?= $this->Paginator->next('Siguiente »', array('tag' => 'li'), null, array('tag' => 'li', 'disabledTag' => 'a', 'class' => 'last disabled hidden')); ?>
	</ul>
</div>
