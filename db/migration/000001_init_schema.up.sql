CREATE TABLE "account" (
	"id" bigserial PRIMARY KEY,
	"owner" VARCHAR NOT NULL,
	"balance" BIGINT NOT NULL,
	"currency" VARCHAR NOT NULL,
	"created_at" TIMESTAMP NOT NULL DEFAULT (now())
);

CREATE TABLE "entries" (
	"id" bigserial PRIMARY KEY,
	"account_id" BIGINT NOT NULL,
	"amount" bigint NOT NULL,
	"created_at" TIMESTAMP NOT NULL DEFAULT (now())
);

CREATE TABLE "transfers" (
	"id" bigserial PRIMARY KEY,
	"from_account_id" BIGINT NOT NULL,
	"to_account_id" BIGINT NOT NULL,
	"amount" BIGINT not null,
	"created_at" TIMESTAMP NOT NULL DEFAULT (now())
);

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "account" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "account" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "account" ("id");

CREATE INDEX on "account" ("owner");
CREATE INDEX on "entries" ("account_id");
CREATE INDEX on "transfers" ("from_account_id");
CREATE INDEX on "transfers" ("to_account_id");
CREATE INDEX on "transfers" ("from_account_id","to_account_id");

COMMENT ON COLUMN "entries"."amount" IS 'can be negative or positive';

COMMENT ON COLUMN "transfers"."amount" IS 'must be positive';