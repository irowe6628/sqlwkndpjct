CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "email" VARCHAR(100),
  "phone_number" VARCHAR(30),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "email" VARCHAR(100),
  "phone_number" VARCHAR(30),
  PRIMARY KEY ("mechanic_id")
);

CREATE TABLE "service_ticket" (
  "ticket_id" SERIAL,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "mechanic_id" INTEGER,
  "repair_type" VARCHAR(100),
  "service_ticket_date" DATE,
  "invoice_number" INTEGER,
  PRIMARY KEY ("ticket_id"),
  CONSTRAINT "FK_service_ticket.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_service_ticket.mechanic_id"
    FOREIGN KEY ("mechanic_id")
      REFERENCES "mechanic"("mechanic_id")
);

CREATE TABLE "car" (
  "car_id" SERIAL,
  "make" VARCHAR(100),
  "model" VARCHAR(100),
  "year" VARCHAR(4),
  "car_price" VARCHAR(10),
  "new_used" VARCHAR(100),
  PRIMARY KEY ("car_id"),
  CONSTRAINT "FK_car.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "service_ticket"("car_id")
);

CREATE TABLE "salesperson" (
  "salesperson_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "email" VARCHAR(100),
  "phone_number" VARCHAR(30),
  PRIMARY KEY ("salesperson_id")
);

CREATE TABLE "invoice" (
  "invoice_number" SERIAL,
  "salesperson_id" INTEGER,
  "customer_id" INTEGER,
  "invoice_date" DATE,
  "car_id" INTEGER,
  "price" VARCHAR(10),
  PRIMARY KEY ("invoice_number"),
  CONSTRAINT "FK_invoice.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_invoice.invoice_number"
    FOREIGN KEY ("invoice_number")
      REFERENCES "service_ticket"("invoice_number"),
  CONSTRAINT "FK_invoice.salesperson_id"
    FOREIGN KEY ("salesperson_id")
      REFERENCES "salesperson"("salesperson_id")
);

CREATE TABLE "service_history" (
  "service_number" SERIAL,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "history_repair_type" VARCHAR(100),
  "mechanic_id" INTEGER,
  "service_history_date" DATE,
  "service_price" VARCHAR(10),
  "ticket_id" INTEGER,
  PRIMARY KEY ("service_number"),
  CONSTRAINT "FK_service_history.ticket_id"
    FOREIGN KEY ("ticket_id")
      REFERENCES "service_ticket"("ticket_id")
);


INSERT INTO customer(customer_id, first_name, last_name, email, phone_number)
VALUES('00001','jimmy','jones','jjones@gmail.com','5555155555'),('00002','joey','johnson','jjohnson@gmail.com','5555255555'),('00003','robert','robinson','rrobinson@gmail.com','5555355555')

INSERT INTO mechanic(mechanic_id, first_name, last_name, email, phone_number)
VALUES('10001','harry','bones','hbones@gmail.com','5555455555'),('00002','noah','jackson','njackson@gmail.com','5555555555'),('00003','dean','simpson','dsimpson@gmail.com','5555655555')

INSERT INTO service_ticket(ticket_id, car_id, customer_id, mechanic_id, repair_type, service_ticket_date, invoice_number)
VALUES('20001','30001','00001','10001','oil_change', '10.10.2022','40001'),('20002','30002','00002','10002','oil_change', '10.10.2022','40002'),('20003','30003','00003','10003','oil_change', '10.10.2022','40003')

INSERT INTO car(car_id, make, model, year, car_price, new_used)
VALUES('30001','honda','accord','2022','30000','used'),('30002','honda','civic','2022','25000','used'),('30003','bmw','m340i','2022','55000','used')

INSERT INTO salesperson(salesperson_id, first_name, last_name, email, phone_number)
VALUES('50001','mike','sanchez','msanchez@gmail.com','5555855555')('50002','timmy','turner','cosmowanda@gmail.com','5555755555')('50001','jimmy','neutron','bigbrain@gmail.com','5555955555')

INSERT INTO invoice(invoice_number, salesperson_id, customer_id, invoice_date, car_id, price)
VALUES('40005','50005','00010','10.10.2022','30005','50000'),('40006','50006','00012','10.10.2022','30006','50000'),('40007','50007','00011','10.10.2022','30007','70000')

INSERT INTO service_history(service_number, car_id, customer_id, history_repair_type, mechanic_id, service_history_date, service_price, ticket_id)
VALUES('60006','30010','00014','oil_change','10005','10.10.2022','160','20005')

    --customer id = 0...
    --mechanic id = 1...
    --ticket id = 2...
    --car id = 3...
    --invoice number = 4...
    --salesperson id = 5...
    --service number = 6..

CREATE PROCEDURE add_to_customer(
    "customer_id" SERIAL,
    "first_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "email" VARCHAR(100),
    "phone_number" VARCHAR(30),

)LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO customer(customer_id, first_name, last_name, email, phone_number)
    COMMIT;
END
$$

CREATE PROCEDURE add_to_mechanic(
    "mechanic_id" SERIAL,
    "first_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "email" VARCHAR(100),
    "phone_number" VARCHAR(30)

)LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO mechanic(mechanic_id, first_name, last_name, email, phone_number)
    COMMIT;
END
$$

CREATE PROCEDURE add_to_service_ticket(
  "ticket_id" SERIAL,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "mechanic_id" INTEGER,
  "repair_type" VARCHAR(100),
  "service_ticket_date" DATE,
  "invoice_number" INTEGER,

)LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO service_ticket(ticket_id, car_id, customer_id, mechanic_id, repair_type, service_ticket_date, invoice_number)
    COMMIT;
END
$$

CREATE PROCEDURE add_to_car(
  "car_id" SERIAL,
  "make" VARCHAR(100),
  "model" VARCHAR(100),
  "year" VARCHAR(4),
  "car_price" VARCHAR(10),
  "new_used" VARCHAR(100),

)LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO car(car_id, make, model, year, car_price, new_used)
    COMMIT;
END
$$

CREATE PROCEDURE add_to_salesperson(
  "salesperson_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "email" VARCHAR(100),
  "phone_number" VARCHAR(30),

)LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO salesperson(salesperson_id, first_name, last_name, email, phone_number)
    COMMIT;
END
$$

CREATE PROCEDURE add_to_invoice(
  "invoice_number" SERIAL,
  "salesperson_id" INTEGER,
  "customer_id" INTEGER,
  "invoice_date" DATE,
  "car_id" INTEGER,
  "price" VARCHAR(10),

)LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO invoice(invoice_number, salesperson_id, customer_id, invoice_date, car_id, price)
    COMMIT;
END
$$

CREATE PROCEDURE add_to_service_number(
  "service_number" SERIAL,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "history_repair_type" VARCHAR(100),
  "mechanic_id" INTEGER,
  "service_history_date" DATE,
  "service_price" VARCHAR(10),
  "ticket_id" INTEGER,

)LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO service_history(service_number, car_id, customer_id, history_repair_type, mechanic_id, service_history_date, service_price, ticket_id)
    COMMIT;
END
$$
