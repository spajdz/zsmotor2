<?= $this->Html->script(array(
	'vendor/jquery.validate.min',
	'vendor/jquery.alphanumeric.pack',
	'vendor/bootstrap3-typeahead',
	'colegios'
), array('inline' => false)) ;?>
<?= $this->Html->scriptBlock(sprintf('var colegios = %s;', json_encode($colegios))); ?>

<div class="contenedor">
	<?= $this->element('alertas'); ?>

	<div class="text-center nuestras">
		<h2 class="bg-lineas"><span class="bg-blanco">Nuestros Colegios</span></h2>
	</div>

	<div class="row js-lista-nuevo-alumno-container js-container">
		<div class="col-sm-12">
			<div class="cabecera-colegio-reserva">
				<?= $this->Form->create('Colegio', array('url' => array('action' => 'colegio'), 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
					<?= $this->Form->label('colegio', 'Buscar Colegio'); ?>
					<?= $this->Form->input('colegio', array(
						'type'				=> 'text',
						'value'				=> '',
						'class'				=> 'form-control colegio',
						'placeholder'		=> 'Escribe el nombre del colegio',
						'data-provide'		=> 'typeahead',
						'autocomplete'		=> 'off'
					)); ?>
					<?= $this->Form->hidden('id_colegio'); ?>
					<?= $this->Form->submit('Buscar', array('div' => false, 'class' => 'btn')); ?>
				<?= $this->Form->end(); ?>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<? foreach ( $colegios as $colegio ) : ?>
	<? $imagen		= Router::url(sprintf('/img/%s', $this->Hookipa->imagenColegio($colegio['Colegio']['codigo']))); ?>
	<div class="col-md-15 col-sm-3 colegio-caja" data-id="<?= $colegio['Colegio']['id']; ?>">
		<!--div class="colegio" style="background-image:url(<?= $imagen; ?>)">
			<div class="imagen-colegio" style="background-image:url(<?= $imagen; ?>)"></div-->
		<div class="colegio" style="background-image:url('<?= $imagen; ?>')">
			<div class="imagen-colegio" style="background-image:url('<?= $imagen; ?>')"></div>
			<?= $this->Form->create(false, array(
				'url' => array('controller' => 'productos', 'action' => 'index', 'lista' => 'catalogo', 'colegio' => $colegio['Colegio']['codigo'])
			)); ?>
			<div class="form-group">
				<? $niveles = Hash::combine($colegio['Nivel'], '{n}.id', '{n}.nombre'); ?>
				<? if ( $niveles ) : ?>
				<?= $this->Form->input('nivel', array('options' => $niveles, 'class'=>'form-control')); ?>
				<? endif; ?>
				<?= $this->Form->button('VER PRODUCTOS', array('class' => 'btn btn-default'));?>
			</div>
			<?
			echo $this->Form->end();
			?>
		</div>
		<div class="text-center"><p class="bajada"><?= h($colegio['Colegio']['nombre']);  ?></p></div>
	</div>
	<? endforeach; ?>
</div>
