-- Modify "vendoritem" table
ALTER TABLE "public"."vendoritem" ALTER COLUMN "alcohol_by_volume" TYPE numeric(38,2), ALTER COLUMN "liters" TYPE numeric(38,4), ALTER COLUMN "size" TYPE numeric;
-- Modify "vendoritemprice" table
ALTER TABLE "public"."vendoritemprice" ALTER COLUMN "case_post_off" TYPE numeric(38,2), ALTER COLUMN "case_price" TYPE numeric(38,2), ALTER COLUMN "list_case_price" TYPE numeric(38,2), ALTER COLUMN "list_unit_price" TYPE numeric(38,2), ALTER COLUMN "state_min_unit_price" TYPE numeric(38,2), ALTER COLUMN "suggested_retail_price" TYPE numeric(38,2), ALTER COLUMN "unit_post_off" TYPE numeric(38,2), ALTER COLUMN "unit_price" TYPE numeric(38,2), ADD COLUMN "case_unit_price" numeric(38,2) NULL, ADD COLUMN "case_unit_post_off" numeric(38,2) NULL;
