CLASS zcl_productos_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_productos TYPE STANDARD TABLE OF zproductos_04.

    METHODS:


** insertar importing i_registro type zproducto_04 - forma estructura
*      Insertar IMPORTING
*                 i_producto_id TYPE zproducto_id_04
*                 i_nombre      TYPE zproducto_nom_04
*                 i_categoria   TYPE zproducto_cat_04
*                 i_precio      TYPE zproducto_prc_04
*                 i_stock       TYPE zproducto_stk_04
*                 i_activo      TYPE zproducto_act_04
*
*               EXPORTING
*                 o_valido      TYPE abap_bool,


      insertar
        IMPORTING ls_producto TYPE zproductos_04
        EXPORTING o_valido    TYPE abap_bool,

      Buscar_ID
        IMPORTING i_producto_id TYPE zproducto_id_04
        EXPORTING
                  o_producto    TYPE zproductos_04
                  o_encontrado  TYPE abap_bool,

      Listar_todos
        EXPORTING o_tab_productos
                    TYPE ty_productos,

      Modificar

        IMPORTING ls_producto TYPE zproductos_04
        EXPORTING o_valido    TYPE abap_bool,

      Borrar

        IMPORTING
          i_producto_id TYPE zproducto_id_04
        EXPORTING
          o_valido1     TYPE abap_bool.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_productos_04 IMPLEMENTATION.


  METHOD insertar.

*    DATA ls_productos TYPE zproductos_04.
*
*    ls_productos-producto_id = i_producto_id.
*    ls_productos-nombre = i_nombre.
*    ls_productos-categoria = i_categoria.
*    ls_productos-precio = i_precio.
*    ls_productos-stock = i_stock.
*    ls_productos-activo = i_activo.
*
*    INSERT  zproductos_04 FROM @ls_productos.
*
*    IF sy-subrc = 0.
*      o_valido = abap_true.
*    ELSE.
*      o_valido = abap_false.
*    ENDIF.


    " Insertamos el registro directamente desde la estructura
    INSERT zproductos_04 FROM @ls_producto.

    " Si el ID no existía y se insertó bien, sy-subrc es 0
    IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD Buscar_ID.
    SELECT SINGLE * FROM zproductos_04
      WHERE producto_id = @i_producto_id
      INTO @o_producto.

    " Comprobamos si el registro existe
    IF sy-subrc = 0.
      o_encontrado = abap_true.
    ELSE.
      o_encontrado = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD Listar_todos.

    SELECT * FROM zproductos_04 INTO TABLE @o_tab_productos.

  ENDMETHOD.

  METHOD modificar.

    UPDATE zproductos_04 FROM @ls_producto.

    IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD Borrar.
    DELETE FROM zproductos_04
      WHERE producto_id = @i_producto_id.

    " Comprobamos si el registro existe
    IF sy-subrc = 0.
      o_valido1 = abap_true.
    ELSE.
      o_valido1 = abap_false.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
