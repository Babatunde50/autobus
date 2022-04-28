migrateup: 
	 migrate -path db/migrations -database "postgresql://postgres:postgres@localhost:5432/autobus?sslmode=disable" -verbose up

migratedown: 
	 migrate -path db/migrations -database "postgresql://postgres:postgres@localhost:5432/autobus?sslmode=disable" -verbose down 


.PHONY: migratedown migrateup