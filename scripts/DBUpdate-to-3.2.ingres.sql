-- ----------------------------------------------------------
--  driver: ingres, generated: 2012-07-18 20:11:08
-- ----------------------------------------------------------
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN group_read RESTRICT;\g
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN group_write RESTRICT;\g
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN other_read RESTRICT;\g
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN other_write RESTRICT;\g
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN ticket_answered RESTRICT;\g
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN group_id RESTRICT;\g
CREATE SEQUENCE pm_process_977;\g
CREATE TABLE pm_process (
    id INTEGER NOT NULL DEFAULT pm_process_977.NEXTVAL,
    entity_id VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    state_entity_id VARCHAR(50) NOT NULL,
    layout LONG BYTE NOT NULL,
    config LONG BYTE NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL,
    UNIQUE (entity_id)
);\g
MODIFY pm_process TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE pm_process ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE SEQUENCE pm_activity_344;\g
CREATE TABLE pm_activity (
    id INTEGER NOT NULL DEFAULT pm_activity_344.NEXTVAL,
    entity_id VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    config LONG BYTE NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL,
    UNIQUE (entity_id)
);\g
MODIFY pm_activity TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE pm_activity ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE SEQUENCE pm_activity_dialog_900;\g
CREATE TABLE pm_activity_dialog (
    id INTEGER NOT NULL DEFAULT pm_activity_dialog_900.NEXTVAL,
    entity_id VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    config LONG BYTE NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL,
    UNIQUE (entity_id)
);\g
MODIFY pm_activity_dialog TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE pm_activity_dialog ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE SEQUENCE pm_transition_566;\g
CREATE TABLE pm_transition (
    id INTEGER NOT NULL DEFAULT pm_transition_566.NEXTVAL,
    entity_id VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    config LONG BYTE NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL,
    UNIQUE (entity_id)
);\g
MODIFY pm_transition TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE pm_transition ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE TABLE pm_entity (
    entity_type VARCHAR(50) NOT NULL,
    entity_counter INTEGER NOT NULL
);\g
MODIFY pm_entity TO btree;\g
CREATE TABLE pm_entity_sync (
    entity_type VARCHAR(30) NOT NULL,
    entity_id VARCHAR(50) NOT NULL,
    sync_state VARCHAR(30) NOT NULL,
    create_time TIMESTAMP NOT NULL,
    change_time TIMESTAMP NOT NULL,
    UNIQUE (entity_type, entity_id)
);\g
MODIFY pm_entity_sync TO btree;\g
-- ----------------------------------------------------------
--  alter table dynamic_field
-- ----------------------------------------------------------
ALTER TABLE dynamic_field ADD COLUMN internal_field SMALLINT NOT NULL WITH DEFAULT;\g
-- ----------------------------------------------------------
--  insert into table dynamic_field
-- ----------------------------------------------------------
INSERT INTO dynamic_field (id, internal_field, name, label, field_order, field_type, object_type, config, valid_id, create_by, create_time, change_by, change_time)
    VALUES
    (1, 1, 'ProcessManagementProcessID', 'ProcessManagementProcessID', 1, 'Text', 'Ticket', '---DefaultValue: ''''', 1, 1, current_timestamp, 1, current_timestamp);\g
-- ----------------------------------------------------------
--  insert into table dynamic_field
-- ----------------------------------------------------------
INSERT INTO dynamic_field (id, internal_field, name, label, field_order, field_type, object_type, config, valid_id, create_by, create_time, change_by, change_time)
    VALUES
    (1, 1, 'ProcessManagementActivityID', 'ProcessManagementActivityID', 1, 'Text', 'Ticket', '---DefaultValue: ''''', 1, 1, current_timestamp, 1, current_timestamp);\g
ALTER TABLE pm_process ADD FOREIGN KEY (create_by) REFERENCES users(id);\g
ALTER TABLE pm_process ADD FOREIGN KEY (change_by) REFERENCES users(id);\g
ALTER TABLE pm_activity ADD FOREIGN KEY (create_by) REFERENCES users(id);\g
ALTER TABLE pm_activity ADD FOREIGN KEY (change_by) REFERENCES users(id);\g
ALTER TABLE pm_activity_dialog ADD FOREIGN KEY (create_by) REFERENCES users(id);\g
ALTER TABLE pm_activity_dialog ADD FOREIGN KEY (change_by) REFERENCES users(id);\g
ALTER TABLE pm_transition ADD FOREIGN KEY (create_by) REFERENCES users(id);\g
ALTER TABLE pm_transition ADD FOREIGN KEY (change_by) REFERENCES users(id);\g
