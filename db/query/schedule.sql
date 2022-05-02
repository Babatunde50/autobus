-- name: GetSchedule :one
SELECT *
FROM schedule
WHERE id = $1
LIMIT 1;
-- name: ListSchedules :many
SELECT *
FROM schedule;
-- name: CreateSchedule :one
INSERT INTO schedule (
        bus_id,
        driver_id,
        starting_point,
        destination,
        schedule_date,
        departure_time,
        estimated_arrival_time,
        fare_amount,
        remarks
    )
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
RETURNING *;
-- name: DeleteSchedule :one
DELETE FROM schedule
WHERE id = $1
RETURNING *;
-- name: UpdateSchedule :one
UPDATE schedule
SET starting_point = $1,
    destination = $2,
    schedule_date = $3,
    departure_time = $4,
    estimated_arrival_time = $5,
    fare_amount = $6,
    remarks = $7
RETURNING *;