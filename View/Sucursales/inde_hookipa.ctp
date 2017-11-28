<div class="contenedor sucursales">
	<div class="text-center nuestras">
		<!-- <h2 class="bg-lineas"><span class="bg-blanco">Nuestras Sucursales</span></h2> -->
	</div>
	<div class="row">
		<div class="col-sm-3 menu-lateral ayuda hidden-xs">
			<h2><i class="fa fa-map-marker icon-titulo"></i> Sucursales</h2>
			<ul>
				<? foreach ( $sucursales as $tmp_sucursal ) : ?>
				<li>
					<?= $this->Html->link(
						sprintf('%s <i class="fa fa-angle-right"></i>', $tmp_sucursal['Sucursal']['NOKOSU']),
						array('action' => 'view', $tmp_sucursal['Sucursal']['slug']),
						array(
							'class'		=> ($sucursal['Sucursal']['id'] ==  $tmp_sucursal['Sucursal']['id'] ? 'active' : ''),
							'escape'	=> false
						)
					); ?>
				</li>
				<? endforeach; ?>
			</ul>
		</div>
		<div class="col-sm-3 menu-lateral ayuda visible-xs padd20">
			<h2><i class="fa fa-map-marker icon-titulo"></i> Sucursales</h2>
			<select class="form-control" onchange="location = this.options[this.selectedIndex].value;">
				<? foreach ( $sucursales as $tmp_sucursal ) : ?>
				<option
					value="<?= $this->Html->url(array('action' => 'view', $tmp_sucursal['Sucursal']['slug'])); ?>"
					<?= ($sucursal['Sucursal']['id'] ==  $tmp_sucursal['Sucursal']['id'] ? ' selected="selected"' : ''); ?>>
					<?= h($tmp_sucursal['Sucursal']['NOKOSU']); ?>
				</option>
				<? endforeach; ?>
			</select>
		</div>
		<div class="col-sm-9 contenido">
			<div class="col-sm-6">
				<h2><?= h($sucursal['Sucursal']['NOKOSU']); ?></h2>
			</div>
			<!-- <div class="col-sm-6 servicios">
				<p>Servicios de la sucursal</p> <span class="icon-servicios" style="background-image:url(img/icon-pelota.png)"></span> <span class="icon-servicios" style="background-image:url(img/icon-camion.png)"></span>
			</div> -->
			<? if ( ! empty($sucursal['Sucursal']['map']) ) : ?>
			<iframe src="<?= $sucursal['Sucursal']['map']; ?>" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
			<? endif; ?>
			<div class="datos-sucursales">
				<div class="row">
					<div class="col-sm-6"><div class="form-group"><p><span>Dirección:</span> <?= h($sucursal['Sucursal']['DISU']); ?></p></div></div>
					<div class="col-sm-6"><div class="form-group"><p><span>Horario Lunes a Viernes:</span> <?= h($sucursal['Sucursal']['HMLU_VI']); ?></p></div></div>
					<div class="col-sm-6"><div class="form-group"><p><span>Horario Sábado:</span> <?= h($sucursal['Sucursal']['SABADO']); ?></p></div></div>
					<div class="col-sm-6"><div class="form-group"><p><span>Teléfono:</span> <a href="tel:+56<?= $sucursal['Sucursal']['FOSU']; ?>"><?= h($sucursal['Sucursal']['FOSU']); ?></a></p></div></div>
					<div class="col-sm-6"><div class="form-group"><p><span>Email:</span> <a href="mailto:<?= $sucursal['Sucursal']['MAIL']; ?>"><?= h($sucursal['Sucursal']['MAIL']); ?></a></p></div></div>
					<div class="col-sm-6"><div class="form-group"><p><span>Temporada:</span> <?= h($sucursal['Sucursal']['TEMPORADA']); ?></p></div></div>
					<div class="col-sm-6"><div class="form-group"><p><span>Jefe de Local:</span> <?= h($sucursal['Sucursal']['ENCSU']); ?></p></div></div>
					<div class="col-sm-6"><div class="form-group"><p><span>Venta:</span> <?= h($sucursal['Sucursal']['VTAPROD']); ?></p></div></div>
				</div>
			</div>
		</div>
	</div>
</div>
