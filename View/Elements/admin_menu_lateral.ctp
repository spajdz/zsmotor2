<!-- Se obtienen los permisos asignados al usuarios -->
<?
	$permiso_usuario	= json_decode(AuthComponent::user('Perfil')['permisos']);
	$perfil_usuario		= AuthComponent::user('perfil_id');
?>

<div class="page-sidebar">
	<ul class="x-navigation x-navigation-custom">
		<li class="xn-logo">
			<?= $this->Html->link(
				'<span class="fa fa-dashboard"></span> <span class="x-navigation-control">Backend Zs Motor</span>',
				array('controller' => 'compras', 'action' => 'dashboard'),
				array('escape' => false)
			); ?>
			<a href="#" class="x-navigation-control"></a>
		</li>
		<li class="xn-title"></li>
		<li class="<?= ($this->Html->menuActivo(array('controller' => 'compras', 'action' => 'dashboard')) ? 'active' : ''); ?>">
			<?= $this->Html->link(
				'<span class="fa fa-dashboard"></span> <span class="xn-text">Dashboard</span>',
				array('controller' => 'compras', 'action' => 'dashboard'),
				array('escape' => false)
			); ?>
		</li>
		<li class="xn-openable <?= (
			(
				$this->Html->menuActivo(array('controller' => 'marcas')) ||
				$this->Html->menuActivo(array('controller' => 'compras', 'action' => 'index')) ||
				$this->Html->menuActivo(array('controller' => 'productos')) ||
				$this->Html->menuActivo(array('controller' => 'productoResenas')) 
			)
			? 'active' : ''
		); ?>">
			<a href="#"><span class="fa fa-th-list"></span> <span class="xn-text">Ecommerce</span></a>
			<ul>
				<li class="<?= ($this->Html->menuActivo(array('controller' => 'marcas')) ? 'active' : ''); ?>">
					<?= $this->Html->link(
						'<span class="glyphicon glyphicon-tags"></span> <span class="xn-text">Marcas</span>',
						array('controller' => 'marcas', 'action' => 'index'),
						array('escape' => false)
					); ?>
				</li>
				<li class="<?= ($this->Html->menuActivo(array('controller' => 'compras', 'action' => 'index')) ? 'active' : ''); ?>">
					<?= $this->Html->link(
						'<span class="glyphicon glyphicon-barcode"></span> <span class="xn-text">Compras</span>',
						array('controller' => 'compras', 'action' => 'index'),
						array('escape' => false)
					); ?>
				</li>
				<li class="<?= ($this->Html->menuActivo(array('controller' => 'productos')) ? 'active' : ''); ?>">
					<?= $this->Html->link(
						'<span class="glyphicon glyphicon-barcode"></span> <span class="xn-text">Productos</span>',
						array('controller' => 'productos', 'action' => 'index'),
						array('escape' => false)
					); ?>
				</li>
				<li class="<?= ($this->Html->menuActivo(array('controller' => 'productoResenas')) ? 'active' : ''); ?>">
					<?= $this->Html->link(
						'<span class="glyphicon glyphicon-barcode"></span> <span class="xn-text">Productos Reseñas</span>',
						array('controller' => 'querys', 'action' => 'index'),
						array('escape' => false)
					); ?>
				</li>
			</ul>
		</li>
		<li class="xn-title">Ventas</li>
		<!-- Listado de ordenes de compra -->
		<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'compras') ) : ?>
		<li class="<?= ($this->Html->menuActivo(array('controller' => 'compras', 'action' => 'index')) ? 'active' : ''); ?>">
			<?= $this->Html->link(
				'<span class="fa fa-list-ol"></span> <span class="xn-text">Listado OC</span>',
				array('controller' => 'compras', 'action' => 'index'),
				array('escape' => false)
			); ?>
		</li>
		<? endif; ?>
		<!-- Tarifas -->
		<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'tarifa_despachos') ) : ?>
			<li class="<?= ($this->Html->menuActivo(array('controller' => 'tarifa_despachos', 'action' => 'index')) ? 'active' : ''); ?>">
				<?= $this->Html->link(
					'<span class="fa fa-dollar"></span> <span class="xn-text">Tarifa despachos</span>',
					array('controller' => 'tarifa_despachos', 'action' => 'index'),
					array('escape' => false)
				); ?>
			</li>
		<? endif; ?>
		<li class="xn-title">Páginas</li>

		<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'banners') ) : ?>
			<li class="<?= ($this->Html->menuActivo(array('controller' => 'banners')) ? 'active' : ''); ?>">
				<?= $this->Html->link(
					'<span class="fa fa-image"></span> <span class="xn-text">Banners</span>',
					array('controller' => 'banners', 'action' => 'index'),
					array('escape' => false)
				); ?>
			</li>
		<? endif; ?>
		<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'ayudas') ) : ?>
			<li class="<?= ($this->Html->menuActivo(array('controller' => 'ayudas')) ? 'active' : ''); ?>">
				<?= $this->Html->link(
					'<span class="fa fa-support"></span> <span class="xn-text">Ayuda</span>',
					array('controller' => 'ayudas', 'action' => 'index'),
					array('escape' => false)
				); ?>
			</li>
		<? endif; ?>
		<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'sucursales') ) : ?>
			<li class="<?= ($this->Html->menuActivo(array('controller' => 'sucursales')) ? 'active' : ''); ?>">
				<?= $this->Html->link(
					'<span class="fa fa-home"></span> <span class="xn-text">Sucursales</span>',
					array('controller' => 'sucursales', 'action' => 'index'),
					array('escape' => false)
				); ?>
			</li>
		<? endif; ?>
		<!--<li><a href="novedades.php"><span class="fa fa-newspaper-o"></span> <span class="xn-text">Novedades</span></a></li>-->
		<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'contactos') ) : ?>
			<li class="<?= ($this->Html->menuActivo(array('controller' => 'contactos')) ? 'active' : ''); ?>">
				<?= $this->Html->link(
					'<span class="fa fa-envelope"></span> <span class="xn-text">Contacto</span>',
					array('controller' => 'contactos', 'action' => 'index'),
					array('escape' => false)
				); ?>
			</li>
		<? endif; ?>

		<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'novedades') ) : ?>
			<li class="<?= ($this->Html->menuActivo(array('controller' => 'novedades')) ? 'active' : ''); ?>">
				<?= $this->Html->link(
					'<span class="fa fa-bullhorn"></span> <span class="xn-text">Novedades</span>',
					array('controller' => 'novedades', 'action' => 'index'),
					array('escape' => false)
				); ?>
			</li>
		<? endif; ?>
		<li class="xn-title">Módulos</li>
		<li class="xn-openable <?= (
			(
				$this->Html->menuActivo(array('controller' => 'temas')) ||
				$this->Html->menuActivo(array('controller' => 'usuarios')) ||
				$this->Html->menuActivo(array('controller' => 'tipo_usuarios')) ||
				$this->Html->menuActivo(array('controller' => 'grupo_tarifarios')) ||
				$this->Html->menuActivo(array('controller' => 'textos')) ||
				$this->Html->menuActivo(array('controller' => 'querys')) ||
				$this->Html->menuActivo(array('controller' => 'productos')) ||
				$this->Html->menuActivo(array('controller' => 'administradores')) ||
				$this->Html->menuActivo(array('controller' => 'perfiles')) ||
				$this->Html->menuActivo(array('controller' => 'configuraciones'))
			)
			? 'active' : ''
		); ?>">
			<a href="#"><span class="fa fa-cog"></span> <span class="xn-text">Módulos</span></a>
			<ul>
				<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'usuarios') ) : ?>
					<li class="<?= ($this->Html->menuActivo(array('controller' => 'usuarios')) ? 'active' : ''); ?>">
						<?= $this->Html->link(
							'<span class="fa fa-users"></span> <span class="xn-text">Usuarios</span>',
							array('controller' => 'usuarios', 'action' => 'index'),
							array('escape' => false)
						); ?>
					</li>
				<? endif; ?>
				<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'tipo_usuarios') ) : ?>
					<li class="<?= ($this->Html->menuActivo(array('controller' => 'tipo_usuarios')) ? 'active' : ''); ?>">
						<?= $this->Html->link(
							'<span class="fa fa-users"></span> <span class="xn-text">Tipos de usuarios</span>',
							array('controller' => 'tipo_usuarios', 'action' => 'index'),
							array('escape' => false)
						); ?>
					</li>
				<? endif; ?>
				<!--
				<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'grupo_tarifarios') ) : ?>
				<li class="<?= ($this->Html->menuActivo(array('controller' => 'grupo_tarifarios')) ? 'active' : ''); ?>">
					<?= $this->Html->link(
						'<span class="fa fa-users"></span> <span class="xn-text">Grupos tarifarios</span>',
						array('controller' => 'grupo_tarifarios', 'action' => 'index'),
						array('escape' => false)
					); ?>
				</li>
				<? endif; ?>
				-->
				<!--
				<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'textos') ) : ?>
				<li class="<?= ($this->Html->menuActivo(array('controller' => 'textos')) ? 'active' : ''); ?>">
					<?= $this->Html->link(
						'<span class="fa fa-text-width"></span> <span class="xn-text">Textos</span>',
						array('controller' => 'textos', 'action' => 'index'),
						array('escape' => false)
					); ?>
				</li>
				<? endif; ?>
				-->
				<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'querys') ) : ?>
					<li class="<?= ($this->Html->menuActivo(array('controller' => 'querys')) ? 'active' : ''); ?>">
						<?= $this->Html->link(
							'<span class="fa fa-database"></span> <span class="xn-text">Querys SQL</span>',
							array('controller' => 'querys', 'action' => 'index'),
							array('escape' => false)
						); ?>
					</li>
				<? endif; ?>
				<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'cargar_masiva') ) : ?>
				<!-- CARGA MASIVA -->
					<li class="<?= ($this->Html->menuActivo(array('controller' => 'productos')) ? 'active' : ''); ?>">
						<?= $this->Html->link(
							'<span class="fa fa-folder-open"></span> <span class="xn-text">Carga masiva</span>',
							array('controller' => 'productos', 'action' => 'masivo'),
							array('escape' => false)
						); ?>
					</li>
				<? endif; ?>
				<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'administradores') ) : ?>
					<li class="<?= ($this->Html->menuActivo(array('controller' => 'administradores')) ? 'active' : ''); ?>">
						<?= $this->Html->link(
							'<span class="fa fa-user"></span> <span class="xn-text">Administradores</span>',
							array('controller' => 'administradores', 'action' => 'index'),
							array('escape' => false)
						); ?>
					</li>
				<? endif; ?>
				<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'perfiles') ) : ?>
					<li class="<?= ($this->Html->menuActivo(array('controller' => 'perfiles')) ? 'active' : ''); ?>">
						<?= $this->Html->link(
							'<span class="fa fa-user"></span> <span class="xn-text">Perfiles</span>',
							array('controller' => 'perfiles', 'action' => 'index'),
							array('escape' => false)
						); ?>
					</li>
				<? endif; ?>
				<? if ( permisosPerfilBackend($perfil_usuario, $permiso_usuario, 'configuraciones') ) : ?>
					<li class="<?= ($this->Html->menuActivo(array('controller' => 'configuraciones')) ? 'active' : ''); ?>">
						<?= $this->Html->link(
							'<span class="fa fa-cog"></span> <span class="xn-text">Configuraciones</span>',
							array('controller' => 'configuraciones', 'action' => 'index'),
							array('escape' => false)
						); ?>
					</li>
				<? endif; ?>
			</ul>
		</li>
	</ul>
</div>
