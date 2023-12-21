CREATE OR REPLACE FUNCTION insert_super_admin_to_user_entity() returns trigger
    language plpgsql
as
$$
BEGIN
    INSERT INTO user_entity (user_id, entity_id, role)
    VALUES ('z74giVHF8YP6FuEm3w4Km3yJtli2', NEW.id, 'ADMIN'),
           ('Y8bJM8OZV2YvUKFMYJEijexdIyA2', NEW.id, 'ADMIN'),
           ('Q7AXlhVJBsWcB9v5OD0ksxxzTQE2', NEW.id, 'ADMIN')
    ON CONFLICT (user_id, entity_id) DO NOTHING;

    RETURN NEW;
end;

$$;

drop trigger if exists entity_user_super_admin_insert_trigger ON entity;
create trigger entity_user_super_admin_insert_trigger
    after insert
    on entity
    for each row
execute procedure insert_super_admin_to_user_entity();

