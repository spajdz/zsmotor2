<div class="page-title">
	<h2><span class="fa fa-list"></span> Direcciones</h2>
</div>

<div class="page-content-wrap">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de direcciones</h3>
			<div class="btn-group pull-right">
				<?= $this->Html->link('<i class="fa fa-plus"></i> Nuevo direccion', array('action' => 'add'), array('class' => 'btn btn-success', 'escape' => false)); ?>
			</div>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr class="sort">
							<th><?= $this->Paginator->sort('id', 'ID', array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th><?= $this->Paginator->sort('usuario_id', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th><?= $this->Paginator->sort('KOCI', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th><?= $this->Paginator->sort('KOCM', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th><?= $this->Paginator->sort('nombre', null, array('title' => 'Haz click para ordernar por este criterio')); ?></th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<? foreach ( $direcciones as $direccion ) : ?>
						<tr>
							<td><span class="label label-default"><?= $direccion['Direccion']['id']; ?></span>&nbsp;</td>
							<td><?= $this->Html->link($direccion['Usuario']['nombre'], array('controller' => 'usuarios', 'action' => 'edit', $direccion['Usuario']['id'])); ?></td>
							<td><?= h($direccion['Direccion']['KOCI']); ?>&nbsp;</td>
							<td><?= h($direccion['Direccion']['KOCM']); ?>&nbsp;</td>
							<td><?= h($direccion['Direccion']['nombre']); ?>&nbsp;</td>
							<td>
								<?= $this->Html->link('<i class="fa fa-edit"></i> Editar', array('action' => 'edit', $direccion['Direccion']['id']), array('class' => 'btn btn-mini btn-info', 'rel' => 'tooltip', 'title' => 'Editar este registro', 'escape' => false)); ?>
								<?= $this->Form->postLink('<i class="fa fa-remove"></i> Eliminar', array('action' => 'delete', $direccion['Direccion']['id']), array('class' => 'btn btn-mini btn-danger confirmar-eliminacion', 'rel' => 'tooltip', 'title' => 'Eliminar este registro', 'escape' => false)); ?>
							</td>
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
