create database siegfried;
use siegfried;

create table mppt (
entry_id INT NOT NULL AUTO_INCREMENT,
v_batt INT NOT NULL,
i_bat INT NOT NULL,
v_panel INT NOT NULL,
p_panel INT NOT NULL,
op_state SMALLINT NOT NULL,
mppt_mode SMALLINT NOT NULL,
off_reason SMALLINT NOT NULL,
error_msg SMALLINT NOT NULL,
load_state VARCHAR(3) NOT NULL,
i_load INT NOT NULL,
timestamp TIMESTAMP NOT NULL,

PRIMARY KEY(entry_id)
);

create table soc (
id INT NOT NULL AUTO_INCREMENT,
lfp_soc TINYINT NOT NULL,
lfp_low bool not null default 0,
lead_voltage DECIMAL(4,2) NOT NULL,
lead_low bool not null default 0,
lead_charging bool not null default 0,
timestamp TIMESTAMP NOT NULL,

PRIMARY KEY(id)
);

create table settings (
id enum('1') NOT NULL,
charger_enable BOOL NOT NULL DEFAULT false,
lead_low_voltage tinyint not null default 12,
motor_running_voltage tinyint not null default 13,
charger_current tinyint not null default 4,

PRIMARY KEY(id)
);

create table mppt_daily_history (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
energy_yield SMALLINT NOT NULL,
energy_consumed SMALLINT NOT NULL,
battery_voltage_max MEDIUMINT NOT NULL,
battery_voltage_min MEDIUMINT NOT NULL,
error_database TINYINT NOT NULL,
error_0 TINYINT NOT NULL,
error_1 TINYINT NOT NULL,
error_2 TINYINT NOT NULL,
error_3 TINYINT NOT NULL,
time_bulk SMALLINT NOT NULL,
time_absorpion SMALLINT NOT NULL,
time_float SMALLINT NOT NULL,
power_max SMALLINT NOT NULL,
battery_current_max MEDIUMINT NOT NULL,
panel_voltage_max MEDIUMINT NOT NULL,
day_sequence_number TINYINT NOT NULL,
timestamp TIMESTAMP NOT NULL,

PRIMARY KEY(id)
);


show tables;
drop table mppt_daily_history;
describe mppt;
select * from mppt;
select * from soc;
select * from settings;
select * from mppt_daily_history;
select charger_enable from settings where id=1;
insert into soc (lead_low) values (false);
UPDATE settings SET charger_enable=true WHERE id =1;
select p_panel, timestamp from mppt 
	where timestamp > now() - interval 1 day and p_panel != 0;
insert into mppt (v_batt, i_batt, v_panel, p_panel, op_state, mppt_mode, off_reason, error_msg, load_state, i_load, timestamp)
values (?,?,?,?,?,?,?,?,?,?,?);
ALTER TABLE mppt CHANGE i_bat i_batt int;

SELECT table_name "Table Name", table_rows "Rows Count", round(((data_length + index_length)/ 1024 / 1024),2)"Table Size (MB)" FROM information_schema.TABLES WHERE table_schema = "siegfried" AND table_name ="mppt";

