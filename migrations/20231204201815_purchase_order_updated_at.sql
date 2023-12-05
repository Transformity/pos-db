-- Modify "purchaseorders" table
ALTER TABLE "public"."purchaseorders" ADD COLUMN "updated_at" timestamptz NULL;
UPDATE purchaseorders SET updated_at = createdate WHERE updated_at IS NULL;
