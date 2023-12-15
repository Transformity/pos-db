-- Modify "invoice" table
ALTER TABLE "public"."invoice" ADD COLUMN "due_date" date NULL;
-- Modify "invoice_item" table
ALTER TABLE "public"."invoice_item" DROP COLUMN "units", ADD COLUMN "sell_price" numeric(38,2) NULL;
