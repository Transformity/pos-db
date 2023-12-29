CREATE OR REPLACE FUNCTION calculate_state_min_unit_price() RETURNS TRIGGER
    LANGUAGE plpgsql AS
$$
BEGIN
    NEW.state_min_unit_price = LEAST(NEW.state_min_unit_price, NEW.suggested_retail_price);
END;
$$;

DROP TRIGGER IF EXISTS calculate_state_min_unit_price ON vendoritemprice;
CREATE TRIGGER set_state_min_unit_price before insert ON vendoritemprice
    FOR EACH ROW
    EXECUTE PROCEDURE calculate_state_min_unit_price();
