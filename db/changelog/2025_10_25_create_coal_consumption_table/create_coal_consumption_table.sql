CREATE TABLE coal_consumption (
    cc_id SERIAL PRIMARY KEY,
    cc_timestamp TIMESTAMP NOT NULL,
    cc_bag_count INT NOT NULL,
    cc_operation_type INT NOT NULL CHECK (cc_operation_type IN (0, 1))
);

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE coal_consumption TO iot_user;
GRANT USAGE, SELECT, UPDATE ON SEQUENCE coal_consumption_cc_id_seq TO iot_user;