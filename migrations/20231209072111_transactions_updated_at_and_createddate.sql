UPDATE transactions SET updated_at = createddate WHERE updated_at IS NULL;

-- Drop the existing trigger
DROP TRIGGER IF EXISTS set_updated_at ON transactions;

-- Create the updated trigger
CREATE TRIGGER set_updated_at
BEFORE UPDATE OR INSERT  -- Update this line
ON transactions
FOR EACH ROW
EXECUTE FUNCTION trigger_set_timestamp();

-- Modify "transactions" table
ALTER TABLE "public"."transactions" ALTER COLUMN "updated_at" SET NOT NULL;
