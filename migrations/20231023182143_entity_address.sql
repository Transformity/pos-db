-- Modify "entity" table
ALTER TABLE "public"."entity" ADD COLUMN "address" character varying(255) NULL;
-- Modify "register_cart" table
ALTER TABLE "public"."register_cart" ADD COLUMN "created_timestamp" timestamptz NULL DEFAULT CURRENT_TIMESTAMP;
