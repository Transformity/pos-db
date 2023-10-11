table "department" {
  schema = schema.public
  column "name" {
    null = true
    type = text
  }
  column "tax" {
    null    = true
    type    = numeric(38,4)
    default = sql("NULL::numeric")
  }
  column "bottledeposit" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "environmentfee" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  index "idx_16957_primary" {
    unique  = true
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
    type = text
  }
  column "pin" {
    null = true
    type = text
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
}
table "entity" {
  schema = schema.public
  column "id" {
    null = false
    type = bigserial
  }
  column "name" {
    null = false
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
      generated = ALWAYS
    }
  }
  column "barcode" {
    null = true
    type = text
  }
  column "barcode2" {
    null = true
    type = text
  }
  column "caseqty" {
    null    = true
    type    = integer
    default = 0
  }
  column "changeby" {
    null = true
    type = text
  }
  column "changedate" {
    null    = true
    type    = timestamptz
    default = sql("CURRENT_TIMESTAMP")
  }
  column "comments" {
    null = true
    type = text
  }
  column "cyaprsold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cyaugsold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cydecsold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cyfebsold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cyjansold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cyjulsold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cyjunsold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cymarsold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cymaysold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cynovsold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cyoctsold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cysepsold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "cytotsold" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "depositcode_tmp" {
    null = true
    type = text
  }
  column "depositmultiplier" {
    null = true
    type = integer
  }
  column "deptcode" {
    null = true
    type = text
  }
  column "description" {
    null = true
    type = text
  }
  column "envmultiplier" {
    null = true
    type = integer
  }
  column "isdiscountallowed" {
    null    = true
    type    = text
    default = "No"
  }
  column "istaxed" {
    null = true
    type = text
  }
  column "last1cost" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "last1invoiceno" {
    null = true
    type = text
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
    type = text
  }
  column "last2cost" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "last2invoiceno" {
    null = true
    type = text
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
    type = text
  }
  column "lowbottleprice" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "outstandingposeqnumber" {
    null = true
    type = integer
  }
  column "outstandingpovendor" {
    null = true
    type = text
  }
  column "price" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pricefuture" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "print_price" {
    null = true
    type = text
  }
  column "pyaprsold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pyaugsold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pydecsold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pyfebsold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pyjansold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pyjulsold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pyjunsold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pymarsold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pymaysold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pynovsold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pyoctsold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pysepsold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "pytotsold" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "qtyonhand" {
    null = true
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
    type = text
  }
  column "subparentitemseqno" {
    null = true
    type = integer
  }
  column "subqty" {
    null    = true
    type    = integer
    default = 0
  }
  column "suggestedretail" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
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
  index "idx_16970_littleroosteritem_barcode_index" {
    columns = [column.barcode]
  }
  index "idx_16970_littleroosteritem_description_index" {
    columns = [column.description]
  }
  index "idx_16970_littleroosteritem_littleroosterdepartments_name_fk" {
    columns = [column.deptcode]
  }
  index "idx_16970_littleroosteritem_littleroosteritem_itemseqno_fk" {
    columns = [column.subparentitemseqno]
  }
  index "idx_16970_primary" {
    unique  = true
    columns = [column.itemseqno]
  }
  index "item_barcode2_index" {
    columns = [column.barcode2]
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
    type = text
  }
  column "vendor" {
    null = false
    type = text
  }
  primary_key {
    columns = [column.itemid, column.vendor]
  }
  index "idx_16977_littleroosteritemvendoritemmapping_itemid_index" {
    columns = [column.itemid]
  }
  index "idx_16977_littleroosteritemvendoritemmapping_vendor_name_fk" {
    columns = [column.vendor]
  }
}
table "merchantdevices" {
  schema = schema.public
  column "deviceregistrationid" {
    null = true
    type = text
  }
  column "merchantname" {
    null = true
    type = text
  }
  index "idx_16982_merchantdevices_rainforestmerchants_name_fk" {
    columns = [column.merchantname]
  }
  index "idx_16982_primary" {
    unique  = true
    columns = [column.deviceregistrationid]
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
    null    = true
    type    = integer
    default = 0
  }
  column "caseqty" {
    null    = true
    type    = integer
    default = 0
  }
  column "unitcost" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "itemname" {
    null = true
    type = text
  }
  column "size" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "vendorsku" {
    null = true
    type = text
  }
  column "vendor" {
    null = false
    type = text
  }
  column "casecost" {
    null    = true
    type    = numeric(38,2)
    default = 0
  }
  column "receivedate" {
    null    = true
    type    = timestamptz
    default = sql("CURRENT_TIMESTAMP")
  }
  primary_key {
    columns = [column.itemid, column.vendor, column.poid]
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
  index "idx_16987_purchaseorderitems_littleroosteritem_itemseqno_fk" {
    columns = [column.itemid]
  }
  index "idx_16987_purchaseorderitems_vendoritem_sku_vendor_fk" {
    columns = [column.vendorsku, column.vendor]
  }
}
table "purchaseorders" {
  schema = schema.public
  column "id" {
    null = false
    type = integer
    identity {
      generated = ALWAYS
    }
  }
  column "name" {
    null = true
    type = text
  }
  column "status" {
    null    = true
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
    type = text
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
  index "idx_17000_primary" {
    unique  = true
    columns = [column.id]
  }
  index "idx_17000_purchaseorders_id_uindex" {
    unique  = true
    columns = [column.id]
  }
}
table "rainforestmerchants" {
  schema = schema.public
  column "name" {
    null = true
    type = text
  }
  column "merchantid" {
    null = true
    type = text
  }
  column "merchantapplicationid" {
    null = true
    type = text
  }
  index "idx_17007_primary" {
    unique  = true
    columns = [column.name]
  }
  index "idx_17007_rainforestmerchants_merchantid_index" {
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
    null = true
    type = integer
  }
  column "employeeid" {
    null = true
    type = integer
  }
  column "opendatetime" {
    null = true
    type = timestamptz
  }
  column "closedatetime" {
    null = true
    type = timestamptz
  }
  column "totaltax" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "totalsale" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "totalbottlefee" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "totalenvironmentfee" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "registeropeningbalance" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "registerclosingbalance" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "totalcreditcardsale" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "totaldiscount" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "totalothersale" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "totalchecksale" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "totalsubtotal" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
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
  index "idx_17012_transactionclosings_employee_id_fk" {
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
    null = true
    type = integer
  }
  column "littleroosteritemid" {
    null = true
    type = integer
  }
  column "price" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "tax" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "upccode" {
    null = true
    type = text
  }
  column "name" {
    null = true
    type = text
  }
  column "totalprice" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "transactionfk" {
    null = true
    type = integer
  }
  column "discount" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "bottledeposit" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "environmentfee" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "department" {
    null = true
    type = text
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "transactionitems_item_itemseqno_fk" {
    columns     = [column.littleroosteritemid]
    ref_columns = [table.item.column.itemseqno]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "transactionitems_transactions_id_fk" {
    columns     = [column.transactionfk]
    ref_columns = [table.transactions.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "idx_17021_transactionsmetadata_departments_name_fk" {
    columns = [column.department]
  }
  index "idx_17021_transactionsmetadata_transactions_id_fk" {
    columns = [column.transactionfk]
  }
}
table "transactions" {
  schema = schema.public
  column "amountreceived" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "id" {
    null = false
    type = integer
    identity {
      generated = ALWAYS
    }
  }
  column "transactiontotal" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "createddate" {
    null = true
    type = timestamptz
  }
  column "paymentform" {
    null = true
    type = text
  }
  column "registernumber" {
    null = true
    type = integer
  }
  column "creditcardamountreceived" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "checkamountreceived" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "otheramountreceived" {
    null    = true
    type    = numeric(38,2)
    default = sql("NULL::numeric")
  }
  column "isvoided" {
    null    = true
    type    = boolean
    default = false
  }
  column "closingsid" {
    null = true
    type = integer
  }
  column "payinconfigid" {
    null = true
    type = text
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
  index "idx_17015_littleroostertransactions_createddate_index" {
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
    type = text
  }
  column "displayname" {
    null = true
    type = text
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
    null = true
    type = timestamptz
  }
  column "size_unit" {
    null = true
    type = text
  }
  column "ttb" {
    null = true
    type = text
  }
  column "upc" {
    null = true
    type = text
  }
  column "product_style" {
    null = true
    type = text
  }
  column "product_subtype" {
    null = true
    type = text
  }
  column "product_type" {
    null = true
    type = text
  }
  column "product_name" {
    null = true
    type = text
  }
  column "vendor_product_name" {
    null = true
    type = text
  }
  column "parent_producer" {
    null = true
    type = text
  }
  column "producer" {
    null = true
    type = text
  }
  column "product_line_id" {
    null = true
    type = text
  }
  column "sku" {
    null = false
    type = text
  }
  column "status" {
    null = true
    type = text
  }
  column "supplier" {
    null = true
    type = text
  }
  column "unit" {
    null = true
    type = text
  }
  column "vendor" {
    null = false
    type = text
  }
  primary_key {
    columns = [column.vendor, column.sku]
  }
  foreign_key "vendoritem_vendor_name_fk" {
    columns     = [column.vendor]
    ref_columns = [table.vendor.column.name]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
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
    type = text
  }
  column "last_modified" {
    null = true
    type = timestamptz
  }
  column "buy_range" {
    null = true
    type = text
  }
  column "vendor_note" {
    null = true
    type = text
  }
  column "post_type" {
    null = true
    type = enum.vendoritemprice_post_type
  }
  column "sku" {
    null = false
    type = text
  }
  column "vendor" {
    null = false
    type = text
  }
  primary_key {
    columns = [column.vendor, column.sku, column.month, column.year]
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
schema "public" {
  comment = "standard public schema"
}
