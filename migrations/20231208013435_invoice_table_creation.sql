-- Create "invoice" table
CREATE TABLE "public"."invoice" ("entity_id" bigint NOT NULL, "vendor" character varying(255) NOT NULL, "invoice_id" integer NOT NULL, "invoice_date" date NOT NULL, "total" numeric(38,2) NOT NULL, "purchase_order_id" integer NULL, "status" character varying(255) NOT NULL, "id" bigserial NOT NULL, PRIMARY KEY ("id"), CONSTRAINT "invoice_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE CASCADE ON DELETE CASCADE, CONSTRAINT "invoice_purchaseorders_id_fk" FOREIGN KEY ("purchase_order_id") REFERENCES "public"."purchaseorders" ("id") ON UPDATE CASCADE ON DELETE SET NULL, CONSTRAINT "invoice_vendor_name_fk" FOREIGN KEY ("vendor") REFERENCES "public"."vendor" ("name") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create index "invoice_entity_id_index" to table: "invoice"
CREATE INDEX "invoice_entity_id_index" ON "public"."invoice" ("entity_id");
-- Create index "invoice_purchase_order_id_index" to table: "invoice"
CREATE INDEX "invoice_purchase_order_id_index" ON "public"."invoice" ("purchase_order_id");
-- Create index "invoice_vendor_index" to table: "invoice"
CREATE INDEX "invoice_vendor_index" ON "public"."invoice" ("vendor");
-- Create "invoice_item" table
CREATE TABLE "public"."invoice_item" ("invoice_id" bigint NOT NULL, "sku" character varying(255) NOT NULL, "upc" character varying(255) NULL, "description" character varying(255) NOT NULL, "unit_cost" numeric(38,2) NULL, "units" integer NULL, "quantity" integer NOT NULL, "status" character varying(255) NOT NULL, "item_id" integer NULL, "case_cost" numeric(38,2) NULL, "units_per_case" integer NULL, PRIMARY KEY ("invoice_id", "sku"), CONSTRAINT "invoice_item_invoice_id_fk" FOREIGN KEY ("invoice_id") REFERENCES "public"."invoice" ("id") ON UPDATE CASCADE ON DELETE CASCADE, CONSTRAINT "invoice_item_item_itemseqno_fk" FOREIGN KEY ("item_id") REFERENCES "public"."item" ("itemseqno") ON UPDATE CASCADE ON DELETE SET NULL);
-- Create index "invoice_item_invoice_id_index" to table: "invoice_item"
CREATE INDEX "invoice_item_invoice_id_index" ON "public"."invoice_item" ("invoice_id");
-- Create index "invoice_item_item_id_index" to table: "invoice_item"
CREATE INDEX "invoice_item_item_id_index" ON "public"."invoice_item" ("item_id");
