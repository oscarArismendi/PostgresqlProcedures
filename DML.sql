

CREATE OR REPLACE PROCEDURE createClient(
    id_in INT,
    firstname_in VARCHAR(40),
    lastname_in VARCHAR(100),
    cellphone_in DECIMAL(10,0),
    address_in VARCHAR(80),
    email_in VARCHAR(70)
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- create the client
    INSERT INTO clients(id,firstname,lastname,cellphone,address,email) VALUES
    (id_in,firstname_in,lastname_in,cellphone_in,address_in,email_in);
END;$$;

-- CALL createClient(1,'oscar','arismendi',3111111111,'center','aris@example.com');

CREATE OR REPLACE PROCEDURE updateClient(
    id_in INT,
    firstname_in VARCHAR(40),
    lastname_in VARCHAR(100),
    cellphone_in DECIMAL(10,0),
    address_in VARCHAR(80),
    email_in VARCHAR(70)
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- update clientes the client
    UPDATE clients
    SET firstname = firstname_in,
    lastname = lastname_in,
    cellphone = cellphone_in,
    address = address_in,
    email = email_in
    WHERE id = id_in;
END;$$;

-- CALL updateClient(1,'fer','aris',3234567891,'street 13','oscar@example.com'); 