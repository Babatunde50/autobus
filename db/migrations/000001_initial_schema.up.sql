CREATE TABLE "bus" (
  "id" bigserial PRIMARY KEY,
  "bus_number" varchar(6) NOT NULL,
  "bus_plate_number" varchar(8) NOT NULL,
  "capacity" int NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "passenger" (
  "id" bigserial PRIMARY KEY,
  "full_name" varchar(50) NOT NULL,
  "kimlik_number" varchar(15) UNIQUE NOT NULL,
  "password" varchar(30) NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "driver" (
  "id" bigserial PRIMARY KEY,
  "full_name" varchar(50) NOT NULL,
  "kimlik_number" varchar(15) NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now()),
  "password" varchar(30) NOT NULL
);

CREATE TABLE "schedule" (
  "id" bigserial PRIMARY KEY,
  "bus_id" bigint,
  "driver_id" bigint,
  "starting_point" varchar(50) NOT NULL,
  "destination" varchar(50) NOT NULL,
  "schedule_date" date NOT NULL,
  "departure_time" time NOT NULL,
  "estimated_arrival_time" time NOT NULL,
  "fare_amount" float NOT NULL,
  "remarks" varchar(150) NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "schedule_passenger" (
  "passenger_id" bigserial,
  "schedule_id" bigserial,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  PRIMARY KEY ("passenger_id", "schedule_id")
);

CREATE TABLE "payment" (
  "id" bigserial PRIMARY KEY,
  "amount_paid" float NOT NULL,
  "payment_date" timestamptz NOT NULL,
  "passenger_id" bigint,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "bus" ("bus_number");

CREATE INDEX ON "bus" ("bus_plate_number");

CREATE INDEX ON "passenger" ("kimlik_number");

CREATE INDEX ON "driver" ("kimlik_number");

ALTER TABLE "schedule" ADD FOREIGN KEY ("bus_id") REFERENCES "bus" ("id");

ALTER TABLE "schedule" ADD FOREIGN KEY ("driver_id") REFERENCES "driver" ("id");

ALTER TABLE "schedule_passenger" ADD FOREIGN KEY ("passenger_id") REFERENCES "passenger" ("id");

ALTER TABLE "schedule_passenger" ADD FOREIGN KEY ("schedule_id") REFERENCES "schedule" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("passenger_id") REFERENCES "passenger" ("id");
