-- Create "register" table
CREATE TABLE "public"."register" ("entity" bigint NOT NULL, "id" bigint NOT NULL, PRIMARY KEY ("entity", "id"), CONSTRAINT "register_entity_id_fk" FOREIGN KEY ("entity") REFERENCES "public"."entity" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
