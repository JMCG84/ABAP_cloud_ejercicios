@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista consumo RAP Bebidas'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: { 
    typeName: 'Bebida', 
    typeNamePlural: 'Bebidas' 
}

define root view entity ZC_bebidas_04
  as projection on ZI_bebidas_04
{
      @UI.facet: [ { id: 'idBebida', type: #IDENTIFICATION_REFERENCE, label: 'Detalles' } ]

      @UI.selectionField: [{ position: 10 }]
      @UI.lineItem: [{ position: 10, label: 'Codigo' }]
  key Codigo,

      @UI.selectionField: [{ position: 20 }]
      @UI.lineItem: [{ position: 20, label: 'Nombre' }]
      Nombre,

      @UI.selectionField: [{ position: 30 }]
      @UI.lineItem: [{ position: 30, label: 'Tipo' }]
      Tipo,

      @UI.lineItem: [{ position: 40, label: 'Origen' }]
      Origen,

      @UI.lineItem: [{ position: 50, label: 'Graduacion' }]
      Grados,

      @UI.lineItem: [{ position: 60, label: 'Precio' }] // Cambiado a 60
      Precio

}
