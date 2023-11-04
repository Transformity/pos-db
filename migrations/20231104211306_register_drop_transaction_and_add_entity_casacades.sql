-- Modify "employee" table
ALTER TABLE "public"."employee" DROP CONSTRAINT "employee_entity_id_fk", ADD CONSTRAINT "employee_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE CASCADE ON DELETE NO ACTION;
-- Modify "item" table
ALTER TABLE "public"."item" DROP CONSTRAINT "item_entity_id_fk", ADD CONSTRAINT "item_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE CASCADE ON DELETE NO ACTION;
-- Modify "register" table
ALTER TABLE "public"."register" DROP CONSTRAINT "register_entity_id_fk", DROP COLUMN "last_closing", ADD CONSTRAINT "register_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE CASCADE ON DELETE NO ACTION;
-- Modify "transactionclosings" table
ALTER TABLE "public"."transactionclosings" DROP CONSTRAINT "transactionclosings_entity_id_fk", ADD CONSTRAINT "transactionclosings_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE CASCADE ON DELETE NO ACTION;
-- Modify "transactions" table
ALTER TABLE "public"."transactions" DROP CONSTRAINT "transactions_entity_id_fk", ADD CONSTRAINT "transactions_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE CASCADE ON DELETE NO ACTION;
-- Modify "user_entity" table
ALTER TABLE "public"."user_entity" DROP CONSTRAINT "user_entity_entity_id_fk", ADD CONSTRAINT "user_entity_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE CASCADE ON DELETE NO ACTION;
-- Drop "merchantdevices" table
DROP TABLE "public"."merchantdevices";
-- Drop "rainforestmerchants" table
DROP TABLE "public"."rainforestmerchants";
