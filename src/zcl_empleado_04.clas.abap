CLASS zcl_empleado_04 DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: nombre       TYPE string,
          dni          TYPE string,
          salario_base TYPE decfloat16.

    METHODS:

      Constructor IMPORTING
                    i_nombre       TYPE string
                    i_dni          TYPE string
                    i_salario_base TYPE decfloat16,

      get_salario_final RETURNING VALUE(r_salario_final) TYPE decfloat16,

      get_ficha_empleado RETURNING
                           VALUE(r_ficha_empleado) TYPE string.





  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_empleado_04 IMPLEMENTATION.

  METHOD constructor.
    nombre = i_nombre.
    dni = i_dni.
    salario_base = i_salario_base.

  ENDMETHOD.


  METHOD get_salario_final.

    r_salario_final = salario_base.

  ENDMETHOD.

  METHOD get_ficha_empleado.

    r_ficha_empleado = |Nombre: { nombre } | &
                       |DNI: { dni } | &
                       |Salario Total: { me->get_salario_final( ) }|.

  ENDMETHOD.



ENDCLASS.
