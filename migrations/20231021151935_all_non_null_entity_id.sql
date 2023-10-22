-- Modify "entity" table
ALTER TABLE "public"."entity" ADD COLUMN "credit_card_merchant_application_id" character varying(255) NULL, ADD COLUMN "credit_card_merchant_id" character varying(255) NULL;
-- Modify "item" table
ALTER TABLE "public"."item" ALTER COLUMN "entity_id" SET NOT NULL;
-- Modify "purchaseorders" table
ALTER TABLE "public"."purchaseorders" ALTER COLUMN "entity_id" SET NOT NULL;
-- Modify "register" table
ALTER TABLE "public"."register" ADD COLUMN "credit_card_device_id" character varying(255) NULL;
-- Modify "transactionclosings" table
ALTER TABLE "public"."transactionclosings" ALTER COLUMN "entity_id" SET NOT NULL;
-- Modify "transactions" table
ALTER TABLE "public"."transactions" ALTER COLUMN "entity_id" SET NOT NULL;
