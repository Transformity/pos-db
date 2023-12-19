CREATE OR REPLACE FUNCTION insert_register_on_entity_creation()
RETURNS TRIGGER AS $$
BEGIN
    -- Insert a new row into the register table if it doesn't violate the pk constraint
    INSERT INTO register (entity_id, register_number)
    VALUES (NEW.id, 1)
    ON CONFLICT (entity_id, register_number) DO NOTHING;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER entity_insert_trigger
AFTER INSERT ON entity
FOR EACH ROW
EXECUTE FUNCTION insert_register_on_entity_creation();
