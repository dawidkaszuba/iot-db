CREATE TABLE devices (
    de_id SERIAL PRIMARY KEY,
    de_uid VARCHAR(64) UNIQUE NOT NULL,
    de_name VARCHAR(255),
    de_ip VARCHAR(15),
    de_last_seen TIMESTAMP,
    de_delete_time TIMESTAMP,
    de_change_time TIMESTAMP DEFAULT NOW(),
    de_change_user VARCHAR(64)
);
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE devices TO iot_user;
GRANT USAGE, SELECT, UPDATE ON SEQUENCE devices_de_id_seq TO iot_user;

CREATE TABLE sensors (
    se_id SERIAL PRIMARY KEY,
    de_id INT NOT NULL REFERENCES devices(de_id) ON DELETE CASCADE,
    se_type VARCHAR(50) NOT NULL,
    se_unit VARCHAR(20) NOT NULL,
    se_change_time TIMESTAMP DEFAULT NOW(),
    se_change_user VARCHAR(64),
    se_delete_time TIMESTAMP
);

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE sensors TO iot_user;
GRANT USAGE, SELECT, UPDATE ON SEQUENCE sensors_se_id_seq TO iot_user;