CLASS zcl_select_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_select_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**Relacionar tablas
*
*    " Este tipo es la estructura final
*    " La que quiero para el informe
*    TYPES: BEGIN OF ty_vuelos,
*             name          TYPE /dmo/carrier-name, " El nombre de la aerolinea
*             connection_id TYPE /dmo/flight-connection_id,
*             flight_date   TYPE /dmo/flight-flight_date,
*             price         TYPE /dmo/flight-price,
*           END OF ty_vuelos.
*
*    " Declaraciones para el informe
*    DATA ls_vuelos TYPE ty_vuelos.
*    DATA lt_vuelos TYPE TABLE OF ty_vuelos.
*
*    " Recupero TODOS los campos y registros
*    SELECT carrier_id,
*           connection_id,
*           flight_date,
*           price
*        FROM /dmo/flight
*        INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
**      out->write( lt_flight ).
*    ENDIF.
*
*    " Recupero solo ID y NAME
*    SELECT carrier_id, name
*        FROM /dmo/carrier
*        INTO TABLE @DATA(lt_carrier).
*    IF sy-subrc = 0.
**      out->write( lt_carrier ).
*    ENDIF.
*
*    " Recorro la tabla de los vuelos
*    LOOP AT lt_flight INTO DATA(ls_flight).
*
*      " Por cada vuelo busco el nombre en la tabla de aerolíneas
*      READ TABLE lt_carrier INTO DATA(ls_carrier)
*          WITH KEY carrier_id = ls_flight-carrier_id. " Comparo por ID
*      IF sy-subrc = 0.
*
*        " Asigno valores a la estructura del informe
*        ls_vuelos = VALUE #( name = ls_carrier-name
*                             connection_id = ls_flight-connection_id
*                             flight_date = ls_flight-flight_date
*                             price = ls_flight-price ).
*
*        " Añado la estructura a la tabla del informe
*        APPEND ls_vuelos TO lt_vuelos.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lt_vuelos ).

*Ejercicios de Reservas y Agencias

*    TYPES: BEGIN OF ty_reservas,
*
*             name          TYPE /dmo/agency-name,
*             connection_id TYPE  /dmo/booking-connection_id,
*             flight_date   TYPE /dmo/booking-flight_date,
*             flight_price  TYPE /dmo/booking-flight_price,
*           END OF ty_reSERVAS.
*
*      data ls_reservas type ty_reservas.
*      data lt_reservas type table of ty_reservas.

*recopilamos datos de las tablas con los select
*
*    SELECT travel_id,
*     connection_id,
*     flight_date,
*     flight_price
*     FROM /dmo/booking INTO TABLE @DATA(lt_booking)
*     up to 20 roWS.
*
*    IF sy-subrc = 0.
*
*      SELECT travel_id,
*             agency_id
*       FROM  /dmo/travel INTO TABLE @DATA(lt_travel).
*
*      IF sy-subrc = 0.
*
*        SELECT agency_id,
*               name
*          FROM /dmo/agency INTO TABLE @DATA(lt_agency).
*
*        IF sy-subrc = 0.
*
*          LOOP AT lt_booking INTO DATA(ls_booking).
*
*            READ TABLE lt_travel INTO DATA(ls_travel) "data(ls_travel) = lt_travel[ travel_id = ls_booking-travel_id ]. misma sentencia que read
*            WITH KEY travel_id = ls_booking-travel_id.
*
*            IF sy-subrc = 0.
*
*            READ TABLE lt_agency INTO DATA(ls_agency)
*            WITH KEY agency_id = ls_travel-agency_id.
*
*            IF sy-subrc = 0.
*
*" Asigno valores a la estructura del informe
*
*            ls_reservas-connection_id = ls_booking-connection_id.
*            ls_reservas-flight_date = ls_booking-flight_date.
*            ls_reservas-flight_price = ls_booking-flight_price.
*            ls_reservas-name = ls_agency-name.
*
*            APPEND ls_reservas TO lt_reservas.
*
*            ENDIF.
*            ENDIF.
*          ENDLOOP.
*        ENDIF.
*      ENDIF.
*    ENDIF.
*
*    out->write( lt_reservas ).




*Versión PRO

*    SELECT
*            connection_id,
*            flight_date,
*            flight_price,
*            name
*
*            FROM /dmo/booking AS b
*                 JOIN /dmo/travel AS t
*                    ON b~travel_id = t~travel_id
*                 JOIN /dmo/agency AS a
*                    ON t~agency_id = a~agency_id
*
*            INTO TABLE @DATA(lt_reservas)
*                UP TO 10 ROWS.
*
*    IF sy-subrc = 0.
*      out->write( lt_reservas ).
*    ENDIF.


* version con el cds
* SELECT * FROM zcds_reservas_00
*        INTO TABLE @DATA(lt_reservas) UP TO 10 ROWS.
*    IF sy-subrc = 0.
*      out->write( lt_reservas ).
*    ENDIF.

*version con el cds vuelo
select * from zcds_vuelo_04
    into table @data(lt_vuelo).
    if sy-subrc = 0.
      out->write( lt_vuelo ).
    endif.



 ENDMETHOD.
ENDCLASS.
