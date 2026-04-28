CLASS zcl_bombilla_consola_jmcg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bombilla_consola_jmcg IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA lo_bombilla TYPE REF TO zcl_bombilla_00.

    DATA(lo_bombilla) = NEW zcl_bombilla_00( 'salon' ).
    DATA(lo_bombilla2) = NEW zcl_bombilla_00( 'Cocina' ).

    DATA lv_estado TYPE abap_bool.

    lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
    out->write( lv_estado ).

    lo_bombilla->encender( ).

    lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
    out->write( lo_bombilla->estado ).

    lo_bombilla->apagar( ).

    lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
    out->write( lv_estado ).

    out->write( lo_bombilla->ubicacion ).


  ENDMETHOD.

ENDCLASS.
