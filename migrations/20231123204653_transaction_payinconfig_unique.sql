-- Create index "transactions_payinconfigid_transactiontotal_uindex" to table: "transactions"
CREATE UNIQUE INDEX "transactions_payinconfigid_transactiontotal_uindex" ON "public"."transactions" ("payinconfigid", "transactiontotal");
