-- Create objects table
-- The backbone of the hierarchy, representing both Groups and Datasets.
-- It uses a self-referential foreign key to establish parent-child relationships.
CREATE TABLE IF NOT EXISTS objects (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "datatype" TEXT CHECK("datatype" IN ('group', 'dataset')) NOT NULL,
    "parent_id" INTEGER,

    UNIQUE("name", "parent_id"),
    FOREIGN KEY ("parent_id") REFERENCES objects("id") ON DELETE CASCADE
);

-- Create attributes table
-- Stores metadata as key-value pairs linked to any Element (Group or Dataset).
CREATE TABLE IF NOT EXISTS attributes (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
  	"object_id" INTEGER NOT NULL,
 	"key" TEXT NOT NULL,
  	"value" TEXT, --json string for struct/cluster types

  	UNIQUE("object_id", "key"),
  	FOREIGN KEY ("object_id") REFERENCES objects("id") ON DELETE CASCADE
);

-- Create dataset_columns table
-- Defines the schema of Datasets, making data insertion and retrieval more structured.
CREATE TABLE IF NOT EXISTS dataset_columns (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
  	"dataset_id" INTEGER NOT NULL,
  	"name" TEXT NOT NULL,
  	"datatype" TEXT NOT NULL,

  	UNIQUE("dataset_id", "name"),
  	FOREIGN KEY ("dataset_id") REFERENCES objects("id") ON DELETE CASCADE
);