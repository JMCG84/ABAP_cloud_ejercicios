CLASS zcl_persona_jmcg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_persona_jmcg IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_persona1) = NEW zcl_demo_persona( ).

    data lv_nombre type string.

    lo_persona1->set_nombre( 'Luis' ).
    lo_persona1->set_nombre( EXPORTING i_nombre = 'Juan' ).

    lo_persona1->get_nombre( IMPORTING o_nombre = lv_nombre ).

    lo_persona1->set_edad( 20 ).
    lo_persona1->get_edad( IMPORTING o_edad = DATA(edad) ).

    out->write( | El nombre es: {  lo_persona1->nombre } | ).

  endmethod.
ENDCLASS.
