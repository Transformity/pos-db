-- Modify "customer" table
ALTER TABLE "public"."customer" ALTER COLUMN "name" SET NOT NULL, ADD COLUMN "email" text NOT NULL;
