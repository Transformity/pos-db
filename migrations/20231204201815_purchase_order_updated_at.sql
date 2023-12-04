-- Modify "transactions" table
ALTER TABLE "public"."transactions" ALTER COLUMN "updated_at" SET NOT NULL;
UPDATE purchaseorders SET updated_at = createdate WHERE updated_at IS NULL;
