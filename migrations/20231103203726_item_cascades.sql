-- Modify "item" table
ALTER TABLE "public"."item" DROP CONSTRAINT "item_item_itemseqno_fk", ADD CONSTRAINT "item_item_itemseqno_fk" FOREIGN KEY ("subparentitemseqno") REFERENCES "public"."item" ("itemseqno") ON UPDATE CASCADE ON DELETE CASCADE;
-- Modify "itemvendoritemmapping" table
ALTER TABLE "public"."itemvendoritemmapping" DROP CONSTRAINT "itemvendoritemmapping_item_itemseqno_fk", ADD CONSTRAINT "itemvendoritemmapping_item_itemseqno_fk" FOREIGN KEY ("itemid") REFERENCES "public"."item" ("itemseqno") ON UPDATE CASCADE ON DELETE CASCADE;
-- Modify "purchaseorderitems" table
ALTER TABLE "public"."purchaseorderitems" DROP CONSTRAINT "purchaseorderitems_item_itemseqno_fk", ADD CONSTRAINT "purchaseorderitems_item_itemseqno_fk" FOREIGN KEY ("itemid") REFERENCES "public"."item" ("itemseqno") ON UPDATE CASCADE ON DELETE CASCADE;
