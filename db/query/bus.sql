-- name: GetBus :one
SELECT *
FROM bus
WHERE id = $1
LIMIT 1;
-- name: ListBuses :many
SELECT *
FROM bus
ORDER BY capacity;
-- name: CreateBus :one
INSERT INTO bus (bus_number, bus_plate_number, capacity)
VALUES ($1, $2, $3)
RETURNING *;
-- name: DeleteBus :one
DELETE FROM bus
WHERE id = $1
RETURNING *;
-- name: UpdateBus :one
UPDATE bus
SET capacity = $1
RETURNING *;