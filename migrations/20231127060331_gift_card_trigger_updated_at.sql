-- Modify "gift_card" table
ALTER TABLE "public"."gift_card" ADD COLUMN "updated_at" timestamptz NOT NULL DEFAULT now();

-- Create trigger to update "updated_at" column
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to update "updated_at" column when "gift_card" table is updated
CREATE TRIGGER set_timestamp
    BEFORE UPDATE
    ON gift_card
    FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

