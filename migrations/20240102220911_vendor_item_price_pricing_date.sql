-- Modify "vendoritemprice" table
ALTER TABLE "public"."vendoritemprice" ADD COLUMN "pricing_date" date NOT NULL GENERATED ALWAYS AS (make_date(year, month, 1)) STORED;

