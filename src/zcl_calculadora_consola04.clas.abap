CLASS zcl_calculadora_consola04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calculadora_consola04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_calc1) = NEW zcl_calculadora04(
            i_valor = 0
            i_propietario = 'Manolo' ).


    DATA lv_inicio TYPE i.
    DATA lv_nombre  TYPE string.
    lo_calc1->get_propietario( IMPORTING o_propietario = lv_nombre ).
    lo_calc1->get_valor( IMPORTING o_valor = lv_inicio ).
    out->write( |Calculadora de { lv_nombre }  |  &&  |  Pantalla: { lv_inicio }| ).


    lo_calc1->sumar( EXPORTING i_valor = 100 ).
    lo_calc1->get_valor( IMPORTING o_valor = lv_inicio ).
    out->write( |Calculadora de { lv_nombre }  |  &&  |  Pantalla: { lv_inicio }| ).

    lo_calc1->multiplicar( EXPORTING i_valor = 3 ).
    lo_calc1->get_valor( IMPORTING o_valor = lv_inicio ).
    out->write( |Calculadora de { lv_nombre }  |  &&  |  Pantalla: { lv_inicio }| ).

    lo_calc1->restar( EXPORTING i_valor = 50 ).
    lo_calc1->get_valor( IMPORTING o_valor = lv_inicio ).
    out->write( |Calculadora de { lv_nombre }  |  &&  |  Pantalla: { lv_inicio }| ).

    lo_calc1->dividir( EXPORTING i_valor = 5 ).
    lo_calc1->get_valor( IMPORTING o_valor = lv_inicio ).
    out->write( |Calculadora de { lv_nombre }  |  &&  |  Pantalla: { lv_inicio }| ).

    DATA lv_error TYPE abap_bool.

    lo_calc1->dividir(
      EXPORTING i_valor = 0
      IMPORTING o_error = lv_error
    ).

    IF lv_error = abap_true.
      out->write( 'No se puede dividir por cero' ).
      out->write( |Calculadora de { lv_nombre }  |  &&  |  Pantalla: { lv_inicio }| )..
    ELSE.
      lo_calc1->get_valor( IMPORTING o_valor = lv_inicio ).
      out->write( lv_inicio ).
    ENDIF.


    lo_calc1->reset( ).
    lo_calc1->get_valor( IMPORTING o_valor = lv_inicio ).
    out->write( |Calculadora de { lv_nombre }  |  &&  |  Pantalla: { lv_inicio }| )..










  ENDMETHOD.
ENDCLASS.
