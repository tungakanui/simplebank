postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=1234 -d postgres

createdb:
	docker exec -it postgres createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres dropdb --username=root --owner=root simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://postgres:1234@localhost:5432/simple_bank?sslmode=disable" --verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:1234@localhost:5432/simple_bank?sslmode=disable" --verbose down

.PHONY: createdb dropdb postgres

