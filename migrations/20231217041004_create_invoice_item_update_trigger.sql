drop trigger if exists trigger_update_invoice_item ON invoice_item;

create trigger trigger_update_invoice_item
    before update or insert
    on invoice_item
    for each row
execute procedure update_invoice_item();

