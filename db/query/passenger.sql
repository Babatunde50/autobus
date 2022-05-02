-- name: GetPassenger :one
SELECT *
FROM passenger
WHERE id = $1
LIMIT 1;
-- name: ListPassengers :many
SELECT *
FROM passenger
LIMIT $1
OFFSET $2;
-- name: CreatePassenger :one
INSERT INTO passenger (full_name, kimlik_number, password)
VALUES ($1, $2, $3)
RETURNING *;
-- name: DeletePassenger :one
DELETE FROM passenger
WHERE id = $1
RETURNING *;
-- name: UpdatePassenger :one
UPDATE passenger
SET full_name = $1
RETURNING *;