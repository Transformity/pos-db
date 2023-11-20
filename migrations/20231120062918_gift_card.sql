-- Add new schema named "cron"
CREATE SCHEMA "cron";
-- Modify "customer" table
ALTER TABLE "public"."customer" ADD COLUMN "license_number" character varying(255) NULL;
-- Create "gift_card" table
CREATE TABLE "public"."gift_card" ("entity_id" bigint NOT NULL, "id" bigint NOT NULL, "balance" numeric(38,2) NOT NULL, PRIMARY KEY ("entity_id", "id"), CONSTRAINT "gift_card_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
