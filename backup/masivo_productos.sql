BEGIN
	-- PRODUCTOS CARGAS VARIABLES
	DECLARE cp_id 						BIGINT DEFAULT 0;
	DECLARE cp_id_erp 					BIGINT DEFAULT 0;
	DECLARE cp_sku 						VARCHAR(40) DEFAULT '';
	DECLARE cp_nombre 					VARCHAR(200) DEFAULT '';
	DECLARE cp_slug 					VARCHAR(250) DEFAULT '';
	DECLARE cp_descripcion 				LONGTEXT DEFAULT '';
	DECLARE cp_ficha 					TEXT DEFAULT '';
	DECLARE cp_categoria_id 			BIGINT DEFAULT 0;
	DECLARE cp_marca 					VARCHAR(255) DEFAULT '';
	DECLARE cp_stock 					INT DEFAULT 0;
	DECLARE cp_stock_fisico 			INT DEFAULT 0;
	DECLARE cp_stock_compra 			INT DEFAULT 0;
	DECLARE cp_precio_publico 			INT DEFAULT 0;
	DECLARE cp_oferta_publico 			TINYINT(1) DEFAULT 0;
	DECLARE cp_dcto_publico 			FLOAT DEFAULT 0;
	DECLARE cp_preciofinal_publico 		INT DEFAULT 0;
	DECLARE cp_precio_mayorista 		INT DEFAULT 0;
	DECLARE cp_oferta_mayorista 		TINYINT(1) DEFAULT 0;
	DECLARE cp_dcto_mayorista 			FLOAT DEFAULT 0;
	DECLARE cp_preciofinal_mayorista	INT DEFAULT 0;
	DECLARE cp_apernaduras 				VARCHAR(100) DEFAULT '';
	DECLARE cp_apernadura1 				VARCHAR(100) DEFAULT '';
	DECLARE cp_apernadura2 				VARCHAR(100) DEFAULT '';
	DECLARE cp_aro 						INT DEFAULT 0;
	DECLARE cp_ancho 					INT DEFAULT 0;
	DECLARE cp_perfil 					INT DEFAULT 0;
	DECLARE cp_fecha_modificacion 		VARCHAR(255) DEFAULT '';
	DECLARE cp_hora_modificacion 		TIME DEFAULT NULL;
	DECLARE cp_stock_b015 				INT DEFAULT 0;
	DECLARE cp_stock_b301 				INT DEFAULT 0;
	DECLARE cp_stock_b401 				INT DEFAULT 0;
	DECLARE cp_stock_b701 				INT DEFAULT 0;
	DECLARE cp_stock_b901 				INT DEFAULT 0;
	DECLARE cp_stock_bclm 				INT DEFAULT 0;
	DECLARE cp_stock_bvtm 				INT DEFAULT 0;
	DECLARE cp_stock_blco 				INT DEFAULT 0;
	DECLARE cp_activo 					TINYINT(1) DEFAULT 0;
	DECLARE cp_agotado 					TINYINT(1) DEFAULT 0;
	DECLARE cp_eliminado 				TINYINT(1) DEFAULT 0;
	DECLARE cp_categoria 				VARCHAR(255) DEFAULT '';
	DECLARE cp_subcategoria 			VARCHAR(255) DEFAULT '';
	DECLARE cp_subsubcategoria 			VARCHAR(255) DEFAULT '';
	DECLARE cp_super_familia 			VARCHAR(255) DEFAULT '';
	DECLARE cp_familia 					VARCHAR(255) DEFAULT '';
	DECLARE cp_stock_seguridad 			INT DEFAULT 0;
	DECLARE cp_created 					DATETIME DEFAULT NULL;
	DECLARE cp_modified 				DATETIME DEFAULT NULL;

	-- PRODUCTOS VARIABLES
	DECLARE p_fecha_modificacion 		VARCHAR(255) DEFAULT '';
	DECLARE p_hora_modificacion 		TIME DEFAULT NULL;
	DECLARE p_count_productos 			INT DEFAULT 0;

	-- MARCAS VARIABLES
	DECLARE m_count_marcas 			INT DEFAULT 0;
	DECLARE m_marca_id 				BIGINT DEFAULT 0;


	-- CUSTOM VARIABLES
	DECLARE carga_id INT DEFAULT 0;
	DECLARE total_productos INT DEFAULT 0;
	DECLARE productos_modificados INT DEFAULT 0;

	DECLARE done BOOLEAN DEFAULT 0;
	DECLARE productos CURSOR FOR
		SELECT *
		FROM sitio_productos_cargas;

	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

	SELECT id INTO carga_id FROM sitio_cargas WHERE ejecutando = 1 ORDER BY id DESC LIMIT 1;

	SET total_productos 		= 0;
	SET productos_modificados	= 0;

	OPEN productos;
		REPEAT
			FETCH productos INTO
				cp_id 						
				,cp_id_erp 					
				,cp_sku 						
				,cp_nombre 					
				,cp_slug 					
				,cp_descripcion 				
				,cp_ficha 					
				,cp_categoria_id 			
				,cp_marca 					
				,cp_stock 					
				,cp_stock_fisico 			
				,cp_stock_compra 			
				,cp_precio_publico 			
				,cp_oferta_publico 			
				,cp_dcto_publico 			
				,cp_preciofinal_publico 		
				,cp_precio_mayorista 		
				,cp_oferta_mayorista 		
				,cp_dcto_mayorista 			
				,cp_preciofinal_mayorista	
				,cp_apernaduras 				
				,cp_apernadura1 				
				,cp_apernadura2 				
				,cp_aro 						
				,cp_ancho 					
				,cp_perfil 					
				,cp_fecha_modificacion 		
				,cp_hora_modificacion 		
				,cp_stock_b015 				
				,cp_stock_b301 				
				,cp_stock_b401 				
				,cp_stock_b701 				
				,cp_stock_b901 				
				,cp_stock_bclm 				
				,cp_stock_bvtm 				
				,cp_stock_blco 				
				,cp_activo 					
				,cp_agotado 					
				,cp_eliminado 				
				,cp_categoria 				
				,cp_subcategoria 			
				,cp_subsubcategoria 			
				,cp_super_familia 			
				,cp_familia 					
				,cp_stock_seguridad 			
				,cp_created 					
				,cp_modified;

				SET total_productos = total_productos + 1;

				-- VERIFICO LA FECHA DE ACTUALIZACION DEL PRODUCTO
				SELECT fecha_modificacion,hora_modificacion, COUNT(id) INTO p_fecha_modificacion,p_hora_modificacion, p_count_productos
				FROM sitio_productos p
				WHERE p.sku = cp_sku
				LIMIT 1;

				IF (count_productos = 0 || p_fecha_modificacion != cp_fecha_modificacion || p_hora_modificacion != cp_hora_modificacion) THEN
					SET productos_modificados = productos_modificados + 1;

					SET cp_precio_publico = TRUNCATE(cp_precio_publico, 2);
					SET cp_preciofinal_publico = TRUNCATE(cp_preciofinal_publico, 2);
					SET cp_precio_mayorista = TRUNCATE(TRUNCATE(cp_precio_mayorista, 2) * 1.19, 2);
					SET cp_preciofinal_mayorista = TRUNCATE(TRUNCATE(cp_preciofinal_mayorista, 2)*1.19,2);

					-- BUSCO LA MARCA 
					SELECT id, COUNT(id) INTO m_marca_id, m_count_marca
					FROM sitio_marcas m
					WHERE TRIM(LOWER(m.nombre)) = TRIM(LOWER(producto_marca))
					LIMIT 1;


				ENDIF;
		UNTIL done END REPEAT;
	CLOSE productos;
END