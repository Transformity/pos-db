-- Modify "item" table
ALTER TABLE "public"."item" ALTER COLUMN "depositmultiplier" SET DEFAULT 0, ALTER COLUMN "deptcode" SET NOT NULL, ALTER COLUMN "description" SET NOT NULL, ALTER COLUMN "envmultiplier" SET DEFAULT 0, ALTER COLUMN "price" SET NOT NULL, ALTER COLUMN "qtyonhand" SET DEFAULT 0, ALTER COLUMN "status" SET NOT NULL;
