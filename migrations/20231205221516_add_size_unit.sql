-- Modify "item" table
ALTER TABLE "public"."item" ALTER COLUMN "size1" TYPE numeric using "size1"::numeric, ADD COLUMN "size_unit" text NULL;

BEGIN;

update item set size1 = (
    case
        when size1 >= 1000 then size1 / 1000.0
        else size1
        end
    ), size_unit = (
    case
        when size1 >= 1000 then 'L'
        else 'ML'
        end
    );
END;
