<? $this->Html->script(array('productos.view'), array('inline' => false)) ;?>
<? $this->Html->meta(array('property' => 'og:image', 'content' => $this->Html->url(sprintf('/img/%s', $this->Hookipa->imagen($producto['Producto']['codigo'])), true)), null, array('inline' => false)); ?>
<?= $this->Html->scriptBlock(sprintf("var valoracion = %s;", json_encode($valoracion))); ?>

<div class="contenedor">
	<div class="row">
		<?= $this->element('menu_lateral'); ?>
		<div class="col-md-9 catalogo-ficha">
			<div class="row js-contenedor-producto">
				<div class="col-md-6">
					<?= $this->Html->image($this->Hookipa->imagen($producto['Producto']['codigo'], true), array('class' => 'img-responsive','id' => 'zoom_01')); ?>
					<p class="sabana-descripcion">Pasa el mouse por la imagen para hacer zoom</p>
				</div>
				<div class="col-md-6 detalles-ficha js-talla-contenedor">
					<div class="row">
						<div class="col-md-6 position-right position-baseLine">
							<span>Califica este producto</span>
						</div>
						<div class="col-md-6 position-left">
							<div class="star-rating js-valorizacion" data-bloqueado="<?= $valoracion_bloqueada; ?>">
								<? for( $i = 1; $i <= 5; $i++ ) : ?>
								<input type="radio" name="rating"
									   class="pointer js-check-valorizacion <?= ($i == $valoracion[0]['promedio'] ? 'current' : ''); ?>"
									   data-estrellas="<?= $i; ?>"
									   data-producto="<?= $producto['Producto']['id']; ?>" >
									   <i></i>
								<? endfor; ?>
							</div>
						</div>
					</div>
					<h2><?= h($producto['Producto']['articulo']); ?></h2>
					<div class="info">
						<p class="cat"><span class="js-talla-precio">$<?= number_format($producto['Producto']['precio'], 0, null, '.'); ?></span> Precio Internet</p>
					</div>
					<div class="cant-carro">
						<form>
							<? if ( $producto['Producto']['stock'] ) : ?>
							<span class="cantidad">Cantidad</span>
							<?= $this->Form->input('cantidad', array('value' => 1, 'maxlength' => 1, 'class' => 'form-control caja js-input-cantidad', 'div' => false, 'label' => false)); ?>
							<button type="submit" class="btn-agregar js-agregar-producto"
									data-id="<?= $producto['Producto']['id']; ?>"
									data-nombre="<?= h($producto['Producto']['articulo']); ?>"
									data-imagen="<?= "img/{$this->Hookipa->imagen($producto['Producto']['codigo'], true)}"; ?>"
									data-cantidad="1">
								Agregar al Carro <i class="fa fa-shopping-cart"></i>
							</button>
							<? else : ?>
							<span class="no-stock">Sin Stock <i class="fa fa-ban"></i></span>
							<? endif; ?>
						</form>
					</div>

					<span class="tallas">Tallas</span>
					<?= $this->Hookipa->sizeSelect($producto);  ?>

					<? if ( ! empty($producto['Colegio']['nombre']) ) : ?>
					<h3 class="title-compartir">Colegio</h3>
					<p><?= h($producto['Colegio']['nombre']); ?></p>
					<? endif; ?>

					<? if ( ! empty($producto['Producto']['descripcion']) ) : ?>
					<h3 class="title-compartir">Descripción</h3>
					<p><?= h(ucfirst($producto['Producto']['descripcion'])); ?></p>
					<? endif; ?>

					<h3 class="title-compartir">Stock</h3>
					<p>Producto <?= ($producto['Producto']['stock'] > 0 ? 'en stock' : 'sin stock'); ?></p>

					<h3 class="title-compartir">Compartir</h3>
					<div class="compartir clearfix">
						<div class="pull-left">
							<div class="fb-share-button"
								data-href="<?= $this->Html->url(array('controller' => 'productos', 'action' => 'view', $producto['Producto']['codigo']), true); ?>"
								data-layout="button">
							</div>
						</div>
						<div class="pull-left" style="margin-left: 10px;">
							<a href="https://twitter.com/share" class="twitter-share-button" data-lang="es">Twittear</a>
							<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
						</div>
					</div>
				</div>
			</div>

			<h2>Comentarios del Producto</h2>
			<div class="comentarios">
				<div class="sdk-facebook">
					<div id="fb-root"></div>
					<script>(function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id)) return;
					js = d.createElement(s); js.id = id;
					js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5&appId=1938664143025395";
					fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));</script>
				</div>
				<div class="fb-comments"
					 data-href="<?= $this->Html->url(array('controller' => 'productos', 'action' => 'view', $producto['Producto']['codigo']), true); ?>"
					 data-numposts="4" data-width="100%">
				</div>
			</div>

			<!--
			<div class="col-md-11 col-md-offset-1 col-xs-12 comentario">
				<h5>Nombre de usuario</h5>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
			</div>
			<div class="col-md-11 col-md-offset-1 col-xs-12 comentario">
				<h5>Nombre de usuario</h5>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
			</div>
			-->

			<!--
			<h2>¿Conoces el Producto? Déjanos tu Comentario.</h2>
			<form>
				<div class="row">
					<div class="col-md-12">
						<p>Debes ingresar para poder comentar.</p>
					</div>
					<div class="col-md-6 pdd-r">
						<label>Email:</label>
						<input type="text" class="form-control">
					</div>
					<div class="col-md-6">
						<label>Contraseña:</label>
						<input type="password" class="form-control">
					</div>
					<div class="col-md-6">
						<h2>O más rápido y más fácil con Facebook.</h2>
					</div>
					<div class="col-md-6">
						<a href="#" class="btn-fb"><i class="fa fa-facebook-official"></i> Login con Facebook</a>
					</div>
					<div class="col-md-12 pdd-b hidden">
						<label>Comentario:</label>
						<textarea class="form-control"></textarea>
						<button type="submit" class="btn-agregar">Enviar</button>
					</div>
					<div class="col-md-12 comentario-legal">
						<p>Hookipa se reserva el derecho de borrar o publicar los comentarios, no así editar su contenido. Para poder comentar debes estar inscrito. Inscribete <a href="registro.php" target="_blank">aquí</a> o inicia sesión.</p>
					</div>
				</div>
			</form>
			-->

		</div>
	</div>
</div>
