table "atlas_schema_revisions" {
  schema = schema.atlas_schema_revisions
  column "version" {
    null = false
    type = character_varying
  }
  column "description" {
    null = false
    type = character_varying
  }
  column "type" {
    null    = false
    type    = bigint
    default = 2
  }
  column "applied" {
    null    = false
    type    = bigint
    default = 0
  }
  column "total" {
    null    = false
    type    = bigint
    default = 0
  }
  column "executed_at" {
    null = false
    type = timestamptz
  }
  column "execution_time" {
    null = false
    type = bigint
  }
  column "error" {
    null = true
    type = text
  }
  column "error_stmt" {
    null = true
    type = text
  }
  column "hash" {
    null = false
    type = character_varying
  }
  column "partial_hashes" {
    null = true
    type = jsonb
  }
  column "operator_version" {
    null = false
    type = character_varying
  }
  primary_key {
    columns = [column.version]
  }
}
table "department" {
  schema = schema.public
  column "name" {
    null = false
    type = character_varying(255)
  }
  column "tax" {
    null = false
    type = numeric(38,4)
  }
  column "bottledeposit" {
    null = false
    type = numeric(38,2)
  }
  column "environmentfee" {
    null = false
    type = numeric(38,2)
  }
  primary_key {
    columns = [column.name]
  }
}
table "employee" {
  schema = schema.public
  column "id" {
    null = false
    type = integer
    identity {
      generated = ALWAYS
    }
  }
  column "created_date" {
    null    = true
    type    = timestamptz
    default = sql("CURRENT_TIMESTAMP")
  }
  column "name" {
    null = true
    type = character_varying(255)
  }
  column "pin" {
    null = true
    type = character_varying(255)
  }
  column "entity_id" {
    null = true
    type = bigint
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "employee_entity_id_fk" {
    columns     = [column.entity_id]
    ref_columns = [table.entity.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
}
table "employeetimerecord" {
  schema = schema.public
  column "id" {
    null = false
    type = integer
    identity {
      generated = ALWAYS
    }
  }
  column "punch_in_time" {
    null    = true
    type    = timestamptz
    default = sql("CURRENT_TIMESTAMP")
  }
  column "punch_out_time" {
    null = true
    type = timestamptz
  }
  column "employee_id" {
    null = true
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "employeetimerecord_employee_id_fk" {
    columns     = [column.employee_id]
    ref_columns = [table.employee.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "employeetimerecord_employee_id_index" {
    columns = [column.employee_id]
  }
}
table "entity" {
  schema = schema.public
  column "id" {
    null = false
    type = bigserial
  }
  column "name" {
    null = true
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
}
table "item" {
  schema = schema.public
  column "itemseqno" {
    null = false
    type = integer
    identity {
      generated = BY_DEFAULT
      start     = 10418
    }
  }
  column "barcode" {
    null = true
    type = character_varying(255)
  }
  column "barcode2" {
    null = true
    type = character_varying(255)
  }
  column "caseqty" {
    null    = false
    type    = integer
    default = 0
  }
  column "changeby" {
    null = true
    type = character_varying(255)
  }
  column "changedate" {
    null    = false
    type    = timestamptz
    default = sql("CURRENT_TIMESTAMP")
  }
  column "comments" {
    null = true
    type = character_varying(255)
  }
  column "cyaprsold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cyaugsold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cydecsold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cyfebsold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cyjansold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cyjulsold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cyjunsold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cymarsold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cymaysold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cynovsold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cyoctsold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cysepsold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "cytotsold" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "depositcode_tmp" {
    null = true
    type = character_varying(255)
  }
  column "depositmultiplier" {
    null = false
    type = integer
  }
  column "deptcode" {
    null = true
    type = character_varying(255)
  }
  column "description" {
    null = true
    type = character_varying(255)
  }
  column "envmultiplier" {
    null = false
    type = integer
  }
  column "isdiscountallowed" {
    null    = false
    type    = character_varying(255)
    default = "No"
  }
  column "istaxed" {
    null = true
    type = character_varying(255)
  }
  column "last1cost" {
    null = true
    type = numeric(38,2)
  }
  column "last1invoiceno" {
    null = true
    type = character_varying(255)
  }
  column "last1orderdate" {
    null = true
    type = timestamptz
  }
  column "last1poseqno" {
    null = true
    type = integer
  }
  column "last1qtyreceived" {
    null = true
    type = integer
  }
  column "last1receivedate" {
    null = true
    type = timestamptz
  }
  column "last1vendorcode" {
    null = true
    type = character_varying(255)
  }
  column "last2cost" {
    null = true
    type = numeric(38,2)
  }
  column "last2invoiceno" {
    null = true
    type = character_varying(255)
  }
  column "last2orderdate" {
    null = true
    type = timestamptz
  }
  column "last2poseqno" {
    null = true
    type = integer
  }
  column "last2qtyreceived" {
    null = true
    type = integer
  }
  column "last2receivedate" {
    null = true
    type = timestamptz
  }
  column "last2vendorcode" {
    null = true
    type = character_varying(255)
  }
  column "lowbottleprice" {
    null = true
    type = numeric(38,2)
  }
  column "outstandingposeqnumber" {
    null = true
    type = integer
  }
  column "outstandingpovendor" {
    null = true
    type = character_varying(255)
  }
  column "price" {
    null = true
    type = numeric(38,2)
  }
  column "pricefuture" {
    null = true
    type = numeric(38,2)
  }
  column "print_price" {
    null = true
    type = character_varying(255)
  }
  column "pyaprsold" {
    null = false
    type = numeric(38,2)
  }
  column "pyaugsold" {
    null = false
    type = numeric(38,2)
  }
  column "pydecsold" {
    null = false
    type = numeric(38,2)
  }
  column "pyfebsold" {
    null = false
    type = numeric(38,2)
  }
  column "pyjansold" {
    null = false
    type = numeric(38,2)
  }
  column "pyjulsold" {
    null = false
    type = numeric(38,2)
  }
  column "pyjunsold" {
    null = false
    type = numeric(38,2)
  }
  column "pymarsold" {
    null = false
    type = numeric(38,2)
  }
  column "pymaysold" {
    null = false
    type = numeric(38,2)
  }
  column "pynovsold" {
    null = false
    type = numeric(38,2)
  }
  column "pyoctsold" {
    null = false
    type = numeric(38,2)
  }
  column "pysepsold" {
    null = false
    type = numeric(38,2)
  }
  column "pytotsold" {
    null = true
    type = numeric(38,2)
  }
  column "qtyonhand" {
    null = false
    type = double_precision
  }
  column "size1" {
    null = true
    type = integer
  }
  column "status" {
    null    = true
    type    = enum.item_status
    default = "ACTIVE"
  }
  column "subparentitembarcode_tmp" {
    null = true
    type = character_varying(255)
  }
  column "subparentitemseqno" {
    null = true
    type = integer
  }
  column "subqty" {
    null    = false
    type    = integer
    default = 0
  }
  column "suggestedretail" {
    null = true
    type = numeric(38,2)
  }
  column "entity_id" {
    null = true
    type = bigint
  }
  primary_key {
    columns = [column.itemseqno]
  }
  foreign_key "item_department_name_fk" {
    columns     = [column.deptcode]
    ref_columns = [table.department.column.name]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "item_entity_id_fk" {
    columns     = [column.entity_id]
    ref_columns = [table.entity.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "item_item_itemseqno_fk" {
    columns     = [column.subparentitemseqno]
    ref_columns = [table.item.column.itemseqno]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "item_barcode2_index" {
    columns = [column.barcode2]
  }
  index "item_barcode_index" {
    columns = [column.barcode]
  }
  index "item_deptcode_index" {
    columns = [column.deptcode]
  }
  index "item_description_index" {
    columns = [column.description]
  }
  index "item_subparentitemseqno_index" {
    columns = [column.subparentitemseqno]
  }
}
table "itemvendoritemmapping" {
  schema = schema.public
  column "itemid" {
    null = false
    type = integer
  }
  column "sku" {
    null = true
    type = character_varying(255)
  }
  column "vendor" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.itemid, column.vendor]
  }
  foreign_key "itemvendoritemmapping_item_itemseqno_fk" {
    columns     = [column.itemid]
    ref_columns = [table.item.column.itemseqno]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "itemvendoritemmapping_vendor_name_fk" {
    columns     = [column.vendor]
    ref_columns = [table.vendor.column.name]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "itemvendoritemmapping_itemid_index" {
    columns = [column.itemid]
  }
  index "itemvendoritemmapping_vendor_index" {
    columns = [column.vendor]
  }
}
table "merchantdevices" {
  schema = schema.public
  column "deviceregistrationid" {
    null = false
    type = character_varying(255)
  }
  column "merchantname" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.deviceregistrationid]
  }
  foreign_key "merchantdevices_rainforestmerchants_name_fk" {
    columns     = [column.merchantname]
    ref_columns = [table.rainforestmerchants.column.name]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "merchantdevices_merchantname_index" {
    columns = [column.merchantname]
  }
}
table "purchaseorderitems" {
  schema = schema.public
  column "poid" {
    null = false
    type = integer
  }
  column "itemid" {
    null = false
    type = integer
  }
  column "unitsordered" {
    null    = true
    type    = integer
    default = 0
  }
  column "casesordered" {
    null    = true
    type    = integer
    default = 0
  }
  column "status" {
    null    = true
    type    = enum.purchaseorderitems_status
    default = "open"
  }
  column "unitsentered" {
    null    = false
    type    = integer
    default = 0
  }
  column "caseqty" {
    null    = true
    type    = integer
    default = 0
  }
  column "unitcost" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "itemname" {
    null = true
    type = character_varying(255)
  }
  column "size" {
    null = true
    type = numeric(38,2)
  }
  column "vendorsku" {
    null = true
    type = character_varying(255)
  }
  column "vendor" {
    null = false
    type = character_varying(255)
  }
  column "casecost" {
    null    = false
    type    = numeric(38,2)
    default = 0
  }
  column "receivedate" {
    null    = true
    type    = timestamptz
    default = sql("CURRENT_TIMESTAMP")
  }
  primary_key {
    columns = [column.poid, column.itemid, column.vendor]
  }
  foreign_key "purchaseorderitems_item_itemseqno_fk" {
    columns     = [column.itemid]
    ref_columns = [table.item.column.itemseqno]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "purchaseorderitems_purchaseorders_id_fk" {
    columns     = [column.poid]
    ref_columns = [table.purchaseorders.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "purchaseorderitems_itemid_index" {
    columns = [column.itemid]
  }
  index "purchaseorderitems_vendorsku_vendor_index" {
    columns = [column.vendorsku, column.vendor]
  }
}
table "purchaseorders" {
  schema  = schema.public
  comment = "metadata about purchase orders"
  column "id" {
    null = false
    type = integer
    identity {
      generated = ALWAYS
    }
  }
  column "name" {
    null = true
    type = character_varying(2000)
  }
  column "status" {
    null    = false
    type    = enum.purchaseorders_status
    default = "open"
  }
  column "createdate" {
    null    = true
    type    = timestamptz
    default = sql("CURRENT_TIMESTAMP")
  }
  column "closedate" {
    null = true
    type = timestamptz
  }
  column "invoiceid" {
    null = true
    type = character_varying(255)
  }
  column "entity_id" {
    null = true
    type = bigint
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "purchaseorders_entity_id_fk" {
    columns     = [column.entity_id]
    ref_columns = [table.entity.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
}
table "rainforestmerchants" {
  schema = schema.public
  column "name" {
    null = false
    type = character_varying(255)
  }
  column "merchantid" {
    null = false
    type = character_varying(255)
  }
  column "merchantapplicationid" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.name]
  }
  index "rainforestmerchants_merchantid_index" {
    columns = [column.merchantid]
  }
}
table "transactionclosings" {
  schema = schema.public
  column "id" {
    null = false
    type = integer
    identity {
      generated = ALWAYS
    }
  }
  column "registernumber" {
    null = false
    type = integer
  }
  column "employeeid" {
    null = false
    type = integer
  }
  column "opendatetime" {
    null = false
    type = timestamptz
  }
  column "closedatetime" {
    null = false
    type = timestamptz
  }
  column "totaltax" {
    null = false
    type = numeric(38,2)
  }
  column "totalsale" {
    null = false
    type = numeric(38,2)
  }
  column "totalbottlefee" {
    null = false
    type = numeric(38,2)
  }
  column "totalenvironmentfee" {
    null = false
    type = numeric(38,2)
  }
  column "registeropeningbalance" {
    null = true
    type = numeric(38,2)
  }
  column "registerclosingbalance" {
    null = true
    type = numeric(38,2)
  }
  column "totalcreditcardsale" {
    null = false
    type = numeric(38,2)
  }
  column "totaldiscount" {
    null = false
    type = numeric(38,2)
  }
  column "totalothersale" {
    null = false
    type = numeric(38,2)
  }
  column "totalchecksale" {
    null = false
    type = numeric(38,2)
  }
  column "totalsubtotal" {
    null = false
    type = numeric(38,2)
  }
  column "entity_id" {
    null = true
    type = bigint
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "transactionclosings_employee_id_fk" {
    columns     = [column.employeeid]
    ref_columns = [table.employee.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "transactionclosings_entity_id_fk" {
    columns     = [column.entity_id]
    ref_columns = [table.entity.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "transactionclosings_employeeid_index" {
    columns = [column.employeeid]
  }
}
table "transactionitems" {
  schema = schema.public
  column "id" {
    null = false
    type = integer
    identity {
      generated = ALWAYS
    }
  }
  column "quantity" {
    null = false
    type = integer
  }
  column "littleroosteritemid" {
    null = false
    type = integer
  }
  column "price" {
    null = false
    type = numeric(38,2)
  }
  column "tax" {
    null = false
    type = numeric(38,2)
  }
  column "upccode" {
    null = true
    type = character_varying(255)
  }
  column "name" {
    null = false
    type = character_varying(255)
  }
  column "totalprice" {
    null = false
    type = numeric(38,2)
  }
  column "transactionfk" {
    null = false
    type = integer
  }
  column "discount" {
    null = false
    type = numeric(38,2)
  }
  column "bottledeposit" {
    null = false
    type = numeric(38,2)
  }
  column "environmentfee" {
    null = false
    type = numeric(38,2)
  }
  column "department" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "transactionsmetadata_departments_name_fk" {
    columns     = [column.department]
    ref_columns = [table.department.column.name]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "transactionsmetadata_transactions_id_fk" {
    columns     = [column.transactionfk]
    ref_columns = [table.transactions.column.id]
    on_update   = NO_ACTION
    on_delete   = CASCADE
  }
  index "transactionitems_department_index" {
    columns = [column.department]
  }
  index "transactionitems_transactionfk_index" {
    columns = [column.transactionfk]
  }
}
table "transactions" {
  schema = schema.public
  column "amountreceived" {
    null = true
    type = numeric(38,2)
  }
  column "id" {
    null = false
    type = integer
    identity {
      generated = ALWAYS
    }
  }
  column "transactiontotal" {
    null = true
    type = numeric(38,2)
  }
  column "createddate" {
    null = true
    type = timestamptz
  }
  column "paymentform" {
    null = true
    type = character_varying(255)
  }
  column "registernumber" {
    null = false
    type = integer
  }
  column "creditcardamountreceived" {
    null = false
    type = numeric(38,2)
  }
  column "checkamountreceived" {
    null = false
    type = numeric(38,2)
  }
  column "otheramountreceived" {
    null = false
    type = numeric(38,2)
  }
  column "isvoided" {
    null    = false
    type    = boolean
    default = false
  }
  column "closingsid" {
    null = true
    type = integer
  }
  column "payinconfigid" {
    null = true
    type = character_varying(255)
  }
  column "entity_id" {
    null = true
    type = bigint
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "transactions_entity_id_fk" {
    columns     = [column.entity_id]
    ref_columns = [table.entity.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "transactions_transactionclosings_id_fk" {
    columns     = [column.closingsid]
    ref_columns = [table.transactionclosings.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "transactions_closingsid_index" {
    columns = [column.closingsid]
  }
  index "transactions_createddate_index" {
    columns = [column.createddate]
  }
}
table "user" {
  schema = schema.public
  column "id" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
}
table "user_entity" {
  schema = schema.public
  column "user_id" {
    null = false
    type = character_varying(255)
  }
  column "entity_id" {
    null = false
    type = bigint
  }
  column "role" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.user_id, column.entity_id]
  }
  foreign_key "user_entity_entity_id_fk" {
    columns     = [column.entity_id]
    ref_columns = [table.entity.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "user_entity_user_id_fk" {
    columns     = [column.user_id]
    ref_columns = [table.user.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
}
table "vendor" {
  schema = schema.public
  column "name" {
    null = false
    type = character_varying(255)
  }
  column "displayname" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.name]
  }
}
table "vendoritem" {
  schema = schema.public
  column "alcohol_by_volume" {
    null = true
    type = double_precision
  }
  column "case_size" {
    null = true
    type = integer
  }
  column "full_case_only" {
    null = true
    type = boolean
  }
  column "ibu" {
    null = true
    type = double_precision
  }
  column "liters" {
    null = true
    type = double_precision
  }
  column "size" {
    null = true
    type = double_precision
  }
  column "sleeve_size" {
    null = true
    type = integer
  }
  column "vintage_year" {
    null = true
    type = integer
  }
  column "last_modified" {
    null = false
    type = timestamptz
  }
  column "size_unit" {
    null = true
    type = character_varying(50)
  }
  column "ttb" {
    null = true
    type = character_varying(50)
  }
  column "upc" {
    null = true
    type = character_varying(50)
  }
  column "product_style" {
    null = true
    type = character_varying(100)
  }
  column "product_subtype" {
    null = true
    type = character_varying(100)
  }
  column "product_type" {
    null = true
    type = character_varying(100)
  }
  column "product_name" {
    null = false
    type = character_varying(355)
  }
  column "vendor_product_name" {
    null = true
    type = character_varying(355)
  }
  column "parent_producer" {
    null = true
    type = character_varying(255)
  }
  column "producer" {
    null = true
    type = character_varying(255)
  }
  column "product_line_id" {
    null = true
    type = character_varying(255)
  }
  column "sku" {
    null = false
    type = character_varying(255)
  }
  column "status" {
    null = true
    type = character_varying(255)
  }
  column "supplier" {
    null = true
    type = character_varying(255)
  }
  column "unit" {
    null = true
    type = character_varying(255)
  }
  column "vendor" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.sku, column.vendor]
  }
  foreign_key "vendoritem_vendor_name_fk" {
    columns     = [column.vendor]
    ref_columns = [table.vendor.column.name]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "vendoritem_upc_index" {
    columns = [column.upc]
  }
  index "vendoritem_vendor_index" {
    columns = [column.vendor]
  }
}
table "vendoritemprice" {
  schema = schema.public
  column "amended" {
    null = true
    type = boolean
  }
  column "case_post_off" {
    null = true
    type = double_precision
  }
  column "case_price" {
    null = true
    type = double_precision
  }
  column "list_case_price" {
    null = true
    type = double_precision
  }
  column "list_unit_price" {
    null = true
    type = double_precision
  }
  column "month" {
    null = false
    type = integer
  }
  column "state_min_unit_price" {
    null = true
    type = double_precision
  }
  column "suggested_retail_price" {
    null = true
    type = double_precision
  }
  column "unit_post_off" {
    null = true
    type = double_precision
  }
  column "unit_price" {
    null = true
    type = double_precision
  }
  column "year" {
    null = false
    type = integer
  }
  column "catalog_date" {
    null = true
    type = character_varying(7)
  }
  column "last_modified" {
    null = false
    type = timestamptz
  }
  column "buy_range" {
    null = true
    type = character_varying(50)
  }
  column "vendor_note" {
    null = true
    type = character_varying(50)
  }
  column "post_type" {
    null = true
    type = enum.vendoritemprice_post_type
  }
  column "sku" {
    null = false
    type = character_varying(255)
  }
  column "vendor" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.month, column.year, column.sku, column.vendor]
  }
  foreign_key "vendoritemprice_vendor_name_fk" {
    columns     = [column.vendor]
    ref_columns = [table.vendor.column.name]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "vendoritemprice_vendoritem_sku_vendor_fk" {
    columns     = [column.sku, column.vendor]
    ref_columns = [table.vendoritem.column.sku, table.vendoritem.column.vendor]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "vendoritemprice_sku_vendor_index" {
    columns = [column.sku, column.vendor]
  }
  index "vendoritemprice_vendor_index" {
    columns = [column.vendor]
  }
}
enum "posttype" {
  schema = schema.public
  values = ["DEEP", "SHALLOW", "NO_POST"]
}
enum "purchaseorderitems_status" {
  schema = schema.public
  values = ["open", "received", "in_review"]
}
enum "purchaseorders_status" {
  schema = schema.public
  values = ["open", "received", "in_review"]
}
enum "vendoritemprice_post_type" {
  schema = schema.public
  values = ["DEEP", "NO_POST", "SHALLOW"]
}
enum "item_status" {
  schema = schema.public
  values = ["ACTIVE", "INACTIVE", "DELETED"]
}
schema "atlas_schema_revisions" {
}
schema "public" {
  comment = "standard public schema"
}
