-- DROP SCHEMA food;

CREATE SCHEMA food AUTHORIZATION postgres;
-- food.meals definition

-- Drop table

-- DROP TABLE food.meals;

CREATE TABLE food.meals (
	mealguid uuid NOT NULL,
	ownerguid uuid NOT NULL,
	creatorguid uuid NULL,
	mealname varchar NOT NULL,
	mealdescription varchar NULL,
	CONSTRAINT meals_pk PRIMARY KEY (mealguid)
);

-- Permissions

ALTER TABLE food.meals OWNER TO postgres;
GRANT ALL ON TABLE food.meals TO postgres;
GRANT INSERT, SELECT, TRUNCATE, UPDATE, TRIGGER, REFERENCES ON TABLE food.meals TO hangrify_backend_food;


-- food.recipes definition

-- Drop table

-- DROP TABLE food.recipes;

CREATE TABLE food.recipes (
	recipeguid uuid NOT NULL,
	ownerguid uuid NOT NULL,
	creatorguid uuid NULL,
	recipename varchar NOT NULL,
	recipedescription varchar NULL,
	recipematerial jsonb NOT NULL,
	recipeguide varchar NULL,
	CONSTRAINT recipes_pk PRIMARY KEY (recipeguid)
);
CREATE UNIQUE INDEX recipes_recipeguid_idx ON food.recipes USING btree (recipeguid);

-- Permissions

ALTER TABLE food.recipes OWNER TO postgres;
GRANT ALL ON TABLE food.recipes TO postgres;
GRANT INSERT, SELECT, TRUNCATE, UPDATE, TRIGGER, REFERENCES ON TABLE food.recipes TO hangrify_backend_food;


-- food.mealitems definition

-- Drop table

-- DROP TABLE food.mealitems;

CREATE TABLE food.mealitems (
	mealitemguid uuid NOT NULL,
	mealguid uuid NOT NULL,
	recipeguid uuid NOT NULL,
	CONSTRAINT mealitems_pk PRIMARY KEY (mealitemguid),
	CONSTRAINT mealitems_fk FOREIGN KEY (mealguid) REFERENCES food.meals(mealguid),
	CONSTRAINT mealitems_fk_1 FOREIGN KEY (recipeguid) REFERENCES food.recipes(recipeguid)
);

-- Permissions

ALTER TABLE food.mealitems OWNER TO postgres;
GRANT ALL ON TABLE food.mealitems TO postgres;




-- Permissions

GRANT ALL ON SCHEMA food TO postgres;
GRANT ALL ON SCHEMA food TO hangrify_backend_food;
