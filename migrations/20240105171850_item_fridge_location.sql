-- Modify "item" table
ALTER TABLE "public"."item" DROP COLUMN "is_refrigerated", ADD COLUMN "fridge_location" text NULL;
