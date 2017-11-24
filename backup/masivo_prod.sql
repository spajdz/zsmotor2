BEGIN
	DECLARE producto_id BIGINT DEFAULT 0;
	DECLARE producto_sku VARCHAR(100) DEFAULT '';
	DECLARE producto_descripcion VARCHAR(100) DEFAULT '';
	DECLARE producto_stock INT DEFAULT 0 ;
	DECLARE producto_precio_publico DOUBLE DEFAULT 0;
	DECLARE producto_dscto_publico DOUBLE DEFAULT 0;
	DECLARE producto_preciofinal_publico DOUBLE DEFAULT 0;
	DECLARE producto_precio_mayorista DOUBLE DEFAULT 0;
	DECLARE producto_dscto_mayorista DOUBLE DEFAULT 0;
	DECLARE producto_preciofinal_mayorista DOUBLE DEFAULT 0;
	DECLARE producto_categoria VARCHAR(100) DEFAULT '';
	DECLARE producto_subcategoria VARCHAR(100) DEFAULT '';
	DECLARE producto_subsubcategoria VARCHAR(100) DEFAULT '';
	DECLARE producto_marca VARCHAR(100) DEFAULT '';
	DECLARE producto_activo_ws TINYINT(1) DEFAULT 0;
	DECLARE producto_ficha LONGTEXT DEFAULT '';
	DECLARE producto_id_ws BIGINT DEFAULT 0;
	DECLARE producto_descrip VARCHAR(100) DEFAULT '';
	DECLARE producto_stock_fi BIGINT DEFAULT 0;
	DECLARE producto_super_fam VARCHAR(100) DEFAULT '';
	DECLARE producto_familia VARCHAR(100) DEFAULT '';
	DECLARE producto_categorias BIGINT DEFAULT 0;
	DECLARE producto_stock_seguridad BIGINT DEFAULT 0;
	DECLARE producto_apernadura VARCHAR(100) DEFAULT '';
	DECLARE producto_aro DOUBLE DEFAULT 0;
	DECLARE producto_ancho_llanta DOUBLE DEFAULT 0;
	DECLARE producto_ancho DOUBLE DEFAULT 0;
	DECLARE producto_perfil DOUBLE DEFAULT 0;
	DECLARE producto_fecha_compra VARCHAR(100) DEFAULT '';
	DECLARE producto_oferta_mayorista BIGINT DEFAULT 0;
	DECLARE producto_oferta_publico BIGINT DEFAULT 0;
	DECLARE producto_stock_compra BIGINT DEFAULT 0;
	DECLARE producto_fecha VARCHAR(100) DEFAULT '';
	DECLARE producto_slug VARCHAR(100) DEFAULT '';

	-- NUEVAS
	DECLARE producto_activo TINYINT(1) DEFAULT 1;
	DECLARE producto_agotado TINYINT(1) DEFAULT 0;
	DECLARE producto_marca_id BIGINT DEFAULT 0;
	DECLARE producto_count_marca INT DEFAULT 0;

	-- CATEGORIAS
	DECLARE producto_categoria_id BIGINT DEFAULT 0;
	DECLARE producto_count_categoria INT DEFAULT 0;
	DECLARE producto_subcategoria_id BIGINT DEFAULT 0;
	DECLARE producto_count_subcategoria INT DEFAULT 0;	
	DECLARE producto_subsubcategoria_id BIGINT DEFAULT 0;
	DECLARE producto_count_subsubcategoria INT DEFAULT 0;

	DECLARE producto_apernadura_id BIGINT DEFAULT 0;
	DECLARE producto_count_apernadura INT DEFAULT 0;
	DECLARE producto_aro_id BIGINT DEFAULT 0;
	DECLARE producto_count_aro INT DEFAULT 0;
	DECLARE producto_ancho_llanta_id BIGINT DEFAULT 0;
	DECLARE producto_count_ancho_llanta INT DEFAULT 0;
	DECLARE producto_ancho_id BIGINT DEFAULT 0;
	DECLARE producto_count_ancho INT DEFAULT 0;
	DECLARE producto_perfil_id BIGINT DEFAULT 0;
	DECLARE producto_count_perfil INT DEFAULT 0;

	DECLARE producto_relacion_id INT DEFAULT 1;
	DECLARE producto_count_relacion INT DEFAULT 0;

	DECLARE producto_fecha_ultima_modificacion VARCHAR(100) DEFAULT '';
	DECLARE producto_fecha_ultima_modificacion_bd VARCHAR(100) DEFAULT '';
	DECLARE id_producto BIGINT DEFAULT 0;
	DECLARE id_producto_count INT DEFAULT 0;
	DECLARE count_productos INT DEFAULT 0;

	-- Productos
	DECLARE total_productos INT DEFAULT 0;
	DECLARE productos_modificados INT DEFAULT 0;
	DECLARE masivo_id INT DEFAULT 0;

	DECLARE producto_id_final BIGINT DEFAULT 0;
	DECLARE producto_categoria_id_final BIGINT DEFAULT 0;
	DECLARE productos_categoria_id_final BIGINT DEFAULT 0;
	DECLARE id_productos_categoria_count BIGINT DEFAULT 0;

	DECLARE done BOOLEAN DEFAULT 0;
	DECLARE productos CURSOR FOR
		SELECT *
		FROM _temporal_productos;

	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

	UPDATE sitio_productos SET activo = 0 WHERE sku NOT IN (SELECT codigo FROM _temporal_productos);

	SELECT id INTO masivo_id FROM sitio_masivas ORDER BY id DESC LIMIT 1;

	SET total_productos 		= 0;
	SET productos_modificados	= 0;

	OPEN productos;
		REPEAT 
			FETCH productos INTO 
			producto_id
			, producto_sku
			, producto_descripcion
			, producto_stock
			, producto_precio_publico
			, producto_dscto_publico
			, producto_preciofinal_publico
			, producto_precio_mayorista
			, producto_dscto_mayorista
			, producto_preciofinal_mayorista
			, producto_categoria
			, producto_subcategoria
			, producto_subsubcategoria
			, producto_marca
			, producto_activo_ws
			, producto_ficha
			, producto_id_ws
			, producto_descrip
			, producto_stock_fi
			, producto_super_fam
			, producto_familia
			, producto_categorias
			, producto_stock_seguridad
			, producto_apernadura
			, producto_aro
			, producto_ancho_llanta
			, producto_ancho
			, producto_perfil
			, producto_fecha_compra
			, producto_oferta_mayorista
			, producto_oferta_publico
			, producto_stock_compra
			, producto_fecha
			, producto_slug 
			, producto_fecha_ultima_modificacion;

			SET total_productos = total_productos + 1;

			-- VERIFICO LA FECHA DE ACTUALIZACION DEL PRODUCTO
			SELECT fecha_ultima_modificacion,COUNT(id) INTO producto_fecha_ultima_modificacion_bd, count_productos
			FROM sitio_productos p
			WHERE p.sku = producto_sku
			LIMIT 1;
            
			-- SI NO TIENE FECHA DE MODIFICACION O ES DISTINTA A LA REGISTRADA SE CREA O MODIFICA EL PRODUCTO
			IF (producto_fecha_ultima_modificacion_bd != producto_fecha_ultima_modificacion || count_productos = 0 || SUBSTRING(producto_fecha_ultima_modificacion_bd, 1, 10 ) = CURDATE() )  THEN
				
                -- select producto_sku;
				SET productos_modificados = productos_modificados + 1;

				SET producto_precio_publico = TRUNCATE(producto_precio_publico, 2);
				SET producto_preciofinal_publico = TRUNCATE(producto_preciofinal_publico, 2);
				SET producto_precio_mayorista = TRUNCATE(TRUNCATE(producto_precio_mayorista, 2) * 1.19, 2);
				SET producto_preciofinal_mayorista = TRUNCATE(TRUNCATE(producto_preciofinal_mayorista, 2)*1.19,2);

				-- BUSCO LA MARCA 
				SELECT id, COUNT(id) INTO producto_marca_id, producto_count_marca
				FROM sitio_marcas m
				WHERE TRIM(LOWER(m.nombre)) = TRIM(LOWER(producto_marca))
				LIMIT 1;

				-- No existe la marca
				IF producto_count_marca = 0 THEN
					INSERT INTO sitio_marcas (nombre, slug, created, modified, nombreimg) VALUES (CONCAT(UCASE(SUBSTRING(producto_marca, 1, 1)),LCASE(SUBSTRING(producto_marca, 2))),REPLACE(REPLACE(producto_marca, '/', '-'), ' ', '-'), CURDATE(), CURDATE(), CONCAT(producto_sku, '.jpg') );
					SET producto_marca_id = LAST_INSERT_ID();
				END IF;

				-- BUSCO CATEGORIAS PARA NEUMATICOS (producto_categorias = 2)
				IF producto_categorias = 2 THEN

					-- CATEGORIA PADRE ES EL ARO
					-- BUSCO CATEGORIA PADRE
					SELECT id, COUNT(id) INTO producto_categoria_id, producto_count_categoria
					FROM sitio_categorias c
					WHERE TRIM(LOWER(c.nombre)) = TRIM(LOWER(producto_aro))
					AND c.parent_id = 0
					AND c.producto_tipo_id = 2
					LIMIT 1;

					-- No existe categoria padre
					IF producto_count_categoria = 0 THEN
						INSERT INTO sitio_categorias (parent_id, producto_tipo_id, slug, nombre, created, modified) VALUES (0,producto_categorias, REPLACE(REPLACE(producto_aro, '/', '-'), ' ', ''), CONCAT(UCASE(SUBSTRING(producto_aro, 1, 1)),LCASE(SUBSTRING(producto_aro, 2))), CURDATE(), CURDATE());
						SET producto_categoria_id = LAST_INSERT_ID();
					END IF;

					-- select producto_categoria_id as primero;
					-- select producto_sku as primero;


					-- SUBCATEGORIA ES ANCHO
					-- BUSCO SUBCATEGORIA

					SELECT id, COUNT(id) INTO producto_subcategoria_id, producto_count_subcategoria
					FROM sitio_categorias c
					WHERE TRIM(LOWER(c.nombre)) = TRIM(LOWER(producto_ancho))
					AND parent_id = producto_categoria_id
					AND c.producto_tipo_id = 2
					LIMIT 1;


					-- No existe subcategoria 
					IF producto_count_subcategoria = 0 THEN
						INSERT INTO sitio_categorias (parent_id, producto_tipo_id, slug, nombre) VALUES (producto_categoria_id,producto_categorias, REPLACE(REPLACE(producto_ancho, '/', '-'), ' ', ''), CONCAT(UCASE(SUBSTRING(producto_ancho, 1, 1)),LCASE(SUBSTRING(producto_ancho, 2))));
						SET producto_subcategoria_id = LAST_INSERT_ID();
					END IF;

					-- select producto_perfil buscar; 
					-- SUBSUBCATEGORIA ES PERFIL
					-- BUSCO SUBSUBCATEGORIA
					SELECT id, COUNT(id) INTO producto_subsubcategoria_id, producto_count_subsubcategoria
					FROM sitio_categorias c
					WHERE TRIM(LOWER(c.nombre)) = TRIM(LOWER(producto_perfil))
					AND parent_id = producto_subcategoria_id
					AND c.producto_tipo_id = 2
					LIMIT 1;
					-- select producto_subsubcategoria_id subcatluegobuscar;

					-- No existe subsubcategoria 
					IF producto_count_subsubcategoria = 0 THEN
						INSERT INTO sitio_categorias (parent_id, producto_tipo_id, slug, nombre) VALUES (producto_subcategoria_id,producto_categorias, REPLACE(REPLACE(producto_perfil, '/', '-'), ' ', ''), CONCAT(UCASE(SUBSTRING(producto_perfil, 1, 1)),LCASE(SUBSTRING(producto_perfil, 2))));
						SET producto_subsubcategoria_id = LAST_INSERT_ID();
					END IF;

				END IF;

				-- BUSCO CATEGORIAS PARA LLANTAS (producto_categorias = 1)
				IF producto_categorias = 1 THEN

					-- CATEGORIA PADRE ES EL ARO
					-- BUSCO CATEGORIA PADRE
					SELECT id, COUNT(id) INTO producto_categoria_id, producto_count_categoria
					FROM sitio_categorias c
					WHERE TRIM(LOWER(c.nombre)) = TRIM(LOWER(producto_aro))
					AND c.parent_id = 0
					AND c.producto_tipo_id = 1
					LIMIT 1;

					-- No existe categoria padre
					IF producto_count_categoria = 0 THEN
						INSERT INTO sitio_categorias (parent_id, producto_tipo_id, slug, nombre, created, modified) VALUES (0,producto_categorias, REPLACE(REPLACE(producto_aro, '/', '-'), ' ', ''), CONCAT(UCASE(SUBSTRING(producto_aro, 1, 1)),LCASE(SUBSTRING(producto_aro, 2))), CURDATE(), CURDATE());
						SET producto_categoria_id = LAST_INSERT_ID();
					END IF;

					-- SUBCATEGORIA ES APERNADURA
					-- BUSCO SUBCATEGORIA
					SELECT id, COUNT(id) INTO producto_subcategoria_id, producto_count_subcategoria
					FROM sitio_categorias c
					WHERE TRIM(LOWER(c.nombre)) = TRIM(LOWER(producto_apernadura))
					AND parent_id = producto_categoria_id
					AND c.producto_tipo_id = 1
					LIMIT 1;

					-- No existe subcategoria 
					IF producto_count_subcategoria = 0 THEN
						INSERT INTO sitio_categorias (parent_id, producto_tipo_id, slug, nombre) VALUES (producto_categoria_id,producto_categorias, REPLACE(REPLACE(producto_apernadura, '/', '-'), ' ', ''), CONCAT(UCASE(SUBSTRING(producto_apernadura, 1, 1)),LCASE(SUBSTRING(producto_apernadura, 2))));
						SET producto_subcategoria_id = LAST_INSERT_ID();
					END IF;

				END IF;

				-- BUSCO CATEGORIAS PARA ACCESORIOS (producto_categorias = 3)
				IF producto_categorias = 3 THEN
					-- BUSCO CATEGORIA PADRE
				  SELECT id, COUNT(id) INTO producto_categoria_id, producto_count_categoria
				  FROM sitio_categorias c
				  WHERE TRIM(LOWER(c.nombre)) = TRIM(LOWER(producto_categoria))
				  AND parent_id = 0
				  LIMIT 1;

				-- No existe categoria padre
				 IF producto_count_categoria = 0 THEN
				 	INSERT INTO sitio_categorias (parent_id, producto_tipo_id, slug, nombre, created, modified) VALUES (0,producto_categorias, REPLACE(REPLACE(producto_marca, '/', '-'), ' ', '-'), CONCAT(UCASE(SUBSTRING(producto_categoria, 1, 1)),LCASE(SUBSTRING(producto_categoria, 2))), CURDATE(), CURDATE());
				 	SET producto_categoria_id = LAST_INSERT_ID();
				 END IF;

				-- BUSCO SUBCATEGORIA
				 SELECT id, COUNT(id) INTO producto_subcategoria_id, producto_count_subcategoria
				 FROM sitio_categorias c
				 WHERE TRIM(LOWER(c.nombre)) = TRIM(LOWER(producto_subcategoria))
				 AND parent_id = producto_categoria_id
				 LIMIT 1;

				-- No existe subcategoria 
				 IF producto_count_subcategoria = 0 THEN
				 	INSERT INTO sitio_categorias (parent_id, producto_tipo_id, slug, nombre) VALUES (producto_categoria_id,producto_categorias, REPLACE(REPLACE(producto_marca, '/', '-'), ' ', '-'), CONCAT(UCASE(SUBSTRING(producto_categoria, 1, 1)),LCASE(SUBSTRING(producto_categoria, 2))));
				 	SET producto_subcategoria_id = LAST_INSERT_ID();
				 END IF;
