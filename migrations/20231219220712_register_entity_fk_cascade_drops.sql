-- Modify "register" table
ALTER TABLE "public"."register" DROP CONSTRAINT "register_entity_id_fk", ADD CONSTRAINT "register_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE CASCADE ON DELETE CASCADE;
