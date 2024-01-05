-- Drop index "vendoritemprice_sku_vendor_index" from table: "vendoritemprice"
DROP INDEX "public"."vendoritemprice_sku_vendor_index";
-- Drop index "vendoritemprice_vendor_index" from table: "vendoritemprice"
DROP INDEX "public"."vendoritemprice_vendor_index";
-- Modify "vendoritemprice" table
ALTER TABLE "public"."vendoritemprice" DROP CONSTRAINT "vendoritemprice_pkey", DROP CONSTRAINT "vendoritemprice_vendoritem_sku_vendor_fk", ALTER COLUMN "last_modified" DROP NOT NULL, ADD PRIMARY KEY ("vendor", "sku", "month", "year"), ADD CONSTRAINT "vendoritemprice_vendoritem_vendor_sku_fk" FOREIGN KEY ("sku", "vendor") REFERENCES "public"."vendoritem" ("sku", "vendor") ON UPDATE NO ACTION ON DELETE NO ACTION;
-- Create index "vendoritemprice_pricing_date_index" to table: "vendoritemprice"
CREATE INDEX "vendoritemprice_pricing_date_index" ON "public"."vendoritemprice" ("pricing_date");
-- Create index "vendoritemprice_vendor_sku_index" to table: "vendoritemprice"
CREATE INDEX "vendoritemprice_vendor_sku_index" ON "public"."vendoritemprice" ("vendor", "sku");
