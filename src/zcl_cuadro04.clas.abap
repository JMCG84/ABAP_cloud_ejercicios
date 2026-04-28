CLASS zcl_cuadro04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:

      constructor IMPORTING
                    i_titulo TYPE string
                    i_anio   TYPE i,


      get_titulo EXPORTING o_titulo TYPE string,

      get_anio EXPORTING o_anio TYPE i,

      set_titulo IMPORTING i_titulo TYPE string,

      set_anio IMPORTING i_anio TYPE i,

      exposicion exporting o_estado type abap_bool,

      mostrar_ficha exporting o_ficha type string.



  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA:
      Titulo TYPE string,
      anio   TYPE i.


ENDCLASS.



CLASS zcl_cuadro04 IMPLEMENTATION.

  METHOD constructor.
    titulo = i_titulo.
    anio = i_anio.
  ENDMETHOD.

  METHOD get_titulo.
    o_titulo = titulo.
  ENDMETHOD.

  METHOD get_anio.
    o_anio = anio.
  ENDMETHOD.

  METHOD set_titulo.
    titulo = i_titulo.
  ENDMETHOD.

  METHOD set_anio.
    anio = i_anio.
  ENDMETHOD.

  METHOD exposicion.
    IF anio > 1800.
      o_estado = abap_true.
    ELSE.
      o_estado = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD mostrar_ficha.
    data lv_estado type string.
    if anio > 1800.
    lv_estado = 'En exposicion'.
    else.
    lv_estado = 'Almacenado'.
    endif.
    o_ficha = | Titulo: { titulo } / Año: { anio } / { lv_estado }|.
  ENDMETHOD.




ENDCLASS.
