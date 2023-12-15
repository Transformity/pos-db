-- Modify "entity" table
ALTER TABLE "public"."entity" ADD COLUMN "fintech_host" character varying(255) NULL, ADD COLUMN "fintech_user" character varying(255) NULL, ADD COLUMN "fintech_passwd" character varying(255) NULL, ADD COLUMN "fintech_path" character varying(255) NULL;