-- 
				
				 -- BUSCO SUBSUBCATEGORIA
				 SELECT id, COUNT(id) INTO producto_subsubcategoria_id, producto_count_subsubcategoria
				 FROM sitio_categorias c
				 WHERE TRIM(LOWER(c.nombre)) = TRIM(LOWER(producto_subsubcategoria))
				 AND parent_id = producto_subcategoria_id
				 LIMIT 1;

				-- No existe subsubcategoria 
				 IF producto_count_subsubcategoria = 0 THEN
				 	INSERT INTO sitio_categorias (parent_id, producto_tipo_id, slug, nombre) VALUES (producto_subcategoria_id,producto_categorias, REPLACE(REPLACE(producto_marca, '/', '-'), ' ', '-'), CONCAT(UCASE(SUBSTRING(producto_categoria, 1, 1)),LCASE(SUBSTRING(producto_categoria, 2))));
				 	SET producto_categoria_id = LAST_INSERT_ID();
				 END IF;
				END IF;

				IF producto_categorias != 3 THEN
					-- BUSCO LA APERNADURA
					SELECT id, COUNT(id) INTO producto_apernadura_id, producto_count_apernadura
					FROM sitio_producto_apernaduras a
					WHERE TRIM(LOWER(a.nombre)) = TRIM(LOWER(producto_apernadura))
					LIMIT 1;

					-- No existe la apernadura
					IF producto_count_apernadura = 0 THEN
						INSERT INTO sitio_producto_apernaduras (nombre, activo, created, modified) VALUES (REPLACE( CONCAT(UCASE(SUBSTRING(producto_apernadura, 1, 1)),LCASE(SUBSTRING(producto_apernadura, 2))), '?', ''  ) ,1, CURDATE(), CURDATE() );
						SET producto_apernadura_id = LAST_INSERT_ID();
					END IF;

					-- BUSCO EL ARO
					SELECT id, COUNT(id) INTO producto_aro_id, producto_count_aro
					FROM sitio_producto_aros a
					WHERE TRIM(LOWER(a.nombre)) = TRIM(LOWER(producto_aro))
					LIMIT 1;

					-- No existe el aro
					IF producto_count_aro = 0 THEN
						INSERT INTO sitio_producto_aros (nombre, activo, created, modified) VALUES (CONCAT(UCASE(SUBSTRING(producto_aro, 1, 1)),LCASE(SUBSTRING(producto_aro, 2))),1, CURDATE(), CURDATE() );
						SET producto_aro_id = LAST_INSERT_ID();
					END IF;

					IF producto_categorias = 1 THEN
						-- BUSCO EL ANCHO DE LLANTA
						SELECT id, COUNT(id) INTO producto_ancho_llanta_id, producto_count_ancho_llanta
						FROM sitio_producto_anchos a
						WHERE TRIM(LOWER(a.nombre)) = TRIM(LOWER(producto_ancho_llanta))
						LIMIT 1;

						-- No existe el ancho llantas
						IF producto_count_ancho_llanta = 0 THEN
							INSERT INTO sitio_producto_anchos (nombre, activo, created, modified) VALUES (CONCAT(UCASE(SUBSTRING(producto_ancho_llanta, 1, 1)),LCASE(SUBSTRING(producto_ancho_llanta, 2))),1, CURDATE(), CURDATE() );
							SET producto_ancho_llanta_id = LAST_INSERT_ID();
						END IF;
					END IF;

					IF producto_categorias = 2 THEN
						-- BUSCO EL ANCHO 
						SELECT id, COUNT(id) INTO producto_ancho_id, producto_count_ancho
						FROM sitio_producto_anchos a
						WHERE TRIM(LOWER(a.nombre)) = TRIM(LOWER(producto_ancho))
						LIMIT 1;

						-- No existe el ancho 
						IF producto_count_ancho = 0 THEN
							INSERT INTO sitio_producto_anchos (nombre, activo, created, modified) VALUES (CONCAT(UCASE(SUBSTRING(producto_ancho, 1, 1)),LCASE(SUBSTRING(producto_ancho, 2))),1, CURDATE(), CURDATE() );
							SET producto_ancho_id = LAST_INSERT_ID();
						END IF;
					END IF;

					-- BUSCO EL PERFIL 
					SELECT id, COUNT(id) INTO producto_perfil_id, producto_count_perfil
					FROM sitio_producto_perfiles a
					WHERE TRIM(LOWER(a.nombre)) = TRIM(LOWER(producto_perfil))
					LIMIT 1;

					-- No existe el perfil 
					IF producto_count_perfil = 0 THEN
						INSERT INTO sitio_producto_perfiles (nombre, activo, created, modified) VALUES (CONCAT(UCASE(SUBSTRING(producto_perfil, 1, 1)),LCASE(SUBSTRING(producto_perfil, 2))),1, CURDATE(), CURDATE() );
						SET producto_perfil_id = LAST_INSERT_ID();
					END IF;

				END IF;

				IF producto_categorias = 1 THEN
					IF producto_ancho_llanta_id != 0 AND  producto_apernadura_id != 0 AND producto_aro_id != 0 AND producto_marca_id != 0 THEN
						-- BUSCO LA RELACION 
						SELECT id, COUNT(id) INTO producto_relacion_id, producto_count_relacion
						FROM sitio_producto_relaciones pr
						WHERE pr.ancho_id = producto_ancho_llanta_id
						AND pr.aro_id = producto_aro_id
						AND pr.apernadura_id = producto_apernadura_id
						LIMIT 1;

						-- select producto_ancho_llanta_id;
						-- No existe la relacion|
						IF producto_count_relacion = 0 THEN
							INSERT INTO sitio_producto_relaciones (ancho_id, aro_id,apernadura_id, created, modified) VALUES (producto_ancho_llanta_id,producto_aro_id,producto_apernadura_id, CURDATE(), CURDATE() );
							SET producto_relacion_id = LAST_INSERT_ID();
						END IF;

					END IF;
				END IF;

				IF producto_categorias = 2 THEN
					IF producto_ancho_id != 0 AND  producto_perfil_id != 0 AND producto_aro_id != 0 AND producto_marca_id != 0 THEN
						-- BUSCO LA RELACION 
						SELECT id, COUNT(id) INTO producto_relacion_id, producto_count_relacion
						FROM sitio_producto_relaciones pr
						WHERE pr.ancho_id = producto_ancho_id
						AND pr.aro_id = producto_aro_id
						AND pr.perfil_id = producto_perfil_id
						LIMIT 1;

						-- select producto_ancho_id;
						-- No existe la relacion
						IF producto_count_relacion = 0 THEN
							INSERT INTO sitio_producto_relaciones (ancho_id, aro_id,perfil_id, created, modified) VALUES (producto_ancho_id,producto_aro_id,producto_perfil_id, CURDATE(), CURDATE() );
							SET producto_relacion_id = LAST_INSERT_ID();
						END IF;
					END IF;
				END IF;

				-- COMPRUEBO EL ESTADO DEL PRODUCTO
				SET producto_activo = 1;
				SET producto_agotado = 0;

				IF producto_categorias = 1 THEN
					IF producto_stock < 4 THEN
						SET producto_agotado = 1;
						SET producto_activo = 0;
					END IF;
				END IF;

				IF producto_categorias != 1 THEN
					IF producto_stock < 1 THEN
						SET producto_agotado = 1;
						SET producto_activo = 0;
					END IF;
				END IF;

				-- SE VERIFICA SI EL PRODUCTO EXISTE
				SELECT id, COUNT(id) INTO id_producto, id_producto_count
				FROM sitio_productos p 
				WHERE p.sku = producto_sku
				LIMIT 1;


				-- CREO LA RELACION DE CATEGORIA CON EL PRODUCTO
				-- select producto_subsubcategoria_id;
				IF  producto_categorias = 2 THEN
					SET producto_categoria_id_final = producto_subsubcategoria_id;
				END IF;

				IF producto_categorias = 3  OR producto_categorias = 1 THEN
					SET producto_categoria_id_final = producto_subcategoria_id;
				END IF;

				-- SI EXITE EL PRODUCTO LO ACTUALIZO
				IF id_producto_count > 0 THEN
					UPDATE sitio_productos p
					SET p.marca_id = producto_marca_id
					,p.producto_tipo = producto_categorias
					,p.producto_relacion_id = producto_relacion_id
					,p.nombre = producto_descripcion
					,p.slug = producto_slug
					,p.descripcion = producto_descripcion
					,p.ficha = producto_ficha
					,p.precio = producto_precio_publico
					,p.preciofinal = producto_preciofinal_publico
					,p.por_descuento = producto_dscto_publico
					,p.precio_mayorista = producto_precio_mayorista
					,p.preciofinal_mayorista = producto_preciofinal_mayorista
					,p.por_descuento_mayorista = producto_dscto_mayorista
					,p.agotado = producto_agotado
					,p.activo = producto_activo
					,p.stock = producto_stock
					,p.stock_compra = producto_stock_compra
					,p.oferta_mayorista = producto_oferta_mayorista
					,p.oferta_publico = producto_oferta_publico
					,p.fecha_ultima_compra = producto_fecha_compra
					,p.fecha_ultima_modificacion = producto_fecha_ultima_modificacion
					,p.producto_ws = 1
					WHERE p.sku = producto_sku;

					SELECT id, COUNT(id) INTO producto_id_final, id_producto_count
					FROM sitio_productos p 
					WHERE p.sku = producto_sku
					LIMIT 1;

					SELECT id, COUNT(id) INTO productos_categoria_id_final, id_productos_categoria_count
					FROM sitio_productos_categorias pc
					WHERE pc.producto_id = producto_id_final
					LIMIT 1;

					-- select producto_sku;

					-- IF producto_categorias = 1 OR producto_categorias = 2 THEN
						IF id_productos_categoria_count = 0 THEN
							INSERT INTO sitio_productos_categorias (producto_id, categoria_id) VALUES (producto_id_final,producto_categoria_id_final);
						END IF;

						-- select producto_categoria_id_final antesupdate;
						IF id_productos_categoria_count > 0 THEN 
							UPDATE sitio_productos_categorias SET categoria_id = producto_categoria_id_final WHERE id = productos_categoria_id_final;
						END IF;
					-- END IF;

				END IF;

				-- SI NO EXITE EL PRODUCTO LO CREO
				IF id_producto_count = 0 THEN
					INSERT INTO sitio_productos 
					(
						marca_id
						,producto_tipo
						,producto_relacion_id
						,nombre
						,slug
						,descripcion
						,ficha
						,sku
						,precio 
						,preciofinal
						,por_descuento
						,precio_mayorista
						,preciofinal_mayorista
						,por_descuento_mayorista
						,agotado
						,activo
						,created
						,modified
						,stock
						,stock_compra
						,oferta_mayorista
						,oferta_publico
						,fecha_ultima_compra
						,producto_ws
						,fecha_ultima_modificacion
					)
					VALUES (
						producto_marca_id
						,producto_categorias
						,producto_relacion_id
						,producto_descripcion
						,producto_slug
						,producto_descripcion
						,producto_ficha
						,producto_sku
						,producto_precio_publico 
						,producto_preciofinal_publico
						,producto_dscto_publico
						,producto_precio_mayorista
						,producto_preciofinal_mayorista
						,producto_dscto_mayorista
						,producto_agotado
						,producto_activo
						,CURDATE()
						,CURDATE()
						,producto_stock
						,producto_stock_compra
						,producto_oferta_mayorista
						,producto_oferta_publico
						,producto_fecha_compra
						,1
						,producto_fecha_ultima_modificacion
					);

					SET producto_id_final = LAST_INSERT_ID();
					IF producto_categorias = 1 OR producto_categorias = 2 THEN
						INSERT INTO sitio_productos_categorias (producto_id, categoria_id) VALUES (producto_id_final, producto_categoria_id_final );
					END IF;
				END IF;
			END IF;
		UNTIL done END REPEAT;
	CLOSE productos;

	 UPDATE sitio_masivas m 
	 SET m.ejecutada = 1
     , m.en_proceso = 0
	 , m.total_productos = total_productos
	 , m.productos_modificados = productos_modificados
	 , m.fecha_fin = NOW()
	 WHERE m.id = masivo_id
	 ;

END