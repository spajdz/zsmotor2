/* jshint bitwise:true, browser:true, eqeqeq:true, forin:true, globalstrict:true, indent:4, jquery:true,
   loopfunc:true, maxerr:3, noarg:true, node:true, noempty:true, onevar: true, quotmark:single,
   strict:true, undef:true, white:false */
/* global number_format */

/*!
 * Hookipa 2015
 */

//<![CDATA[
'use strict';

/**
 * jQuery
 */
jQuery(document).ready(function($)
{
	/**
	 * Input autocomplete y codigo colegio
	 */
	var $autocomplete		= $('[name="data[Lista][colegio]"]'),
		$colegio_id			= $('[name="data[Lista][colegio_id]"]'),
		$nivel_id			= $('[name="data[Lista][nivel_id]"]'),
		$btn				= $('.js-btnEnviar');

	$btn.prop('disabled', true);

	/**
	 * Autocomplete
	 */
	if ( $autocomplete.length )
	{
		/**
		 * Limpieza inicial
		 */
		$autocomplete.val('');
		$colegio_id.val('');
		$nivel_id.val('');

		/**
		 * Autocomplete del nombre del colegio
		 */
		$autocomplete.typeahead(
		{
			source              : colegios,
			minLength           : (colegios.length < 10 ? 0 : 1),
			autoSelect          : false,
			showHintOnFocus     : true,
			displayText         : function(item)
			{
				return item.Colegio.nombre;
			}
		});

		/**
		 * Actualiza el codigo del colegio o elimina el colegio
		 * si no corresponde a una opcion del autoselector
		 */
		$autocomplete.on('change blur', function()
		{
			$('.js-select-nivel-vacio').hide();

			var $this			= $(this),
				current			= $this.typeahead('getActive');

			if ( typeof(current) !== 'undefined' )
			{
				/**
				 * Seleccion de opcion
				 */
				if ( current.Colegio.nombre === $this.val() )
				{
					$colegio_id.val(current.Colegio.id);

					$('.js-select-nivel').show();
					$('.js-select-nivel').filter("[data-colegio_id!='" + current.Colegio.id + "']").toggle();
					$btn.removeAttr('disabled');
				}

				/**
				 * Opcion no existente
				 */
				else
				{
					$this.val('');
					$colegio_id.val('');
					$nivel_id.val('');

					$('.js-select-nivel').hide();
					$('.js-select-nivel-vacio').show();
					$btn.prop('disabled', true);
				}
			}
		});
	}


	$('.js-select-nivel').on('change', function()
	{
		var $this		= $(this).find(':selected'),
			idnivel		= $this.val();


			console.log(idnivel);
			$nivel_id.val(idnivel);
			$btn.removeAttr('disabled');
	});
});

//]]>
