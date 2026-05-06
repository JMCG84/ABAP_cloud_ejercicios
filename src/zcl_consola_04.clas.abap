CLASS zcl_consola_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*    DATA(lo_empleado) = NEW zcl_empleado_04(
*                            i_nombre = 'Jose'
*                            i_dni = '88888888'
*                            i_salario_base = 2000 ).
*
*    DATA(lo_empleado1) = NEW zcl_empleado_fijo_04(
*                            i_nombre = 'Maria'
*                            i_dni = '88888877'
*                            i_salario_base = 2000
*                            i_antg = 3 ).
*
*    DATA(lo_empleado2) = NEW zcl_empleado_temporal_04(
*                                  i_nombre = 'Roberto'
*                                  i_dni = '86688877'
*                                  i_salario_base = 1550
*                                  i_horas = 8
*                                  i_precio = 10 ).
*
*
*
*    out->write( lo_empleado->get_ficha_empleado( ) ).
*    out->write(  '--------------------------' ).
*    out->write( lo_empleado1->get_ficha_empleado( ) ).
*    out->write(  '--------------------------' ).
*    out->write( lo_empleado2->get_ficha_empleado( ) ).




*    INSERT zpilots_04 FROM TABLE @( VALUE #(
*      ( dorsal = '001' nombre = 'Max Verstappen'   equipo = 'Red Bull'   nacionalidad = 'Holandesa'  puntos = 575 )
*      ( dorsal = '044' nombre = 'Lewis Hamilton'   equipo = 'Ferrari'    nacionalidad = 'Británica'  puntos = 408 )
*      ( dorsal = '016' nombre = 'Charles Leclerc'  equipo = 'Ferrari'    nacionalidad = 'Monegasca'  puntos = 399 )
*      ( dorsal = '063' nombre = 'George Russell'   equipo = 'Mercedes'   nacionalidad = 'Británica'  puntos = 350 )
*      ( dorsal = '004' nombre = 'Lando Norris'     equipo = 'McLaren'    nacionalidad = 'Británica'  puntos = 374 )
*      ( dorsal = '014' nombre = 'Fernando Alonso'  equipo = 'Aston Martin' nacionalidad = 'Española' puntos = 206 )
*      ( dorsal = '055' nombre = 'Carlos Sainz'     equipo = 'Williams'   nacionalidad = 'Española'   puntos = 290 )
*    ) ).
*    out->write( 'Datos cargados OK' ).


*INSERT zbebidas_04 FROM TABLE @( VALUE #(
*  ( codigo = 'BEB001' nombre = 'Coca-Cola Original'   tipo = 'Refresco' origen = 'EE.UU.'  graduacion = '0.0'  precio = '2.50' )
*  ( codigo = 'BEB002' nombre = 'Mahou Cinco Estrellas' tipo = 'Cerveza'  origen = 'España'  graduacion = '5.5'  precio = '1.80' )
*  ( codigo = 'BEB003' nombre = 'Jack Daniel''s'        tipo = 'Whisky'   origen = 'EE.UU.'  graduacion = '40.0' precio = '22.95' )
*  ( codigo = 'BEB004' nombre = 'Moët & Chandon'        tipo = 'Champán'  origen = 'Francia' graduacion = '12.0' precio = '45.00' )
*  ( codigo = 'BEB005' nombre = 'Agua Solán de Cabras'  tipo = 'Agua'     origen = 'España'  graduacion = '0.0'  precio = '1.20' )
*  ( codigo = 'BEB006' nombre = 'Tequila José Cuervo'   tipo = 'Tequila'  origen = 'México'  graduacion = '38.0' precio = '18.50' )
*  ( codigo = 'BEB007' nombre = 'Rioja Reserva 2018'    tipo = 'Vino'     origen = 'España'  graduacion = '14.0' precio = '15.30' )
*  ( codigo = 'BEB008' nombre = 'Sapporo Premium'       tipo = 'Cerveza'  origen = 'Japón'   graduacion = '4.9'  precio = '2.75' )
*  ( codigo = 'BEB009' nombre = 'Absolut Vodka'         tipo = 'Vodka'    origen = 'Suecia'  graduacion = '40.0' precio = '16.90' )
*  ( codigo = 'BEB010' nombre = 'Zumo Naranja Natural'  tipo = 'Zumo'     origen = 'Local'   graduacion = '0.0'  precio = '3.00' )
*) ).
*
*    out->write( 'Datos cargados OK' ).





  ENDMETHOD.
ENDCLASS.
