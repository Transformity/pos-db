-- Create index "transactionclosings_entity_id_id_index" to table: "transactionclosings"
CREATE INDEX "transactionclosings_entity_id_id_index" ON "public"."transactionclosings" ("entity_id", "id");
-- Drop index "transactions_closingsid_index" from table: "transactions"
DROP INDEX "public"."transactions_closingsid_index";
-- Drop index "transactions_createddate_index" from table: "transactions"
DROP INDEX "public"."transactions_createddate_index";
-- Create index "transactions_entity_id_closingsid_index" to table: "transactions"
CREATE INDEX "transactions_entity_id_closingsid_index" ON "public"."transactions" ("entity_id", "closingsid");
-- Create index "transactions_entity_id_createddate_index" to table: "transactions"
CREATE INDEX "transactions_entity_id_createddate_index" ON "public"."transactions" ("entity_id", "createddate");
