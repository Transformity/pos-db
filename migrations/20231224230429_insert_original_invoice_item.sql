CREATE OR REPLACE FUNCTION insert_original_invoice_item() RETURNS TRIGGER
    language plpgsql
as
$$
BEGIN
    NEW.original_item_id = NEW.item_id;
    NEW.original_quantity = NEW.quantity;
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trigger_insert_original_invoice_item ON invoice_item;
create trigger trigger_insert_original_invoice_item
    before insert
    on invoice_item
    for each row
execute procedure insert_original_invoice_item();

