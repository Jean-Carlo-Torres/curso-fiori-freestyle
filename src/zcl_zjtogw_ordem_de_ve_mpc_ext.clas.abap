CLASS zcl_zjtogw_ordem_de_ve_mpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_zjtogw_ordem_de_ve_mpc
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
          BEGIN OF ty_ordem_item
            , OrdemId TYPE i
            , DataCriacao TYPE timestamp
            , CriadoPor TYPE c LENGTH 20
            , ClienteId TYPE i
            , TotalItens TYPE p LENGTH 8 DECIMALS 2
            , TotalFrete TYPE p LENGTH 8 DECIMALS 2
            , TotalOrdem TYPE p LENGTH 8 DECIMALS 2
            , Status TYPE c LENGTH 1
            , toOVItem TYPE TABLE OF ts_ovitem WITH default key
            , END OF ty_ordem_item.

    METHODS define
        REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ZJTOGW_ORDEM_DE_VE_MPC_EXT IMPLEMENTATION.


  method define.
    DATA lo_entity_type TYPE REF TO /iwbep/if_mgw_odata_entity_typ.
    super->define( ).

    lo_entity_type = model->get_entity_type( iv_entity_name = 'OVCab' ).
    lo_entity_type->bind_structure( iv_structure_name = 'zcl_zjtogw_ordem_de_ve_mpc_ext=>ty_ordem_item' ).
    ENDMETHOD.
ENDCLASS.
