-- name: GetPassengerSchedules :many
SELECT *
FROM schedule_passenger
WHERE passenger_id = $1;
-- name: CreateSchedulePassenger :one
INSERT INTO schedule_passenger (passenger_id, schedule_id)
VALUES ($1, $2)
RETURNING *;
-- name: DeleteSchedulePassenger :one
DELETE FROM schedule_passenger
WHERE passenger_id = $1
    AND schedule_id = $2
RETURNING *;