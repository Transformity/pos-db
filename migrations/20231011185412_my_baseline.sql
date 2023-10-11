-- Create enum type "posttype"
CREATE TYPE "public"."posttype" AS ENUM ('DEEP', 'SHALLOW', 'NO_POST');
-- Create enum type "purchaseorderitems_status"
CREATE TYPE "public"."purchaseorderitems_status" AS ENUM ('open', 'received', 'in_review');
-- Create enum type "purchaseorders_status"
CREATE TYPE "public"."purchaseorders_status" AS ENUM ('open', 'received', 'in_review');
-- Create enum type "vendoritemprice_post_type"
CREATE TYPE "public"."vendoritemprice_post_type" AS ENUM ('DEEP', 'NO_POST', 'SHALLOW');
-- Create enum type "item_status"
CREATE TYPE "public"."item_status" AS ENUM ('ACTIVE', 'INACTIVE', 'DELETED');
-- Add new schema named "atlas_schema_revisions"
CREATE SCHEMA "atlas_schema_revisions";
-- Create "itemvendoritemmapping" table
CREATE TABLE "public"."itemvendoritemmapping" ("itemid" integer NOT NULL, "sku" text NULL, "vendor" text NOT NULL, PRIMARY KEY ("itemid", "vendor"));
-- Create index "itemvendoritemmapping_itemid_index" to table: "itemvendoritemmapping"
CREATE INDEX "itemvendoritemmapping_itemid_index" ON "public"."itemvendoritemmapping" ("itemid");
-- Create index "itemvendoritemmapping_vendor_index" to table: "itemvendoritemmapping"
CREATE INDEX "itemvendoritemmapping_vendor_index" ON "public"."itemvendoritemmapping" ("vendor");
-- Create "atlas_schema_revisions" table
CREATE TABLE "atlas_schema_revisions"."atlas_schema_revisions" ("version" character varying NOT NULL, "description" character varying NOT NULL, "type" bigint NOT NULL DEFAULT 2, "applied" bigint NOT NULL DEFAULT 0, "total" bigint NOT NULL DEFAULT 0, "executed_at" timestamptz NOT NULL, "execution_time" bigint NOT NULL, "error" text NULL, "error_stmt" text NULL, "hash" character varying NOT NULL, "partial_hashes" jsonb NULL, "operator_version" character varying NOT NULL, PRIMARY KEY ("version"));
-- Create "entity" table
CREATE TABLE "public"."entity" ("id" bigserial NOT NULL, "name" character varying(255) NOT NULL, PRIMARY KEY ("id"));
-- Create "employee" table
CREATE TABLE "public"."employee" ("id" integer NOT NULL GENERATED ALWAYS AS IDENTITY, "created_date" timestamptz NULL DEFAULT CURRENT_TIMESTAMP, "name" text NULL, "pin" text NULL, "entity_id" bigint NULL, PRIMARY KEY ("id"), CONSTRAINT "employee_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create "employeetimerecord" table
CREATE TABLE "public"."employeetimerecord" ("id" integer NOT NULL GENERATED ALWAYS AS IDENTITY, "punch_in_time" timestamptz NULL DEFAULT CURRENT_TIMESTAMP, "punch_out_time" timestamptz NULL, "employee_id" integer NULL, PRIMARY KEY ("id"), CONSTRAINT "employeetimerecord_employee_id_fk" FOREIGN KEY ("employee_id") REFERENCES "public"."employee" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create index "employeetimerecord_employee_id_index" to table: "employeetimerecord"
CREATE INDEX "employeetimerecord_employee_id_index" ON "public"."employeetimerecord" ("employee_id");
-- Create "department" table
CREATE TABLE "public"."department" ("name" text NOT NULL, "tax" numeric(38,4) NULL DEFAULT NULL::numeric, "bottledeposit" numeric(38,2) NULL DEFAULT NULL::numeric, "environmentfee" numeric(38,2) NULL DEFAULT NULL::numeric, PRIMARY KEY ("name"));
-- Create "item" table
CREATE TABLE "public"."item" ("itemseqno" integer NOT NULL GENERATED ALWAYS AS IDENTITY, "barcode" text NULL, "barcode2" text NULL, "caseqty" integer NULL DEFAULT 0, "changeby" text NULL, "changedate" timestamptz NULL DEFAULT CURRENT_TIMESTAMP, "comments" text NULL, "cyaprsold" numeric(38,2) NULL DEFAULT 0, "cyaugsold" numeric(38,2) NULL DEFAULT 0, "cydecsold" numeric(38,2) NULL DEFAULT 0, "cyfebsold" numeric(38,2) NULL DEFAULT 0, "cyjansold" numeric(38,2) NULL DEFAULT 0, "cyjulsold" numeric(38,2) NULL DEFAULT 0, "cyjunsold" numeric(38,2) NULL DEFAULT 0, "cymarsold" numeric(38,2) NULL DEFAULT 0, "cymaysold" numeric(38,2) NULL DEFAULT 0, "cynovsold" numeric(38,2) NULL DEFAULT 0, "cyoctsold" numeric(38,2) NULL DEFAULT 0, "cysepsold" numeric(38,2) NULL DEFAULT 0, "cytotsold" numeric(38,2) NULL DEFAULT 0, "depositcode_tmp" text NULL, "depositmultiplier" integer NULL, "deptcode" text NULL, "description" text NULL, "envmultiplier" integer NULL, "isdiscountallowed" text NULL DEFAULT 'No', "istaxed" text NULL, "last1cost" numeric(38,2) NULL DEFAULT NULL::numeric, "last1invoiceno" text NULL, "last1orderdate" timestamptz NULL, "last1poseqno" integer NULL, "last1qtyreceived" integer NULL, "last1receivedate" timestamptz NULL, "last1vendorcode" text NULL, "last2cost" numeric(38,2) NULL DEFAULT NULL::numeric, "last2invoiceno" text NULL, "last2orderdate" timestamptz NULL, "last2poseqno" integer NULL, "last2qtyreceived" integer NULL, "last2receivedate" timestamptz NULL, "last2vendorcode" text NULL, "lowbottleprice" numeric(38,2) NULL DEFAULT NULL::numeric, "outstandingposeqnumber" integer NULL, "outstandingpovendor" text NULL, "price" numeric(38,2) NULL DEFAULT NULL::numeric, "pricefuture" numeric(38,2) NULL DEFAULT NULL::numeric, "print_price" text NULL, "pyaprsold" numeric(38,2) NULL DEFAULT NULL::numeric, "pyaugsold" numeric(38,2) NULL DEFAULT NULL::numeric, "pydecsold" numeric(38,2) NULL DEFAULT NULL::numeric, "pyfebsold" numeric(38,2) NULL DEFAULT NULL::numeric, "pyjansold" numeric(38,2) NULL DEFAULT NULL::numeric, "pyjulsold" numeric(38,2) NULL DEFAULT NULL::numeric, "pyjunsold" numeric(38,2) NULL DEFAULT NULL::numeric, "pymarsold" numeric(38,2) NULL DEFAULT NULL::numeric, "pymaysold" numeric(38,2) NULL DEFAULT NULL::numeric, "pynovsold" numeric(38,2) NULL DEFAULT NULL::numeric, "pyoctsold" numeric(38,2) NULL DEFAULT NULL::numeric, "pysepsold" numeric(38,2) NULL DEFAULT NULL::numeric, "pytotsold" numeric(38,2) NULL DEFAULT NULL::numeric, "qtyonhand" double precision NULL, "size1" integer NULL, "status" "public"."item_status" NULL DEFAULT 'ACTIVE', "subparentitembarcode_tmp" text NULL, "subparentitemseqno" integer NULL, "subqty" integer NULL DEFAULT 0, "suggestedretail" numeric(38,2) NULL DEFAULT NULL::numeric, "entity_id" bigint NULL, PRIMARY KEY ("itemseqno"), CONSTRAINT "item_department_name_fk" FOREIGN KEY ("deptcode") REFERENCES "public"."department" ("name") ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT "item_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT "item_item_itemseqno_fk" FOREIGN KEY ("subparentitemseqno") REFERENCES "public"."item" ("itemseqno") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create index "item_barcode2_index" to table: "item"
CREATE INDEX "item_barcode2_index" ON "public"."item" ("barcode2");
-- Create index "item_barcode_index" to table: "item"
CREATE INDEX "item_barcode_index" ON "public"."item" ("barcode");
-- Create index "item_deptcode_index" to table: "item"
CREATE INDEX "item_deptcode_index" ON "public"."item" ("deptcode");
-- Create index "item_description_index" to table: "item"
CREATE INDEX "item_description_index" ON "public"."item" ("description");
-- Create index "item_subparentitemseqno_index" to table: "item"
CREATE INDEX "item_subparentitemseqno_index" ON "public"."item" ("subparentitemseqno");
-- Create "rainforestmerchants" table
CREATE TABLE "public"."rainforestmerchants" ("name" text NOT NULL, "merchantid" text NULL, "merchantapplicationid" text NULL, PRIMARY KEY ("name"));
-- Create index "rainforestmerchants_merchantid_index" to table: "rainforestmerchants"
CREATE INDEX "rainforestmerchants_merchantid_index" ON "public"."rainforestmerchants" ("merchantid");
-- Create "merchantdevices" table
CREATE TABLE "public"."merchantdevices" ("deviceregistrationid" text NOT NULL, "merchantname" text NULL, PRIMARY KEY ("deviceregistrationid"), CONSTRAINT "merchantdevices_rainforestmerchants_name_fk" FOREIGN KEY ("merchantname") REFERENCES "public"."rainforestmerchants" ("name") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create "purchaseorders" table
CREATE TABLE "public"."purchaseorders" ("id" integer NOT NULL GENERATED ALWAYS AS IDENTITY, "name" text NULL, "status" "public"."purchaseorders_status" NULL DEFAULT 'open', "createdate" timestamptz NULL DEFAULT CURRENT_TIMESTAMP, "closedate" timestamptz NULL, "invoiceid" text NULL, "entity_id" bigint NULL, PRIMARY KEY ("id"), CONSTRAINT "purchaseorders_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create "purchaseorderitems" table
CREATE TABLE "public"."purchaseorderitems" ("poid" integer NOT NULL, "itemid" integer NOT NULL, "unitsordered" integer NULL DEFAULT 0, "casesordered" integer NULL DEFAULT 0, "status" "public"."purchaseorderitems_status" NULL DEFAULT 'open', "unitsentered" integer NULL DEFAULT 0, "caseqty" integer NULL DEFAULT 0, "unitcost" numeric(38,2) NULL DEFAULT 0.00, "itemname" text NULL, "size" numeric(38,2) NULL DEFAULT NULL::numeric, "vendorsku" text NULL, "vendor" text NOT NULL, "casecost" numeric(38,2) NULL DEFAULT 0.00, "receivedate" timestamptz NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY ("poid", "itemid", "vendor"), CONSTRAINT "purchaseorderitems_item_itemseqno_fk" FOREIGN KEY ("itemid") REFERENCES "public"."item" ("itemseqno") ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT "purchaseorderitems_purchaseorders_id_fk" FOREIGN KEY ("poid") REFERENCES "public"."purchaseorders" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create index "purchaseorderitems_itemid_index" to table: "purchaseorderitems"
CREATE INDEX "purchaseorderitems_itemid_index" ON "public"."purchaseorderitems" ("itemid");
-- Create index "purchaseorderitems_vendorsku_vendor_index" to table: "purchaseorderitems"
CREATE INDEX "purchaseorderitems_vendorsku_vendor_index" ON "public"."purchaseorderitems" ("vendorsku", "vendor");
-- Create "transactionclosings" table
CREATE TABLE "public"."transactionclosings" ("id" integer NOT NULL GENERATED ALWAYS AS IDENTITY, "registernumber" integer NULL, "employeeid" integer NULL, "opendatetime" timestamptz NULL, "closedatetime" timestamptz NULL, "totaltax" numeric(38,2) NULL DEFAULT NULL::numeric, "totalsale" numeric(38,2) NULL DEFAULT NULL::numeric, "totalbottlefee" numeric(38,2) NULL DEFAULT NULL::numeric, "totalenvironmentfee" numeric(38,2) NULL DEFAULT NULL::numeric, "registeropeningbalance" numeric(38,2) NULL DEFAULT NULL::numeric, "registerclosingbalance" numeric(38,2) NULL DEFAULT NULL::numeric, "totalcreditcardsale" numeric(38,2) NULL DEFAULT NULL::numeric, "totaldiscount" numeric(38,2) NULL DEFAULT NULL::numeric, "totalothersale" numeric(38,2) NULL DEFAULT NULL::numeric, "totalchecksale" numeric(38,2) NULL DEFAULT NULL::numeric, "totalsubtotal" numeric(38,2) NULL DEFAULT NULL::numeric, "entity_id" bigint NULL, PRIMARY KEY ("id"), CONSTRAINT "transactionclosings_employee_id_fk" FOREIGN KEY ("employeeid") REFERENCES "public"."employee" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT "transactionclosings_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create index "transactionclosings_employeeid_index" to table: "transactionclosings"
CREATE INDEX "transactionclosings_employeeid_index" ON "public"."transactionclosings" ("employeeid");
-- Create "transactions" table
CREATE TABLE "public"."transactions" ("amountreceived" numeric(38,2) NULL DEFAULT NULL::numeric, "id" integer NOT NULL GENERATED ALWAYS AS IDENTITY, "transactiontotal" numeric(38,2) NULL DEFAULT NULL::numeric, "createddate" timestamptz NULL, "paymentform" text NULL, "registernumber" integer NULL, "creditcardamountreceived" numeric(38,2) NULL DEFAULT NULL::numeric, "checkamountreceived" numeric(38,2) NULL DEFAULT NULL::numeric, "otheramountreceived" numeric(38,2) NULL DEFAULT NULL::numeric, "isvoided" boolean NULL DEFAULT false, "closingsid" integer NULL, "payinconfigid" text NULL, "entity_id" bigint NULL, PRIMARY KEY ("id"), CONSTRAINT "transactions_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT "transactions_transactionclosings_id_fk" FOREIGN KEY ("closingsid") REFERENCES "public"."transactionclosings" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create index "transactions_createddate_index" to table: "transactions"
CREATE INDEX "transactions_createddate_index" ON "public"."transactions" ("createddate");
-- Create "transactionitems" table
CREATE TABLE "public"."transactionitems" ("id" integer NOT NULL GENERATED ALWAYS AS IDENTITY, "quantity" integer NULL, "littleroosteritemid" integer NULL, "price" numeric(38,2) NULL DEFAULT NULL::numeric, "tax" numeric(38,2) NULL DEFAULT NULL::numeric, "upccode" text NULL, "name" text NULL, "totalprice" numeric(38,2) NULL DEFAULT NULL::numeric, "transactionfk" integer NULL, "discount" numeric(38,2) NULL DEFAULT NULL::numeric, "bottledeposit" numeric(38,2) NULL DEFAULT NULL::numeric, "environmentfee" numeric(38,2) NULL DEFAULT NULL::numeric, "department" text NULL, PRIMARY KEY ("id"), CONSTRAINT "transactionitems_item_itemseqno_fk" FOREIGN KEY ("littleroosteritemid") REFERENCES "public"."item" ("itemseqno") ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT "transactionitems_transactions_id_fk" FOREIGN KEY ("transactionfk") REFERENCES "public"."transactions" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create index "transactionitems_department_index" to table: "transactionitems"
CREATE INDEX "transactionitems_department_index" ON "public"."transactionitems" ("department");
-- Create index "transactionitems_transactionfk_index" to table: "transactionitems"
CREATE INDEX "transactionitems_transactionfk_index" ON "public"."transactionitems" ("transactionfk");
-- Create "user" table
CREATE TABLE "public"."user" ("id" character varying(255) NOT NULL, PRIMARY KEY ("id"));
-- Create "user_entity" table
CREATE TABLE "public"."user_entity" ("user_id" character varying(255) NOT NULL, "entity_id" bigint NOT NULL, "role" character varying(255) NOT NULL, PRIMARY KEY ("user_id", "entity_id"), CONSTRAINT "user_entity_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT "user_entity_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create "vendor" table
CREATE TABLE "public"."vendor" ("name" text NOT NULL, "displayname" text NULL, PRIMARY KEY ("name"));
-- Create "vendoritem" table
CREATE TABLE "public"."vendoritem" ("alcohol_by_volume" double precision NULL, "case_size" integer NULL, "full_case_only" boolean NULL, "ibu" double precision NULL, "liters" double precision NULL, "size" double precision NULL, "sleeve_size" integer NULL, "vintage_year" integer NULL, "last_modified" timestamptz NULL, "size_unit" text NULL, "ttb" text NULL, "upc" text NULL, "product_style" text NULL, "product_subtype" text NULL, "product_type" text NULL, "product_name" text NULL, "vendor_product_name" text NULL, "parent_producer" text NULL, "producer" text NULL, "product_line_id" text NULL, "sku" text NOT NULL, "status" text NULL, "supplier" text NULL, "unit" text NULL, "vendor" text NOT NULL, PRIMARY KEY ("sku", "vendor"), CONSTRAINT "vendoritem_vendor_name_fk" FOREIGN KEY ("vendor") REFERENCES "public"."vendor" ("name") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create "vendoritemprice" table
CREATE TABLE "public"."vendoritemprice" ("amended" boolean NULL, "case_post_off" double precision NULL, "case_price" double precision NULL, "list_case_price" double precision NULL, "list_unit_price" double precision NULL, "month" integer NOT NULL, "state_min_unit_price" double precision NULL, "suggested_retail_price" double precision NULL, "unit_post_off" double precision NULL, "unit_price" double precision NULL, "year" integer NOT NULL, "catalog_date" text NULL, "last_modified" timestamptz NULL, "buy_range" text NULL, "vendor_note" text NULL, "post_type" "public"."vendoritemprice_post_type" NULL, "sku" text NOT NULL, "vendor" text NOT NULL, PRIMARY KEY ("month", "year", "sku", "vendor"), CONSTRAINT "vendoritemprice_vendor_name_fk" FOREIGN KEY ("vendor") REFERENCES "public"."vendor" ("name") ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT "vendoritemprice_vendoritem_sku_vendor_fk" FOREIGN KEY ("sku", "vendor") REFERENCES "public"."vendoritem" ("sku", "vendor") ON UPDATE NO ACTION ON DELETE NO ACTION);
