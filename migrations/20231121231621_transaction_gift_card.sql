-- Modify "transactions" table
ALTER TABLE "public"."transactions" ADD COLUMN "gift_card_id" bigint NULL, ADD CONSTRAINT "transactions_gift_card_entity_id_id_fk" FOREIGN KEY ("entity_id", "gift_card_id") REFERENCES "public"."gift_card" ("entity_id", "id") ON UPDATE NO ACTION ON DELETE NO ACTION;
