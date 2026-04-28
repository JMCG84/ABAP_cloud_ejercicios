CLASS zcl_bombilla_jmcg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bombilla_jmcg IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA(lo_bombilla) = NEW zcl_bombilla_demo_jmcg( ).

    DATA lv_lugar  TYPE string.
    DATA lv_estado TYPE abap_bool.

    lo_bombilla->get_lugar( IMPORTING o_lugar = lv_lugar ).
    lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).

    DATA lv_texto_estado TYPE string.

    " Traducimos el valor booleano (X o vacío)
    IF lv_estado = abap_true.
      lv_texto_estado = 'Encendida'.
    ELSE.
      lv_texto_estado = 'Apagada'.
    ENDIF.

    out->write( | La bombilla se encuentra en el { lv_lugar } y está { lv_texto_estado } | ).


    DATA lv_valido TYPE abap_bool.
    lo_bombilla->encender( IMPORTING o_valido = lv_valido ).

    IF lv_valido = abap_true.
      out->write( 'La bombilla se ha encendido correctamente.' ).
    ENDIF.







  ENDMETHOD.
ENDCLASS.
