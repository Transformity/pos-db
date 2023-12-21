-- Modify "item" table
ALTER TABLE "public"."item" ALTER COLUMN "size1" TYPE numeric, ADD COLUMN IF NOT EXISTS "size_unit" text NULL;
