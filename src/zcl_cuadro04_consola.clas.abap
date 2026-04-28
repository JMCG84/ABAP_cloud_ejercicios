CLASS zcl_cuadro04_consola DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cuadro04_consola IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA(lo_cuadro1) = NEW zcl_cuadro04(
    i_titulo = 'La maja desnuda'
    i_anio = 1800 ).

    DATA lv_ficha TYPE string.

    lo_cuadro1->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
    out->write( lv_ficha ).

    lo_cuadro1->set_anio( i_anio = 1801 ).
    lo_cuadro1->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
    out->write( lv_ficha ).

    DATA(lo_cuadro2) = NEW zcl_cuadro04(
    i_titulo = 'Las Meninas'
    i_anio = 1656 ).

    DATA lv_ficha2 TYPE string.

    lo_cuadro2->mostrar_ficha( IMPORTING o_ficha = lv_ficha2 ).
    out->write( lv_ficha2 ).

  ENDMETHOD.
ENDCLASS.
