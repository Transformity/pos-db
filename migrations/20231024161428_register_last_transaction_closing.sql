-- Modify "register" table
ALTER TABLE "public"."register" ADD COLUMN "last_transaction_closing_id" integer NULL, ADD CONSTRAINT "register_transactionclosings_id_fk" FOREIGN KEY ("last_transaction_closing_id") REFERENCES "public"."transactionclosings" ("id") ON UPDATE CASCADE ON DELETE SET NULL;
