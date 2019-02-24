-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 9.6
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: opsview | type: SCHEMA --
-- DROP SCHEMA IF EXISTS opsview CASCADE;
CREATE SCHEMA opsview;
-- ddl-end --
ALTER SCHEMA opsview OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,opsview;
-- ddl-end --

-- object: opsview.team | type: TABLE --
-- DROP TABLE IF EXISTS opsview.team CASCADE;
CREATE TABLE opsview.team(
	id uuid NOT NULL,
	name text,
	creation_ts timestamp,
	CONSTRAINT team_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE opsview.team OWNER TO postgres;
-- ddl-end --

INSERT INTO opsview.team (id, name, creation_ts) VALUES (E'D5A66D80-7740-432D-89E1-6422E1199E8B\n', E'Web', DEFAULT);
-- ddl-end --
INSERT INTO opsview.team (id, name, creation_ts) VALUES (E'99CAC1B7-1D62-44F8-B9D2-2A38F2BE39A8\n', E'Mobile', DEFAULT);
-- ddl-end --
INSERT INTO opsview.team (id, name, creation_ts) VALUES (E'19922AA8-D7C6-4D13-B534-682144A30E03\n', E'Systems', DEFAULT);
-- ddl-end --
INSERT INTO opsview.team (id, name, creation_ts) VALUES (E'1078A931-B50F-4959-923E-C1402885A0B7\n', E'Dev Ops', DEFAULT);
-- ddl-end --

-- object: opsview.repository | type: TABLE --
-- DROP TABLE IF EXISTS opsview.repository CASCADE;
CREATE TABLE opsview.repository(
	id uuid NOT NULL,
	name text,
	url text,
	id_team uuid,
	CONSTRAINT repository_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE opsview.repository OWNER TO postgres;
-- ddl-end --

INSERT INTO opsview.repository (id, name, url, id_team) VALUES (E'05AF3CA4-D8B7-4EB8-901C-3DAC090CE1F7\n', E'Public Website', E'https://github.com/junk/junk.git', E'D5A66D80-7740-432D-89E1-6422E1199E8B\n');
-- ddl-end --

-- object: opsview.application | type: TABLE --
-- DROP TABLE IF EXISTS opsview.application CASCADE;
CREATE TABLE opsview.application(
	id uuid NOT NULL,
	name text,
	id_namespace uuid,
	id_repository uuid,
	CONSTRAINT application_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE opsview.application OWNER TO postgres;
-- ddl-end --

-- object: opsview.namespace | type: TABLE --
-- DROP TABLE IF EXISTS opsview.namespace CASCADE;
CREATE TABLE opsview.namespace(
	id uuid NOT NULL,
	name text,
	id_cluster uuid,
	CONSTRAINT namespace_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE opsview.namespace OWNER TO postgres;
-- ddl-end --

-- object: opsview.pipeline | type: TABLE --
-- DROP TABLE IF EXISTS opsview.pipeline CASCADE;
CREATE TABLE opsview.pipeline(
	id uuid NOT NULL,
	url text,
	id_application uuid,
	CONSTRAINT pipeline_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE opsview.pipeline OWNER TO postgres;
-- ddl-end --

-- object: opsview.cluster | type: TABLE --
-- DROP TABLE IF EXISTS opsview.cluster CASCADE;
CREATE TABLE opsview.cluster(
	id uuid NOT NULL,
	name text,
	url text,
	CONSTRAINT cluster_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE opsview.cluster OWNER TO postgres;
-- ddl-end --

INSERT INTO opsview.cluster (id, name, url) VALUES (E'974BB276-2B97-429B-B5D9-E6F4F309A15E\n', E'Production', DEFAULT);
-- ddl-end --
INSERT INTO opsview.cluster (id, name, url) VALUES (E'592382C1-382D-40C4-A54D-0592E3885FCF\n', E'Test', DEFAULT);
-- ddl-end --
INSERT INTO opsview.cluster (id, name, url) VALUES (E'3DFF7A50-9359-4DDC-BA71-6B17D66BDDBA\n', E'Dev', DEFAULT);
-- ddl-end --

-- object: cluster_fk | type: CONSTRAINT --
-- ALTER TABLE opsview.namespace DROP CONSTRAINT IF EXISTS cluster_fk CASCADE;
ALTER TABLE opsview.namespace ADD CONSTRAINT cluster_fk FOREIGN KEY (id_cluster)
REFERENCES opsview.cluster (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: namespace_fk | type: CONSTRAINT --
-- ALTER TABLE opsview.application DROP CONSTRAINT IF EXISTS namespace_fk CASCADE;
ALTER TABLE opsview.application ADD CONSTRAINT namespace_fk FOREIGN KEY (id_namespace)
REFERENCES opsview.namespace (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: team_fk | type: CONSTRAINT --
-- ALTER TABLE opsview.repository DROP CONSTRAINT IF EXISTS team_fk CASCADE;
ALTER TABLE opsview.repository ADD CONSTRAINT team_fk FOREIGN KEY (id_team)
REFERENCES opsview.team (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: repository_fk | type: CONSTRAINT --
-- ALTER TABLE opsview.application DROP CONSTRAINT IF EXISTS repository_fk CASCADE;
ALTER TABLE opsview.application ADD CONSTRAINT repository_fk FOREIGN KEY (id_repository)
REFERENCES opsview.repository (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: application_fk | type: CONSTRAINT --
-- ALTER TABLE opsview.pipeline DROP CONSTRAINT IF EXISTS application_fk CASCADE;
ALTER TABLE opsview.pipeline ADD CONSTRAINT application_fk FOREIGN KEY (id_application)
REFERENCES opsview.application (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pipeline_uq | type: CONSTRAINT --
-- ALTER TABLE opsview.pipeline DROP CONSTRAINT IF EXISTS pipeline_uq CASCADE;
ALTER TABLE opsview.pipeline ADD CONSTRAINT pipeline_uq UNIQUE (id_application);
-- ddl-end --

-- object: opsview.component_type_dm | type: TABLE --
-- DROP TABLE IF EXISTS opsview.component_type_dm CASCADE;
CREATE TABLE opsview.component_type_dm(
	id uuid NOT NULL,
	name text,
	description text,
	CONSTRAINT component_type_dm_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE opsview.component_type_dm OWNER TO postgres;
-- ddl-end --

INSERT INTO opsview.component_type_dm (id, name, description) VALUES (E'F1B8157B-5892-4B70-BBB4-FE108C243E27\n', E'Database', DEFAULT);
-- ddl-end --
INSERT INTO opsview.component_type_dm (id, name, description) VALUES (E'A9D46923-4B2E-4D89-A125-C7F5DE823921\n', E'Framework', DEFAULT);
-- ddl-end --
INSERT INTO opsview.component_type_dm (id, name, description) VALUES (E'5F4BB21D-783C-482A-8503-DD0719920DCF\n', E'Identity Provider', DEFAULT);
-- ddl-end --
INSERT INTO opsview.component_type_dm (id, name, description) VALUES (E'9199C604-69BA-461B-9A03-9548E39346C6\n', E'Programming Language', DEFAULT);
-- ddl-end --

-- object: opsview.component | type: TABLE --
-- DROP TABLE IF EXISTS opsview.component CASCADE;
CREATE TABLE opsview.component(
	id uuid NOT NULL,
	name text,
	id_component_type_dm uuid NOT NULL,
	CONSTRAINT component_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE opsview.component OWNER TO postgres;
-- ddl-end --

-- object: component_type_dm_fk | type: CONSTRAINT --
-- ALTER TABLE opsview.component DROP CONSTRAINT IF EXISTS component_type_dm_fk CASCADE;
ALTER TABLE opsview.component ADD CONSTRAINT component_type_dm_fk FOREIGN KEY (id_component_type_dm)
REFERENCES opsview.component_type_dm (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: opsview.many_component_has_many_application | type: TABLE --
-- DROP TABLE IF EXISTS opsview.many_component_has_many_application CASCADE;
CREATE TABLE opsview.many_component_has_many_application(
	id_component uuid NOT NULL,
	id_application uuid NOT NULL,
	CONSTRAINT many_component_has_many_application_pk PRIMARY KEY (id_component,id_application)

);
-- ddl-end --

-- object: component_fk | type: CONSTRAINT --
-- ALTER TABLE opsview.many_component_has_many_application DROP CONSTRAINT IF EXISTS component_fk CASCADE;
ALTER TABLE opsview.many_component_has_many_application ADD CONSTRAINT component_fk FOREIGN KEY (id_component)
REFERENCES opsview.component (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: application_fk | type: CONSTRAINT --
-- ALTER TABLE opsview.many_component_has_many_application DROP CONSTRAINT IF EXISTS application_fk CASCADE;
ALTER TABLE opsview.many_component_has_many_application ADD CONSTRAINT application_fk FOREIGN KEY (id_application)
REFERENCES opsview.application (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


