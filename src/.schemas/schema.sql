-- Create table to store all objects.
-- Each object has a name and a datatype, which can either be a 'group' or 'dataset'.
CREATE TABLE IF NOT EXISTS "objects" (
    "id" INTEGER NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL, 
    "datatype" TEXT NOT NULL CHECK("datatype" IN ('group', 'dataset'))
);

-- Create table to store parent-child relationships between objects.
-- Each parent can have multiple children, and each child can have multiple parents.
CREATE TABLE IF NOT EXISTS "object_parent" (
    "object_id" INTEGER NOT NULL,
    "parent_id" INTEGER NOT NULL,
    PRIMARY KEY("object_id", "parent_id"),
    FOREIGN KEY("object_id") REFERENCES "objects"("id") ON DELETE CASCADE,
    FOREIGN KEY("parent_id") REFERENCES "objects"("id") ON DELETE CASCADE
);

-- Create table to store metadata (attributes) for each object.
-- Each attribute is a key-value pair associated with a specific object.
CREATE TABLE IF NOT EXISTS "attributes" (
    "id" INTEGER NOT NULL PRIMARY KEY,
    "object_id" INTEGER NOT NULL,
    "key" TEXT NOT NULL,
    "value" TEXT,
    UNIQUE("object_id", "key"),
    FOREIGN KEY("object_id") REFERENCES "objects"("id") ON DELETE CASCADE
);

-- Create indexes for faster parent-child lookups.
CREATE INDEX IF NOT EXISTS idx_object_parent_object_id ON object_parent("object_id");
CREATE INDEX IF NOT EXISTS idx_object_parent_parent_id ON object_parent("parent_id");

