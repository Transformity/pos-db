-- Modify "invoice" table
ALTER TABLE "public"."invoice" ALTER COLUMN "invoice_id" TYPE character varying(255);
-- Modify "invoice_item" table
ALTER TABLE "public"."invoice_item" ALTER COLUMN "status" DROP NOT NULL, ADD COLUMN "original_item_id" integer NULL, ADD COLUMN "original_quantity" integer NULL;
