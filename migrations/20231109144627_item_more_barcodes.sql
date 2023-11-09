-- Modify "item" table
ALTER TABLE "public"."item" ADD COLUMN "barcode3" character varying(255) NULL, ADD COLUMN "barcode4" character varying(255) NULL;
-- Create index "item_entity_id_barcode3_index" to table: "item"
CREATE INDEX "item_entity_id_barcode3_index" ON "public"."item" ("entity_id", "barcode3");
-- Create index "item_entity_id_barcode4_index" to table: "item"
CREATE INDEX "item_entity_id_barcode4_index" ON "public"."item" ("entity_id", "barcode4");
