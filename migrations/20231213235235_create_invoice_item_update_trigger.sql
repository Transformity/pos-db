CREATE OR REPLACE FUNCTION update_invoice_item()
    RETURNS TRIGGER AS
$$
BEGIN
    IF OLD.item_id IS DISTINCT FROM NEW.item_id THEN
        SELECT price INTO NEW.sell_price FROM item WHERE item.ITEMSEQNO = NEW.item_id;

        SELECT description INTO NEW.description FROM item WHERE item.itemseqno = NEW.item_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS trigger_update_invoice_item ON invoice_item;

CREATE TRIGGER trigger_update_invoice_item
BEFORE UPDATE ON invoice_item
FOR EACH ROW
EXECUTE FUNCTION update_invoice_item();

