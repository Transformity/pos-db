-- Modify "user_entity" table
ALTER TABLE "public"."user_entity" DROP CONSTRAINT "user_entity_entity_id_fk", DROP CONSTRAINT "user_entity_user_id_fk", ADD CONSTRAINT "user_entity_entity_id_fk" FOREIGN KEY ("entity_id") REFERENCES "public"."entity" ("id") ON UPDATE CASCADE ON DELETE CASCADE, ADD CONSTRAINT "user_entity_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user" ("id") ON UPDATE CASCADE ON DELETE CASCADE;
