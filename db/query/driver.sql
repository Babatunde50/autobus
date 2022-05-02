-- name: GetDriver :one
SELECT *
FROM driver
WHERE id = $1
LIMIT 1;
-- name: ListDrivers :many
SELECT *
FROM driver
LIMIT $1
OFFSET $2;
-- name: CreateDriver :one
INSERT INTO driver (full_name, kimlik_number, password)
VALUES ($1, $2, $3)
RETURNING *;
-- name: DeleteDriver :one
DELETE FROM driver
WHERE id = $1
RETURNING *;
-- name: UpdateDriver :one
UPDATE driver
SET full_name = $1
RETURNING *;