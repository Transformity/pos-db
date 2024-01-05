-- Drop index "vendoritemprice_vendor_sku_index" from table: "vendoritemprice"
DROP INDEX "public"."vendoritemprice_vendor_sku_index";
-- Modify "vendoritemprice" table
ALTER TABLE "public"."vendoritemprice" DROP CONSTRAINT "vendoritemprice_vendoritem_vendor_sku_fk", ALTER COLUMN "last_modified" SET NOT NULL, ADD CONSTRAINT "vendoritemprice_vendoritem_vendor_sku_fk" FOREIGN KEY ("vendor", "sku") REFERENCES "public"."vendoritem" ("vendor", "sku") ON UPDATE CASCADE ON DELETE CASCADE;
