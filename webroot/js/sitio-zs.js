fullwebroot = '/zsmotor2';
$(document).ready(function(){
	$('.js-buscar-productos').click(function(){
		var categoria = $('#ProductoCategoria').val();
		var url,ancho,apernadura,perfil,aro;
		var texto_busqueda = $('#ProductoFiltro').val();

		if(typeof texto_busqueda != 'undefined' && texto_busqueda != null && texto_busqueda != '' ){
			$('#ProductoFiltroForm').submit();
		}else{
			switch(categoria) {
			    case 'neumaticos':

			    	url 	= '/neumaticos';

			    	ancho 	= $('#ProductoAncho').val();
			    	perfil 	= $('#ProductoPerfil').val();
			    	aro 	= $('#ProductoAro').val();

			    	if(typeof ancho != 'undefined' && ancho != null && ancho != '' ){
			    		url += '/' + ancho;
			    		if(typeof perfil != 'undefined' && perfil != null && perfil != '' ){
			    			url += '/' + perfil;
			    			if(typeof aro != 'undefined' && aro != null && aro != '' ){
			    				url += '/' + aro;
			    			}
			    		}
			    	}
			        break;
			    case 'llantas':
			        url 		= '/llantas';

			    	aro 		= $('#ProductoAro').val();
			        apernadura 	= $('#ProductoApernadura').val();

			        if(typeof aro != 'undefined' && aro != null && aro != '' ){
			        	url += '/' + aro;
			        	if(typeof apernadura != 'undefined' && apernadura != null && apernadura != '' ){
			        		url += '/' + apernadura;
			        	}
			        }

			        break;
			    case 'accesorios':
			        alert('accesorios')
			        break;
			    default:
			        alert('sin categoria')
			}
			window.location = fullwebroot + url;
		}
		return false;
	})
})	