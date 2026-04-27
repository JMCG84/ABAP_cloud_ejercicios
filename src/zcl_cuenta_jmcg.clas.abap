CLASS zcl_cuenta_jmcg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cuenta_jmcg IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA(lo_cuenta1) = NEW zcl_cuenta_demo_jmcg(
*            i_titular = 'Carlos'
*            i_saldo = 1000
*        ).
*
*    out->write( | El nombre es: {  lo_cuenta1->titular } y el saldo es: { lo_cuenta1->saldo } | ).
*
*    out->write( '--- Ingresamos ---' ).
*    lo_cuenta1->Ingresar( 500 ).
*    out->write( | El saldo es: { lo_cuenta1->saldo } | ).
*
*    out->write( '--- Retiramos ---' ).
*    lo_cuenta1->Retirar( 200  ).
*    out->write( | El saldo es: { lo_cuenta1->saldo } | ).
*
*    out->write( '--- Retiramos ---' ).
*    lo_cuenta1->Retirar( 2000 ).
*    out->write( | El saldo es: { lo_cuenta1->saldo } | ).

 DATA(lo_cuenta) = NEW zcl_cuenta_demo_jmcg(
                            i_titular = 'Carlos'
                            i_saldo = 1000 ).

    DATA lv_titular TYPE string.
    DATA lv_valido TYPE abap_bool VALUE abap_true.
    DATA lv_saldo TYPE i.

    " Muestra la información
    lo_cuenta->get_titular( IMPORTING o_titular = lv_titular ).
    lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( | La cuenta de { lv_titular } tiene { lv_saldo }€ | ).

    lo_cuenta->ingresar( EXPORTING i_cantidad = 100 ).

    " Muestra la información
    lo_cuenta->get_titular( IMPORTING o_titular = lv_titular ).
    lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( | La cuenta de { lv_titular } tiene { lv_saldo }€ | ).

    lo_cuenta->retirar( EXPORTING i_cantidad = 500
                        IMPORTING o_valido = lv_valido ).
    IF lv_valido = abap_false.
      out->write( 'No hay suficiente saldo' ).
    ENDIF.

    " Muestra la información
    lo_cuenta->get_titular( IMPORTING o_titular = lv_titular ).
    lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( | La cuenta de { lv_titular } tiene { lv_saldo }€ | ).

    lo_cuenta->retirar( EXPORTING i_cantidad = 2000
                        IMPORTING o_valido = lv_valido  ).
    IF lv_valido = abap_false.
      out->write( 'No hay suficiente saldo' ).
    ENDIF.

    " Muestra la información
    lo_cuenta->get_titular( IMPORTING o_titular = lv_titular ).
    lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( | La cuenta de { lv_titular } tiene { lv_saldo }€ | ).



  ENDMETHOD.
ENDCLASS.
