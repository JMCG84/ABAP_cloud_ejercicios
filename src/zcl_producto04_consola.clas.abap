CLASS zcl_producto04_consola DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_producto04_consola IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*insertar registros

*    DATA(lo_productos) = NEW zcl_productos_04( ).
*    DATA lv_valido TYPE abap_bool.
*
*    lo_productos->Insertar(
*        EXPORTING
*            i_producto_id = 00000001
*            i_nombre = 'Ratón'
*            i_categoria = 'informatica'
*            i_precio = 15
*            i_stock = 10
*            i_activo = 'x'
*        IMPORTING
*            o_valido = lv_valido ).
*    IF lv_valido = abap_true.
*      out->write( 'Inserción correcta' ).
*    ELSE.
*      out->write( 'Inserción incorrecta' ).
*    ENDIF.
*
*    lo_productos->Insertar(
*        EXPORTING
*            i_producto_id = 00000002
*            i_nombre = 'Teclado'
*            i_categoria = 'informatica'
*            i_precio = 22
*            i_stock = 20
*            i_activo = 'x'
*        IMPORTING
*            o_valido = lv_valido ).
*    IF lv_valido = abap_true.
*      out->write( 'Inserción correcta' ).
*    ELSE.
*      out->write( 'Inserción incorrecta' ).
*    ENDIF.
*
*    lo_productos->Insertar(
*        EXPORTING
*            i_producto_id = 00000003
*            i_nombre = 'Auriculares'
*            i_categoria = 'Accesorio'
*            i_precio = 10
*            i_stock = 35
*            i_activo = ''
*        IMPORTING
*            o_valido = lv_valido ).
*    IF lv_valido = abap_true.
*      out->write( 'Inserción correcta' ).
*    ELSE.
*      out->write( 'Inserción incorrecta' ).
*    ENDIF.

*Instanciamos el objeto
    DATA(lo_productos) = NEW zcl_productos_04( ).
    DATA lv_ok TYPE abap_bool.

*Insertamos el PRODUCTO 1 directamente
    lo_productos->insertar(
      EXPORTING
        ls_producto = VALUE zproductos_04( producto_id = '00000001' nombre = 'Monitor 24' categoria = 'Hardware' precio = '150.00' stock = 10 activo = abap_true )
      IMPORTING
        o_valido = lv_ok
    ).
    IF lv_ok = abap_true.
      out->write( 'Producto  insertado correctamente.' ).
    ELSE.
      out->write( 'ERROR: No se pudo insertar el producto.' ).
    ENDIF.


* Insertamos el PRODUCTO 2
    lo_productos->insertar(
      EXPORTING
        ls_producto = VALUE zproductos_04( producto_id = '00000002' nombre = 'Teclado' categoria = 'Hardware' precio = '80.00' stock = 20 activo = abap_true )
      IMPORTING
        o_valido = lv_ok
    ).
    IF lv_ok = abap_true.
      out->write( 'Producto  insertado correctamente.' ).
    ELSE.
      out->write( 'ERROR: No se pudo insertar el producto.' ).
    ENDIF.

*Insertamos el PRODUCTO 3
    lo_productos->insertar(
      EXPORTING
        ls_producto = VALUE zproductos_04( producto_id = '00000003' nombre = 'Ratón' categoria = 'Hardware' precio = '25.00' stock = 50 activo = abap_true )
      IMPORTING
        o_valido = lv_ok
    ).
    IF lv_ok = abap_true.
      out->write( 'Producto insertado correctamente.' ).
    ELSE.
      out->write( 'ERROR: No se pudo insertar el producto.' ).
    ENDIF.
*Insertamos el PRODUCTO 4
    lo_productos->insertar(
      EXPORTING
        ls_producto = VALUE zproductos_04( producto_id = '00000004' nombre = 'Laptop Pro' categoria = 'Ordenadores' precio = '1200.00' stock = 5 activo = abap_true )
      IMPORTING
        o_valido = lv_ok
    ).

    IF lv_ok = abap_true.
      out->write( 'Producto insertado correctamente.' ).
    ELSE.
      out->write( 'ERROR: No se pudo insertar el producto.' ).
    ENDIF.

*Insertamos el PRODUCTO 5
    lo_productos->insertar(
      EXPORTING
        ls_producto = VALUE zproductos_04( producto_id = '00000005' nombre = 'Altavoces BT' categoria = 'Sonido' precio = '45.00' stock = 15 activo = abap_true )
      IMPORTING
        o_valido = lv_ok
    ).

    IF lv_ok = abap_true.
      out->write( 'Producto insertado correctamente.' ).
    ELSE.
      out->write( 'ERROR: No se pudo insertar el producto.' ).
    ENDIF.

*Insertamos el PRODUCTO 6
    lo_productos->insertar(
      EXPORTING
        ls_producto = VALUE zproductos_04( producto_id = '00000006' nombre = 'Auriculares' categoria = 'Sonido' precio = '60.00' stock = 20 activo = abap_true )
      IMPORTING
        o_valido = lv_ok
    ).

    IF lv_ok = abap_true.
      out->write( 'Producto insertado correctamente.' ).
    ELSE.
      out->write( 'ERROR: No se pudo insertar el producto.' ).
    ENDIF.


* buscar por id

    DATA ls_prod_encontrado TYPE zproductos_04.
    DATA lv_valido1 TYPE abap_bool.

    lo_productos->Buscar_ID(
        EXPORTING
            i_producto_id = 00000002
        IMPORTING
            o_producto   = ls_prod_encontrado
            o_encontrado = lv_valido1 ).
    IF lv_valido1 = abap_true.
      out->write( 'Encontrado' ).
      out->write( ls_prod_encontrado ).
    ELSE.
      out->write( 'No encontrado' ).
    ENDIF.

*listar todos los productos

    DATA(lo_productos1) = NEW zcl_productos_04( ).
    DATA lt_lista TYPE zcl_productos_04=>ty_productos.

    lo_productos->listar_todos(
      IMPORTING
        o_tab_productos = lt_lista
    ).
    out->write( 'Listado de productos:' ).
    out->write( lt_lista ).
    out->write( |Total: { lines( lt_lista ) }| ).

*modificar producto

    DATA ls_prod_mod TYPE zproductos_04.
    DATA lv_existe   TYPE abap_bool.
    DATA lv_mod_ok TYPE abap_bool.

    lo_productos1->buscar_id(
  EXPORTING
    i_producto_id = '00000001'
  IMPORTING
    o_producto   = ls_prod_mod
    o_encontrado = lv_existe
).
    IF lv_existe = abap_true.
      " Modificamos los valores en la 'ficha' (memoria local)
      ls_prod_mod-precio = '25.50'.
      ls_prod_mod-stock  = 100.
    ELSE.
      out->write( 'ERROR: No se pudo modificar el producto.' ).
    ENDIF.

    lo_productos1->modificar(
      EXPORTING
        ls_producto = ls_prod_mod
      IMPORTING
        o_valido    = lv_mod_ok
    ).

    IF lv_mod_ok = abap_true.
      out->write( 'Producto 00000001 modificado correctamente' ).
    ELSE.
      out->write( 'Error al modificar el producto' ).
    ENDIF.


*borrar el producto

    DATA lv_borrado_ok TYPE abap_bool.

    lo_productos1->borrar(
      EXPORTING
        i_producto_id      = '00000003'
      IMPORTING
        o_valido1 = lv_borrado_ok
    ).

    IF lv_borrado_ok = abap_true.
      out->write( 'Producto eliminado correctamente.' ).
    ELSE.
      out->write( 'Error: No se pudo borrar el producto.' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
