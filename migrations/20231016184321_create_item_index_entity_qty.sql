-- Create index "item_entity_id_qtyonhand_index" to table: "item"
CREATE INDEX "item_entity_id_qtyonhand_index" ON "public"."item" ("entity_id", "qtyonhand");
