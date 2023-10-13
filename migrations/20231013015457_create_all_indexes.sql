-- Create index "employee_entity_id_index" to table: "employee"
CREATE INDEX "employee_entity_id_index" ON "public"."employee" ("entity_id");
-- Drop index "item_barcode2_index" from table: "item"
DROP INDEX "public"."item_barcode2_index";
-- Drop index "item_barcode_index" from table: "item"
DROP INDEX "public"."item_barcode_index";
-- Drop index "item_description_index" from table: "item"
DROP INDEX "public"."item_description_index";
-- Create index "item_entity_id_barcode2_index" to table: "item"
CREATE INDEX "item_entity_id_barcode2_index" ON "public"."item" ("entity_id", "barcode2");
-- Create index "item_entity_id_barcode_index" to table: "item"
CREATE INDEX "item_entity_id_barcode_index" ON "public"."item" ("entity_id", "barcode");
-- Create index "item_entity_id_description_index" to table: "item"
CREATE INDEX "item_entity_id_description_index" ON "public"."item" ("entity_id", "description");
-- Create index "item_entity_id_index" to table: "item"
CREATE INDEX "item_entity_id_index" ON "public"."item" ("entity_id");
-- Create index "purchaseorders_entity_id_index" to table: "purchaseorders"
CREATE INDEX "purchaseorders_entity_id_index" ON "public"."purchaseorders" ("entity_id");
