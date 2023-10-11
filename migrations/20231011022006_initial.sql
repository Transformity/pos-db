-- Create enum type "posttype"
CREATE TYPE "posttype" AS ENUM ('DEEP', 'SHALLOW', 'NO_POST');
-- Create enum type "purchaseorderitems_status"
CREATE TYPE "purchaseorderitems_status" AS ENUM ('open', 'received', 'in_review');
-- Create enum type "purchaseorders_status"
CREATE TYPE "purchaseorders_status" AS ENUM ('open', 'received', 'in_review');
-- Create enum type "vendoritemprice_post_type"
CREATE TYPE "vendoritemprice_post_type" AS ENUM ('DEEP', 'NO_POST', 'SHALLOW');
-- Create enum type "item_status"
CREATE TYPE "item_status" AS ENUM ('ACTIVE', 'INACTIVE', 'DELETED');
-- Create "itemvendoritemmapping" table
CREATE TABLE "itemvendoritemmapping" (
  "itemid" integer NOT NULL,
  "sku" text NULL,
  "vendor" text NOT NULL,
  PRIMARY KEY ("itemid", "vendor")
);
-- Create index "idx_16977_littleroosteritemvendoritemmapping_itemid_index" to table: "itemvendoritemmapping"
CREATE INDEX "idx_16977_littleroosteritemvendoritemmapping_itemid_index" ON "itemvendoritemmapping" ("itemid");
-- Create index "idx_16977_littleroosteritemvendoritemmapping_vendor_name_fk" to table: "itemvendoritemmapping"
CREATE INDEX "idx_16977_littleroosteritemvendoritemmapping_vendor_name_fk" ON "itemvendoritemmapping" ("vendor");
-- Create "merchantdevices" table
CREATE TABLE "merchantdevices" (
  "deviceregistrationid" text NULL,
  "merchantname" text NULL
);
-- Create index "idx_16982_merchantdevices_rainforestmerchants_name_fk" to table: "merchantdevices"
CREATE INDEX "idx_16982_merchantdevices_rainforestmerchants_name_fk" ON "merchantdevices" ("merchantname");
-- Create index "idx_16982_primary" to table: "merchantdevices"
CREATE UNIQUE INDEX "idx_16982_primary" ON "merchantdevices" ("deviceregistrationid");
-- Create "rainforestmerchants" table
CREATE TABLE "rainforestmerchants" (
  "name" text NULL,
  "merchantid" text NULL,
  "merchantapplicationid" text NULL
);
-- Create index "idx_17007_primary" to table: "rainforestmerchants"
CREATE UNIQUE INDEX "idx_17007_primary" ON "rainforestmerchants" ("name");
-- Create index "idx_17007_rainforestmerchants_merchantid_index" to table: "rainforestmerchants"
CREATE INDEX "idx_17007_rainforestmerchants_merchantid_index" ON "rainforestmerchants" ("merchantid");
-- Create "entity" table
CREATE TABLE "entity" (
  "id" bigserial NOT NULL,
  "name" character varying(255) NOT NULL,
  PRIMARY KEY ("id")
);
-- Create "employee" table
CREATE TABLE "employee" (
  "id" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  "created_date" timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
  "name" text NULL,
  "pin" text NULL,
  "entity_id" bigint NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "employee_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create "employeetimerecord" table
CREATE TABLE "employeetimerecord" (
  "id" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  "punch_in_time" timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
  "punch_out_time" timestamptz NULL,
  "employee_id" integer NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "employeetimerecord_employee_id_fk" FOREIGN KEY ("employee_id") REFERENCES "employee" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create "department" table
CREATE TABLE "department" (
  "name" text NULL,
  "tax" numeric(38,4) NULL DEFAULT NULL::numeric,
  "bottledeposit" numeric(38,2) NULL DEFAULT NULL::numeric,
  "environmentfee" numeric(38,2) NULL DEFAULT NULL::numeric
);
-- Create index "idx_16957_primary" to table: "department"
CREATE UNIQUE INDEX "idx_16957_primary" ON "department" ("name");
-- Create "item" table
CREATE TABLE "item" (
  "itemseqno" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  "barcode" text NULL,
  "barcode2" text NULL,
  "caseqty" integer NULL DEFAULT 0,
  "changeby" text NULL,
  "changedate" timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
  "comments" text NULL,
  "cyaprsold" numeric(38,2) NULL DEFAULT 0,
  "cyaugsold" numeric(38,2) NULL DEFAULT 0,
  "cydecsold" numeric(38,2) NULL DEFAULT 0,
  "cyfebsold" numeric(38,2) NULL DEFAULT 0,
  "cyjansold" numeric(38,2) NULL DEFAULT 0,
  "cyjulsold" numeric(38,2) NULL DEFAULT 0,
  "cyjunsold" numeric(38,2) NULL DEFAULT 0,
  "cymarsold" numeric(38,2) NULL DEFAULT 0,
  "cymaysold" numeric(38,2) NULL DEFAULT 0,
  "cynovsold" numeric(38,2) NULL DEFAULT 0,
  "cyoctsold" numeric(38,2) NULL DEFAULT 0,
  "cysepsold" numeric(38,2) NULL DEFAULT 0,
  "cytotsold" numeric(38,2) NULL DEFAULT 0,
  "depositcode_tmp" text NULL,
  "depositmultiplier" integer NULL,
  "deptcode" text NULL,
  "description" text NULL,
  "envmultiplier" integer NULL,
  "isdiscountallowed" text NULL DEFAULT 'No',
  "istaxed" text NULL,
  "last1cost" numeric(38,2) NULL DEFAULT NULL::numeric,
  "last1invoiceno" text NULL,
  "last1orderdate" timestamptz NULL,
  "last1poseqno" integer NULL,
  "last1qtyreceived" integer NULL,
  "last1receivedate" timestamptz NULL,
  "last1vendorcode" text NULL,
  "last2cost" numeric(38,2) NULL DEFAULT NULL::numeric,
  "last2invoiceno" text NULL,
  "last2orderdate" timestamptz NULL,
  "last2poseqno" integer NULL,
  "last2qtyreceived" integer NULL,
  "last2receivedate" timestamptz NULL,
  "last2vendorcode" text NULL,
  "lowbottleprice" numeric(38,2) NULL DEFAULT NULL::numeric,
  "outstandingposeqnumber" integer NULL,
  "outstandingpovendor" text NULL,
  "price" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pricefuture" numeric(38,2) NULL DEFAULT NULL::numeric,
  "print_price" text NULL,
  "pyaprsold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pyaugsold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pydecsold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pyfebsold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pyjansold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pyjulsold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pyjunsold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pymarsold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pymaysold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pynovsold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pyoctsold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pysepsold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "pytotsold" numeric(38,2) NULL DEFAULT NULL::numeric,
  "qtyonhand" double precision NULL,
  "size1" integer NULL,
  "status" "item_status" NULL DEFAULT 'ACTIVE',
  "subparentitembarcode_tmp" text NULL,
  "subparentitemseqno" integer NULL,
  "subqty" integer NULL DEFAULT 0,
  "suggestedretail" numeric(38,2) NULL DEFAULT NULL::numeric,
  "entity_id" bigint NULL,
  PRIMARY KEY ("itemseqno"),
  CONSTRAINT "item_department_name_fk" FOREIGN KEY ("deptcode") REFERENCES "department" ("name") ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "item_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create index "idx_16970_littleroosteritem_barcode_index" to table: "item"
CREATE INDEX "idx_16970_littleroosteritem_barcode_index" ON "item" ("barcode");
-- Create index "idx_16970_littleroosteritem_description_index" to table: "item"
CREATE INDEX "idx_16970_littleroosteritem_description_index" ON "item" ("description");
-- Create index "idx_16970_littleroosteritem_littleroosterdepartments_name_fk" to table: "item"
CREATE INDEX "idx_16970_littleroosteritem_littleroosterdepartments_name_fk" ON "item" ("deptcode");
-- Create index "idx_16970_littleroosteritem_littleroosteritem_itemseqno_fk" to table: "item"
CREATE INDEX "idx_16970_littleroosteritem_littleroosteritem_itemseqno_fk" ON "item" ("subparentitemseqno");
-- Create index "idx_16970_primary" to table: "item"
CREATE UNIQUE INDEX "idx_16970_primary" ON "item" ("itemseqno");
-- Create index "item_barcode2_index" to table: "item"
CREATE INDEX "item_barcode2_index" ON "item" ("barcode2");
-- Create "purchaseorders" table
CREATE TABLE "purchaseorders" (
  "id" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  "name" text NULL,
  "status" "purchaseorders_status" NULL DEFAULT 'open',
  "createdate" timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
  "closedate" timestamptz NULL,
  "invoiceid" text NULL,
  "entity_id" bigint NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "purchaseorders_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create index "idx_17000_primary" to table: "purchaseorders"
CREATE UNIQUE INDEX "idx_17000_primary" ON "purchaseorders" ("id");
-- Create index "idx_17000_purchaseorders_id_uindex" to table: "purchaseorders"
CREATE UNIQUE INDEX "idx_17000_purchaseorders_id_uindex" ON "purchaseorders" ("id");
-- Create "purchaseorderitems" table
CREATE TABLE "purchaseorderitems" (
  "poid" integer NOT NULL,
  "itemid" integer NOT NULL,
  "unitsordered" integer NULL DEFAULT 0,
  "casesordered" integer NULL DEFAULT 0,
  "status" "purchaseorderitems_status" NULL DEFAULT 'open',
  "unitsentered" integer NULL DEFAULT 0,
  "caseqty" integer NULL DEFAULT 0,
  "unitcost" numeric(38,2) NULL DEFAULT 0,
  "itemname" text NULL,
  "size" numeric(38,2) NULL DEFAULT NULL::numeric,
  "vendorsku" text NULL,
  "vendor" text NOT NULL,
  "casecost" numeric(38,2) NULL DEFAULT 0,
  "receivedate" timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("itemid", "vendor", "poid"),
  CONSTRAINT "purchaseorderitems_item_itemseqno_fk" FOREIGN KEY ("itemid") REFERENCES "item" ("itemseqno") ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "purchaseorderitems_purchaseorders_id_fk" FOREIGN KEY ("poid") REFERENCES "purchaseorders" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create index "idx_16987_purchaseorderitems_littleroosteritem_itemseqno_fk" to table: "purchaseorderitems"
CREATE INDEX "idx_16987_purchaseorderitems_littleroosteritem_itemseqno_fk" ON "purchaseorderitems" ("itemid");
-- Create index "idx_16987_purchaseorderitems_vendoritem_sku_vendor_fk" to table: "purchaseorderitems"
CREATE INDEX "idx_16987_purchaseorderitems_vendoritem_sku_vendor_fk" ON "purchaseorderitems" ("vendorsku", "vendor");
-- Create "transactionclosings" table
CREATE TABLE "transactionclosings" (
  "id" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  "registernumber" integer NULL,
  "employeeid" integer NULL,
  "opendatetime" timestamptz NULL,
  "closedatetime" timestamptz NULL,
  "totaltax" numeric(38,2) NULL DEFAULT NULL::numeric,
  "totalsale" numeric(38,2) NULL DEFAULT NULL::numeric,
  "totalbottlefee" numeric(38,2) NULL DEFAULT NULL::numeric,
  "totalenvironmentfee" numeric(38,2) NULL DEFAULT NULL::numeric,
  "registeropeningbalance" numeric(38,2) NULL DEFAULT NULL::numeric,
  "registerclosingbalance" numeric(38,2) NULL DEFAULT NULL::numeric,
  "totalcreditcardsale" numeric(38,2) NULL DEFAULT NULL::numeric,
  "totaldiscount" numeric(38,2) NULL DEFAULT NULL::numeric,
  "totalothersale" numeric(38,2) NULL DEFAULT NULL::numeric,
  "totalchecksale" numeric(38,2) NULL DEFAULT NULL::numeric,
  "totalsubtotal" numeric(38,2) NULL DEFAULT NULL::numeric,
  "entity_id" bigint NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "transactionclosings_employee_id_fk" FOREIGN KEY ("employeeid") REFERENCES "employee" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "transactionclosings_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create index "idx_17012_transactionclosings_employee_id_fk" to table: "transactionclosings"
CREATE INDEX "idx_17012_transactionclosings_employee_id_fk" ON "transactionclosings" ("employeeid");
-- Create "transactions" table
CREATE TABLE "transactions" (
  "amountreceived" numeric(38,2) NULL DEFAULT NULL::numeric,
  "id" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  "transactiontotal" numeric(38,2) NULL DEFAULT NULL::numeric,
  "createddate" timestamptz NULL,
  "paymentform" text NULL,
  "registernumber" integer NULL,
  "creditcardamountreceived" numeric(38,2) NULL DEFAULT NULL::numeric,
  "checkamountreceived" numeric(38,2) NULL DEFAULT NULL::numeric,
  "otheramountreceived" numeric(38,2) NULL DEFAULT NULL::numeric,
  "isvoided" boolean NULL DEFAULT false,
  "closingsid" integer NULL,
  "payinconfigid" text NULL,
  "entity_id" bigint NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "transactions_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "transactions_transactionclosings_id_fk" FOREIGN KEY ("closingsid") REFERENCES "transactionclosings" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create index "idx_17015_littleroostertransactions_createddate_index" to table: "transactions"
CREATE INDEX "idx_17015_littleroostertransactions_createddate_index" ON "transactions" ("createddate");
-- Create "transactionitems" table
CREATE TABLE "transactionitems" (
  "id" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  "quantity" integer NULL,
  "littleroosteritemid" integer NULL,
  "price" numeric(38,2) NULL DEFAULT NULL::numeric,
  "tax" numeric(38,2) NULL DEFAULT NULL::numeric,
  "upccode" text NULL,
  "name" text NULL,
  "totalprice" numeric(38,2) NULL DEFAULT NULL::numeric,
  "transactionfk" integer NULL,
  "discount" numeric(38,2) NULL DEFAULT NULL::numeric,
  "bottledeposit" numeric(38,2) NULL DEFAULT NULL::numeric,
  "environmentfee" numeric(38,2) NULL DEFAULT NULL::numeric,
  "department" text NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "transactionitems_item_itemseqno_fk" FOREIGN KEY ("littleroosteritemid") REFERENCES "item" ("itemseqno") ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "transactionitems_transactions_id_fk" FOREIGN KEY ("transactionfk") REFERENCES "transactions" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create index "idx_17021_transactionsmetadata_departments_name_fk" to table: "transactionitems"
CREATE INDEX "idx_17021_transactionsmetadata_departments_name_fk" ON "transactionitems" ("department");
-- Create index "idx_17021_transactionsmetadata_transactions_id_fk" to table: "transactionitems"
CREATE INDEX "idx_17021_transactionsmetadata_transactions_id_fk" ON "transactionitems" ("transactionfk");
-- Create "user" table
CREATE TABLE "user" (
  "id" character varying(255) NOT NULL,
  PRIMARY KEY ("id")
);
-- Create "user_entity" table
CREATE TABLE "user_entity" (
  "user_id" character varying(255) NOT NULL,
  "entity_id" bigint NOT NULL,
  "role" character varying(255) NOT NULL,
  PRIMARY KEY ("user_id", "entity_id"),
  CONSTRAINT "user_entity_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "user_entity_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create "vendor" table
CREATE TABLE "vendor" (
  "name" text NOT NULL,
  "displayname" text NULL,
  PRIMARY KEY ("name")
);
-- Create "vendoritem" table
CREATE TABLE "vendoritem" (
  "alcohol_by_volume" double precision NULL,
  "case_size" integer NULL,
  "full_case_only" boolean NULL,
  "ibu" double precision NULL,
  "liters" double precision NULL,
  "size" double precision NULL,
  "sleeve_size" integer NULL,
  "vintage_year" integer NULL,
  "last_modified" timestamptz NULL,
  "size_unit" text NULL,
  "ttb" text NULL,
  "upc" text NULL,
  "product_style" text NULL,
  "product_subtype" text NULL,
  "product_type" text NULL,
  "product_name" text NULL,
  "vendor_product_name" text NULL,
  "parent_producer" text NULL,
  "producer" text NULL,
  "product_line_id" text NULL,
  "sku" text NOT NULL,
  "status" text NULL,
  "supplier" text NULL,
  "unit" text NULL,
  "vendor" text NOT NULL,
  PRIMARY KEY ("vendor", "sku"),
  CONSTRAINT "vendoritem_vendor_name_fk" FOREIGN KEY ("vendor") REFERENCES "vendor" ("name") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create "vendoritemprice" table
CREATE TABLE "vendoritemprice" (
  "amended" boolean NULL,
  "case_post_off" double precision NULL,
  "case_price" double precision NULL,
  "list_case_price" double precision NULL,
  "list_unit_price" double precision NULL,
  "month" integer NOT NULL,
  "state_min_unit_price" double precision NULL,
  "suggested_retail_price" double precision NULL,
  "unit_post_off" double precision NULL,
  "unit_price" double precision NULL,
  "year" integer NOT NULL,
  "catalog_date" text NULL,
  "last_modified" timestamptz NULL,
  "buy_range" text NULL,
  "vendor_note" text NULL,
  "post_type" "vendoritemprice_post_type" NULL,
  "sku" text NOT NULL,
  "vendor" text NOT NULL,
  PRIMARY KEY ("vendor", "sku", "month", "year"),
  CONSTRAINT "vendoritemprice_vendor_name_fk" FOREIGN KEY ("vendor") REFERENCES "vendor" ("name") ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "vendoritemprice_vendoritem_sku_vendor_fk" FOREIGN KEY ("sku", "vendor") REFERENCES "vendoritem" ("sku", "vendor") ON UPDATE NO ACTION ON DELETE NO ACTION
);
