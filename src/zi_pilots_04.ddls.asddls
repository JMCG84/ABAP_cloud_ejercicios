@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista base RAP Pilotos F1'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_PILOTS_04
  as select from zpilots_00
{
  key dorsal       as Dorsal,
      nombre       as Nombre,
      equipo       as Equipo,
      nacionalidad as Nacionalidad,
      puntos       as Puntos
}
