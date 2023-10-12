-- Modify "transactions" table
ALTER TABLE "public"."transactions" ADD COLUMN "void_reason" character varying(255) NULL;
