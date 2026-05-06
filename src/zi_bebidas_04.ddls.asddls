@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista base RAP Pilotos F1'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_bebidas_04
  as select from zbebidas_04
{
  key codigo     as Codigo,
      nombre     as Nombre,
      tipo       as Tipo,
      origen     as Origen,
      graduacion as Grados,
      precio     as Precio
}
