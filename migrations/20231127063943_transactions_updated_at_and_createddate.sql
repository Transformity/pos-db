-- Modify "transactions" table
ALTER TABLE "public"."transactions" ADD COLUMN "updated_at" timestamptz NULL;

-- Create function to set createddate
CREATE OR REPLACE FUNCTION trigger_set_createddate()
RETURNS TRIGGER AS $$
BEGIN
  NEW.createddate = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Update updated_at column to be createddate
UPDATE transactions SET updated_at = createddate WHERE updated_at IS NULL;

-- Create trigger to set updated_at before update
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON transactions
FOR EACH ROW
EXECUTE FUNCTION trigger_set_timestamp();

-- Create trigger to set createddate before insert
CREATE TRIGGER set_createddate
BEFORE INSERT ON transactions
FOR EACH ROW
EXECUTE FUNCTION trigger_set_createddate();

