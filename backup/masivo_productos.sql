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
	DECLARE m_count_marcas 				INT DEFAULT 0;
	DECLARE m_marca_id 					BIGINT DEFAULT 0;

	-- CATEGORIAS VARIABLES
	DECLARE c_count_categoria 			INT DEFAULT 0;
	DECLARE c_categoria_id 				BIGINT DEFAULT 0;

	-- SUBCATEGORIAS VARIABLES
	DECLARE c_count_subcategoria 		INT DEFAULT 0;
	DECLARE c_subcategoria_id 			BIGINT DEFAULT 0;

	-- SUBSUBCATEGORIAS VARIABLES
	DECLARE c_count_subsubcategoria 	INT DEFAULT 0;
	DECLARE c_subsubcategoria_id 		BIGINT DEFAULT 0;


	-- CUSTOM VARIABLES
	DECLARE carga_id 					INT DEFAULT 0;
	DECLARE categoria_id 				INT DEFAULT 0;
	DECLARE total_productos 			INT DEFAULT 0;
	DECLARE productos_modificados 		INT DEFAULT 0;
	DECLARE productos_nuevos 			INT DEFAULT 0;
	DECLARE producto_agotado 			TINYINT(1) DEFAULT 0;
	DECLARE producto_activo 			TINYINT(1) DEFAULT 1;

	DECLARE done BOOLEAN DEFAULT 0;
	DECLARE productos CURSOR FOR
		SELECT *
		FROM sitio_productos_cargas;

	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

	SELECT id INTO carga_id FROM sitio_cargas WHERE ejecutando = 1 ORDER BY id DESC LIMIT 1;

	SET total_productos 		= 0;
	SET productos_modificados	= 0;
	SET productos_nuevos		= 0;

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

				SELECT fecha_modificacion,hora_modificacion, COUNT(id)
				FROM sitio_productos p
				WHERE p.sku = cp_sku
				LIMIT 1;
				IF (p_count_productos = 0 || p_fecha_modificacion != cp_fecha_modificacion || p_hora_modificacion != cp_hora_modificacion) THEN

					SET cp_precio_publico = TRUNCATE(cp_precio_publico, 2);
					SET cp_preciofinal_publico = TRUNCATE(cp_preciofinal_publico, 2);
					SET cp_precio_mayorista = TRUNCATE(TRUNCATE(cp_precio_mayorista, 2) * 1.19, 2);
					SET cp_preciofinal_mayorista = TRUNCATE(TRUNCATE(cp_preciofinal_mayorista, 2)*1.19,2);

					-- BUSCO LA MARCA 
					SELECT m.id, COUNT(id) INTO m_marca_id, m_count_marcas
					FROM sitio_marcas m
					WHERE TRIM(LOWER(m.nombre)) = TRIM(LOWER(cp_marca))
					LIMIT 1;

					-- Si no existe la marca, se crea
					IF m_count_marcas = 0 THEN
						INSERT INTO sitio_marcas (nombre, slug, created, modified, imagen) VALUES (CONCAT(TRIM(UCASE(SUBSTRING(cp_marca, 1, 1))),LCASE(TRIM(SUBSTRING(cp_marca, 2)))),TRIM(REPLACE(REPLACE(cp_marca, '/', '-'), ' ', '-')), CURDATE(), CURDATE(), CONCAT(cp_sku, '.jpg') );
						SET m_marca_id = LAST_INSERT_ID();
					END IF;

					IF cp_categoria_id != 3 THEN
						SET categoria_id = cp_categoria_id;
					END IF;

					-- Si es accesorio busco el id de la categoria
					
					IF cp_categoria_id = 3 THEN

						-- Categoria padre
						IF cp_categoria != '' THEN
							-- Busco el id de la categoria padre
							SELECT c.id, COUNT(id) INTO c_categoria_id, c_count_categoria
							FROM sitio_categorias c
							WHERE TRIM(LOWER(c.nombre)) = TRIM(LOWER(cp_categoria))
							AND parent_id = 3
							LIMIT 1;

							-- No existe categoria padre
							IF c_count_categoria = 0 THEN
								INSERT INTO sitio_categorias (parent_id, slug,slug_full, nombre, created, modified) 
								VALUES (
									3
									, LOWER(REPLACE(REPLACE(cp_categoria, '/', '-'), ' ', '-'))
									, LOWER(REPLACE(REPLACE(cp_categoria, '/', '-'), ' ', '-'))
									, CONCAT(UCASE(SUBSTRING(TRIM(cp_categoria), 1, 1)),LCASE(SUBSTRING(TRIM(cp_categoria), 2)))
									, CURDATE()
									, CURDATE()
								);
								SET c_categoria_id = LAST_INSERT_ID();
							END IF;

							SET categoria_id = c_categoria_id;

							-- Subcategoria
							IF cp_subcategoria != '' THEN
								-- Busco el id de la subcategoria 
								SELECT c.id, COUNT(id) INTO c_subcategoria_id, c_count_subcategoria
								FROM sitio_categorias c
								WHERE TRIM(LOWER(c.nombre)) = TRIM(LOWER(cp_subcategoria))
								AND parent_id = categoria_id
								LIMIT 1;

								-- No existe subcategoria
								IF c_count_subcategoria = 0 THEN
									INSERT INTO sitio_categorias (parent_id,  slug,slug_full, nombre, created, modified) 
									VALUES (
										categoria_id
										, LOWER(REPLACE(REPLACE(TRIM(cp_subcategoria), '/', '-'), ' ', '-'))
										, LOWER(REPLACE(REPLACE(TRIM(cp_subcategoria), '/', '-'), ' ', '-'))
										, CONCAT(UCASE(SUBSTRING(TRIM(cp_subcategoria), 1, 1)),LCASE(SUBSTRING(TRIM(cp_subcategoria), 2)))
										, CURDATE()
										, CURDATE()
									);
									SET c_subcategoria_id = LAST_INSERT_ID();
								END IF;

								SET categoria_id = c_subcategoria_id;

								-- Subsubcategoria
								IF cp_subsubcategoria != '' THEN
									-- Busco el id de la subcategoria 
									SELECT c.id, COUNT(id) INTO c_subsubcategoria_id, c_count_subsubcategoria
									FROM sitio_categorias c
									WHERE TRIM(LOWER(c.nombre)) = TRIM(LOWER(cp_subsubcategoria))
									AND parent_id = c_subcategoria_id
									LIMIT 1;

									-- No existe subcategoria
									IF c_count_subsubcategoria = 0 THEN
										INSERT INTO sitio_categorias (parent_id,  slug,slug_full, nombre, created, modified) 
										VALUES (
											c_subcategoria_id
											, LOWER(REPLACE(REPLACE(TRIM(cp_subsubcategoria), '/', '-'), ' ', '-'))
											, LOWER(REPLACE(REPLACE(TRIM(cp_subsubcategoria), '/', '-'), ' ', '-'))
											, CONCAT(UCASE(SUBSTRING(TRIM(cp_subsubcategoria), 1, 1)),LCASE(SUBSTRING(TRIM(cp_subsubcategoria), 2)))
											, CURDATE()
											, CURDATE()
										);
										SET c_subsubcategoria_id = LAST_INSERT_ID();
									END IF;

									SET categoria_id = c_subsubcategoria_id;

								END IF;
							END IF;
						END IF;
					END IF;

					-- COMPRUEBO EL ESTADO DEL PRODUCTO
					SET producto_activo = 1;
					SET producto_agotado = 0;

					IF cp_categoria = 1 THEN
						IF cp_stock < 4 THEN
							SET producto_agotado = 1;
							SET producto_activo = 0;
						END IF;
					END IF;

					IF cp_categoria != 1 THEN
						IF cp_stock < 1 THEN
							SET producto_agotado = 1;
							SET producto_activo = 0;
						END IF;
					END IF;

					-- SI EL PRODUCTO EXISTE
					IF p_count_productos != 0 THEN

						SET productos_modificados = productos_modificados + 1;

						UPDATE sitio_productos p
						SET p.marca_id = m_marca_id
						,p.categoria_id = categoria_id
						,p.nombre = cp_nombre
						,p.slug = cp_slug
						,p.descripcion = cp_descripcion
						,p.ficha = cp_ficha
						,p.precio_publico = cp_precio_publico
						,p.preciofinal_publico = cp_preciofinal_publico
						,p.dcto_publico = cp_dcto_publico
						,p.precio_mayorista = cp_precio_mayorista
						,p.preciofinal_mayorista = cp_preciofinal_mayorista
						,p.dcto_mayorista = cp_dcto_mayorista
						,p.agotado = producto_agotado
						,p.activo = producto_activo
						,p.stock = cp_stock
						,p.stock_compra = cp_stock_compra
						,p.oferta_mayorista = cp_oferta_mayorista
						,p.oferta_publico = cp_oferta_publico
						,p.hora_modificacion = cp_hora_modificacion
						,p.fecha_modificacion = cp_fecha_modificacion
						,p.modified = NOW()
						,p.aro = TRIM(cp_aro)
						,p.perfil = TRIM(cp_perfil)
						,p.apernaduras = TRIM(cp_apernaduras)
						,p.apernadura1 = TRIM(cp_apernadura1)
						,p.apernadura2 = TRIM(cp_apernadura2)
						WHERE p.sku = cp_sku;
					END IF;

					-- SI NO EXITE EL PRODUCTO LO CREO
					IF p_count_productos = 0 THEN
						SET productos_nuevos = productos_nuevos + 1;

						INSERT INTO sitio_productos 
						(
							marca_id
							,categoria_id
							,nombre
							,slug
							,descripcion
							,ficha
							,sku
							,precio_publico
							,preciofinal_publico
							,dcto_publico
							,precio_mayorista
							,preciofinal_mayorista
							,dcto_mayorista
							,agotado
							,activo
							,created
							,modified
							,stock
							,stock_compra
							,oferta_mayorista
							,oferta_publico
							,hora_modificacion
							,fecha_modificacion
							,aro
							,perfil
							,apernaduras
							,apernadura1
							,apernadura2
						)
						VALUES (
							m_marca_id
							,categoria_id
							,cp_descripcion
							,cp_slug
							,cp_descripcion
							,cp_ficha
							,cp_sku
							,cp_precio_publico 
							,cp_preciofinal_publico
							,cp_dcto_publico
							,cp_precio_mayorista
							,cp_preciofinal_mayorista
							,cp_dcto_mayorista
							,producto_agotado
							,producto_activo
							,CURDATE()
							,CURDATE()
							,cp_stock
							,cp_stock_compra
							,cp_oferta_mayorista
							,cp_oferta_publico
							,cp_hora_modificacion
							,cp_fecha_modificacion
							,TRIM(cp_aro)
							,TRIM(cp_perfil)
							,TRIM(cp_apernaduras)
							,TRIM(cp_apernadura1)
							,TRIM(cp_apernadura2)
						);
					END IF;
				END IF;

		UNTIL done END REPEAT;
	CLOSE productos;

	UPDATE sitio_cargas m 
	SET m.ejecutando = 0
	, m.productos_total = total_productos - 1
	, m.productos_modificados = productos_modificados
	, m.productos_nuevos = productos_nuevos
	, m.modified = NOW()
	WHERE m.id = carga_id
	;

	UPDATE sitio_productos SET activo = 0, agotado = 1 WHERE sku NOT IN (SELECT sku FROM sitio_productos_cargas);
END