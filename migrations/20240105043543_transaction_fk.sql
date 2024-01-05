-- Modify "transactions" table
ALTER TABLE "public"."transactions" ALTER COLUMN "payinconfigid" TYPE character varying, ADD COLUMN "payin_id2" character varying NULL, ADD COLUMN "payin_id3" character varying NULL;
-- Modify "transactionitems" table
ALTER TABLE "public"."transactionitems" DROP CONSTRAINT "transactionsmetadata_departments_name_fk", DROP CONSTRAINT "transactionsmetadata_transactions_id_fk", ADD CONSTRAINT "transactionitems_department_name_fk" FOREIGN KEY ("department") REFERENCES "public"."department" ("name") ON UPDATE CASCADE ON DELETE NO ACTION, ADD CONSTRAINT "transactionitems_transactions_id_fk" FOREIGN KEY ("transactionfk") REFERENCES "public"."transactions" ("id") ON UPDATE CASCADE ON DELETE CASCADE;
