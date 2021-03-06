// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.13.0
// source: schedule_passenger.sql

package db

import (
	"context"
)

const createSchedulePassenger = `-- name: CreateSchedulePassenger :one
INSERT INTO schedule_passenger (passenger_id, schedule_id)
VALUES ($1, $2)
RETURNING passenger_id, schedule_id, created_at
`

type CreateSchedulePassengerParams struct {
	PassengerID int64 `json:"passenger_id"`
	ScheduleID  int64 `json:"schedule_id"`
}

func (q *Queries) CreateSchedulePassenger(ctx context.Context, arg CreateSchedulePassengerParams) (SchedulePassenger, error) {
	row := q.db.QueryRowContext(ctx, createSchedulePassenger, arg.PassengerID, arg.ScheduleID)
	var i SchedulePassenger
	err := row.Scan(&i.PassengerID, &i.ScheduleID, &i.CreatedAt)
	return i, err
}

const deleteSchedulePassenger = `-- name: DeleteSchedulePassenger :one
DELETE FROM schedule_passenger
WHERE passenger_id = $1
    AND schedule_id = $2
RETURNING passenger_id, schedule_id, created_at
`

type DeleteSchedulePassengerParams struct {
	PassengerID int64 `json:"passenger_id"`
	ScheduleID  int64 `json:"schedule_id"`
}

func (q *Queries) DeleteSchedulePassenger(ctx context.Context, arg DeleteSchedulePassengerParams) (SchedulePassenger, error) {
	row := q.db.QueryRowContext(ctx, deleteSchedulePassenger, arg.PassengerID, arg.ScheduleID)
	var i SchedulePassenger
	err := row.Scan(&i.PassengerID, &i.ScheduleID, &i.CreatedAt)
	return i, err
}

const getPassengerSchedules = `-- name: GetPassengerSchedules :many
SELECT passenger_id, schedule_id, created_at
FROM schedule_passenger
WHERE passenger_id = $1
`

func (q *Queries) GetPassengerSchedules(ctx context.Context, passengerID int64) ([]SchedulePassenger, error) {
	rows, err := q.db.QueryContext(ctx, getPassengerSchedules, passengerID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []SchedulePassenger{}
	for rows.Next() {
		var i SchedulePassenger
		if err := rows.Scan(&i.PassengerID, &i.ScheduleID, &i.CreatedAt); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}
