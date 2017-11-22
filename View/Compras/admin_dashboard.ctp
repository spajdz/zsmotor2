<div class="page-content-wrap">
	<!-- Variable que contiene los estados registrados de las OC -->
	<?= $this->Html->scriptBlock(sprintf("var estados 			= %s;", json_encode($estados_compra))); ?>
	<!-- Variable que conteien la cantidad de registros de OC por estados en un intervalo de tiempo-->
	<?= $this->Html->scriptBlock(sprintf("var cantidad_estados 	= %s;", json_encode($cantidad_estado))); ?>
	<!-- Variable que contiene el valor total por tipo de OC en un intervalo de tiempo -->
	<?= $this->Html->scriptBlock(sprintf("var valores_oc		= %s;", json_encode($valores_oc))); ?>

	<div class="row">
		<div class="col-md-4">
			<!-- Widget de total de ventas -->
			<div class="widget widget-default widget-carousel">
				<div class="owl-carousel" id="owl-example">
					<!-- Total de compras todos los tiempos -->
					<div>
						<div class="widget-title">Total ventas</div>
						<div class="widget-subtitle"></div>
						<div class="widget-int">$ <?= number_format(existe($widgets['total_valor_compra'], 'int'),0,',','.') ?></div>
						<div class="widget-subtitle"><?= existe($widgets['total_compras'], 'int') ?> ventas</div>
					</div>
					<!-- Total de compras del mes actual -->
					<div>
						<div class="widget-title">Total ventas mes</div>
						<div class="widget-subtitle">Actual</div>
						<div class="widget-int">$ <?= number_format(existe($widgets['valor_compra_mes_actual'], 'int'),0,',','.') ?></div>
						<div class="widget-subtitle"><?= $widgets['total_compras_mes_actual'] ?> ventas</div>
					</div>
					<!-- Total de compras del mes anterior -->
					<div>
						<div class="widget-title">Total ventas mes</div>
						<div class="widget-subtitle"><?= ucfirst(__d('cake', date('F',mktime(0, 0, 0, date("m")-1,date("d"),date("Y"))))) ?></div>
						<div class="widget-int">$ <?= number_format(existe($widgets['valor_compra_mes_anterior'], 'int'),0,',','.') ?></div>
						<div class="widget-subtitle"><?= existe($widgets['total_compras_mes_anterior'], 'int') ?> ventas</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Widget de total de reservas -->
		<div class="col-md-4">
			<div class="widget widget-default widget-carousel">
				<div class="owl-carousel" id="owl-example">
					<!-- total de reservas todos los tiempos -->
					<div>
						<div class="widget-title">Total Reservas</div>
						<div class="widget-subtitle"></div>
						<div class="widget-int">$ <?= number_format(existe($widgets['total_valor_reservas'], 'int'),0,',','.') ?></div>
						<div class="widget-subtitle"><?= $widgets['total_reserva'] ?> ventas</div>
					</div>
					<!-- totla reservas mes actual -->
					<div>
						<div class="widget-title">Total reservas mes</div>
						<div class="widget-subtitle">Actual</div>
						<div class="widget-int">$ <?=  number_format(existe($widgets['total_valor_reservas_actual'],'int'),0,',','.') ?></div>
						<div class="widget-subtitle"><?= $widgets['total_reserva_mes_actual'] ?> ventas</div>
					</div>
					<!-- Total reservas mes anterior -->
					<div>
						<div class="widget-title">Total reservas mes</div>
						<div class="widget-subtitle"><?= ucfirst(__d('cake', date('F',mktime(0, 0, 0, date("m")-1,date("d"),date("Y"))))) ?></div>
						<div class="widget-int">$ <?= number_format(existe($widgets['total_valor_reservas_anterior'], 'int'),0,',','.') ?></div>
						<div class="widget-subtitle"><?= existe($widgets['total_reserva_mes_anterior'], 'int') ?> ventas</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Widget de total de listas -->
		<div class="col-md-4">
			<div class="widget widget-default widget-carousel">
				<div class="owl-carousel" id="owl-example">
					<!-- total de listas todos los tiempos -->
					<div>
						<div class="widget-title">Total textos por colegio</div>
						<div class="widget-subtitle"></div>
						<div class="widget-int">$ <?= number_format(existe($widgets['total_valor_listas'], 'int'),0,',','.') ?></div>
						<div class="widget-subtitle"><?= $widgets['total_listas'] ?> ventas</div>
					</div>
					<!-- totla reservas mes actual -->
					<div>
						<div class="widget-title">Textos por colegio mes</div>
						<div class="widget-subtitle">Actual</div>
						<div class="widget-int">$ <?=  number_format(existe($widgets['total_valor_listas_actual'],'int'),0,',','.') ?></div>
						<div class="widget-subtitle"><?= $widgets['total_lista_mes_actual'] ?> ventas</div>
					</div>
					<!-- Total reservas mes anterior -->
					<div>
						<div class="widget-title">Textos por colegio mes</div>
						<div class="widget-subtitle"><?= ucfirst(__d('cake', date('F',mktime(0, 0, 0, date("m")-1,date("d"),date("Y"))))) ?></div>
						<div class="widget-int">$ <?= number_format(existe($widgets['total_valor_listas_anterior'], 'int'),0,',','.') ?></div>
						<div class="widget-subtitle"><?= existe($widgets['total_lista_mes_anterior'], 'int') ?> ventas</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Widget despachos
		<div class="col-md-3">
			<div class="widget widget-default widget-item-icon">
				<div class="widget-item-left">
					<span class="fa fa-truck fa-flip-horizontal"></span>
				</div>
				<div class="widget-data">
					<div class="widget-int num-count">0</div>
					<div class="widget-title">Despachos</div>
					<div class="widget-subtitle"></div>
				</div>
				<div class="widget-controls"></div>
			</div>
		</div>-->
	</div>
	<div class="row">
		<!-- Diagramas de comparacion (valores OC - tiempo)
		Este Diagrama compra la el monto total de registros de tipos de OC -->
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>Ventas</h3>
						<span>Total ventas de los últimos 4 meses</span>
					</div>
				</div>
				<div class="panel-body padding-0">
					<div class="chart-holder" id="dashboard-line-2" style="height: 400px;"></div>
				</div>
			</div>
		</div>
		<!-- Diagramas de comparacion (Estado - tiempo)
		Este Diagrama compra la cantidad de registros de OC por estado -->
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>Ventas</h3>
						<span>Estados de venta de los últimos 4 meses</span>
					</div>
				</div>
				<div class="panel-body padding-0">
					<div class="chart-holder" id="dashboard-line-1" style="height: 400px;"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<!-- Tabla que muestra los detalles de los ultimos 4 registros de OC -->
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>Ordenes de Compra</h3>
						<span>Estado de las últimas 4 OC</span>
					</div>
				</div>
				<div class="panel-body panel-body-table">
					<div class="table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th width="10%">Estado</th>
									<th width="10%">OC</th>
									<th width="25%">Nombre</th>
									<th width="25%">E-mail</th>
									<th width="15%">Total</th>
									<th width="15%">Fecha</th>
									<th ></th>
								</tr>
							</thead>
							<tbody>
								<? foreach ( $datos_compras as $compra ) :
									$sucess = array('1' => 'warning', '2' => 'danger', '3' => 'danger', '4' => 'success', '5' => 'primary');
								?>
									<tr>
										<td><span class="label label-<?= $sucess[$compra['EstadoCompra']['id']]; ?>"><?= explode(' ', $compra['EstadoCompra']['nombre'])[0]; ?></span></td>
										<td><?= h($compra['Compra']['id']) ?></td>
										<td><?= sprintf('%s %s %s', $compra['Usuario']['nombre'], $compra['Usuario']['apellido_paterno'], $compra['Usuario']['apellido_materno']); ?></td>
										<td><?= h($compra['Usuario']['email']) ?></td>
										<td>$ <?= h(number_format($compra['Compra']['total'],0,',','.')); ?></td>
										<td><?= h($compra['Compra']['created']) ?></td>
										<td>
											<?= $this->Html->link('<i class="fa fa-eye"></i> Ver', array('action' => 'view', $compra['Compra']['id']), array('class' => 'btn btn-mini btn-info', 'rel' => 'tooltip', 'title' => 'Ver este registro', 'escape' => false)); ?>
										</td>
									</tr>
								<? endforeach; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Tabla que muestra los detalles de las 4 ultimos registros de reservas -->
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>Reservas</h3>
						<span>Estado de las últimas 4 reservas</span>
					</div>
				</div>
				<div class="panel-body panel-body-table">
					<div class="table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th width="10%">Estado</th>
									<th width="10%">OC</th>
									<th width="25%">Nombre</th>
									<th width="25%">E-mail</th>
									<th width="15%">Total</th>
									<th width="15%">Fecha</th>
									<th ></th>
								</tr>
							</thead>
							<tbody>
								<? foreach ( $datos_reserva as $reserva ) :
									$sucess = array('1' => 'warning', '2' => 'danger', '3' => 'danger', '4' => 'success', '5' => 'primary');
								?>
									<tr>
										<td><span class="label label-<?= $sucess[$reserva['EstadoCompra']['id']]; ?>"><?= explode(' ', $reserva['EstadoCompra']['nombre'])[0]; ?></span></td>
										<td><?= h($reserva['Compra']['id']) ?></td>
										<td><?= sprintf('%s %s %s', $reserva['Usuario']['nombre'], $reserva['Usuario']['apellido_paterno'], $reserva['Usuario']['apellido_materno']); ?></td>
										<td><?= h($reserva['Usuario']['email']) ?></td>
										<td>$ <?= h(number_format($reserva['Compra']['total'],0,',','.')); ?></td>
										<td><?= h($reserva['Compra']['created']) ?></td>
										<td>
											<?= $this->Html->link('<i class="fa fa-eye"></i> Ver', array('action' => 'view', $reserva['Compra']['id']), array('class' => 'btn btn-mini btn-info', 'rel' => 'tooltip', 'title' => 'Ver este registro', 'escape' => false)); ?>
										</td>
									</tr>
								<? endforeach; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Tabla que muestra los ultimos 4 registros de listas -->
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>Listas por colegio</h3>
						<span>Estado de las últimas 4 listas</span>
					</div>
				</div>
				<div class="panel-body panel-body-table">
					<div class="table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th width="10%" >Estado</th>
									<th width="10%">OC</th>
									<th width="25%">Nombre</th>
									<th width="25%">E-mail</th>
									<th width="15%">Total</th>
									<th width="15%">Fecha</th>
									<th ></th>
								</tr>
							</thead>
							<tbody>
								<? foreach ( $datos_listas as $listas ) :
									$sucess = array('1' => 'warning', '2' => 'danger', '3' => 'danger', '4' => 'success', '5' => 'primary');
								?>
									<tr>
										<td><span class="label label-<?= $sucess[$listas['EstadoCompra']['id']]; ?>"><?= explode(' ', $listas['EstadoCompra']['nombre'])[0]; ?></span></td>
										<td><?= h($listas['Compra']['id']) ?></td>
										<td><?= sprintf('%s %s %s', $listas['Usuario']['nombre'], $listas['Usuario']['apellido_paterno'], $listas['Usuario']['apellido_materno']); ?></td>
										<td><?= h($listas['Usuario']['email']) ?></td>
										<td>$ <?= h(number_format($listas['Compra']['total'],0,',','.')); ?></td>
										<td><?= h($listas['Compra']['created']) ?></td>
										<td>
											<?= $this->Html->link('<i class="fa fa-eye"></i> Ver', array('action' => 'view', $listas['Compra']['id']), array('class' => 'btn btn-mini btn-info', 'rel' => 'tooltip', 'title' => 'Ver este registro', 'escape' => false)); ?>
										</td>
									</tr>
								<? endforeach; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
