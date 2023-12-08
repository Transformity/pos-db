create trigger set_updated_at
    before update
    on purchaseorders
    for each row
execute procedure trigger_set_timestamp();
