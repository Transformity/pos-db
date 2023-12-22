-- Modify "transactions" table
ALTER TABLE "public"."transactions" ADD COLUMN "cash_amount_received" numeric(38,2) NOT NULL GENERATED ALWAYS AS (((transactiontotal - creditcardamountreceived) - checkamountreceived) - otheramountreceived) STORED;
