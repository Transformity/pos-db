-- Create "customer" table
CREATE TABLE "public"."customer" ("id" serial NOT NULL, "phone_number" character varying(15) NOT NULL, "name" text NULL, PRIMARY KEY ("id"));
-- Create index "customer_phone_number_uindex" to table: "customer"
CREATE UNIQUE INDEX "customer_phone_number_uindex" ON "public"."customer" ("phone_number");
-- Create "register_cart_customer" table
CREATE TABLE "public"."register_cart_customer" ("entity_id" bigint NOT NULL, "register_number" bigint NOT NULL, "customer_id" integer NOT NULL, PRIMARY KEY ("entity_id", "register_number"), CONSTRAINT "register_cart_customer_customer_id_fk" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT "register_cart_customer_register_entity_id_register_number_fk" FOREIGN KEY ("entity_id", "register_number") REFERENCES "public"."register" ("entity_id", "register_number") ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Modify "transactions" table
ALTER TABLE "public"."transactions" ADD COLUMN "customer_id" integer NULL, ADD CONSTRAINT "transactions_customer_id_fk" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("id") ON UPDATE CASCADE ON DELETE SET NULL;
