// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.13.0
// source: driver.sql

package db

import (
	"context"
)

const createDriver = `-- name: CreateDriver :one
INSERT INTO driver (full_name, kimlik_number, password)
VALUES ($1, $2, $3)
RETURNING id, full_name, kimlik_number, created_at, updated_at, password
`

type CreateDriverParams struct {
	FullName     string `json:"full_name"`
	KimlikNumber string `json:"kimlik_number"`
	Password     string `json:"password"`
}

func (q *Queries) CreateDriver(ctx context.Context, arg CreateDriverParams) (Driver, error) {
	row := q.db.QueryRowContext(ctx, createDriver, arg.FullName, arg.KimlikNumber, arg.Password)
	var i Driver
	err := row.Scan(
		&i.ID,
		&i.FullName,
		&i.KimlikNumber,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.Password,
	)
	return i, err
}

const deleteDriver = `-- name: DeleteDriver :one
DELETE FROM driver
WHERE id = $1
RETURNING id, full_name, kimlik_number, created_at, updated_at, password
`

func (q *Queries) DeleteDriver(ctx context.Context, id int64) (Driver, error) {
	row := q.db.QueryRowContext(ctx, deleteDriver, id)
	var i Driver
	err := row.Scan(
		&i.ID,
		&i.FullName,
		&i.KimlikNumber,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.Password,
	)
	return i, err
}

const getDriver = `-- name: GetDriver :one
SELECT id, full_name, kimlik_number, created_at, updated_at, password
FROM driver
WHERE id = $1
LIMIT 1
`

func (q *Queries) GetDriver(ctx context.Context, id int64) (Driver, error) {
	row := q.db.QueryRowContext(ctx, getDriver, id)
	var i Driver
	err := row.Scan(
		&i.ID,
		&i.FullName,
		&i.KimlikNumber,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.Password,
	)
	return i, err
}

const listDrivers = `-- name: ListDrivers :many
SELECT id, full_name, kimlik_number, created_at, updated_at, password
FROM driver
LIMIT $1
OFFSET $2
`

type ListDriversParams struct {
	Limit  int32 `json:"limit"`
	Offset int32 `json:"offset"`
}

func (q *Queries) ListDrivers(ctx context.Context, arg ListDriversParams) ([]Driver, error) {
	rows, err := q.db.QueryContext(ctx, listDrivers, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Driver{}
	for rows.Next() {
		var i Driver
		if err := rows.Scan(
			&i.ID,
			&i.FullName,
			&i.KimlikNumber,
			&i.CreatedAt,
			&i.UpdatedAt,
			&i.Password,
		); err != nil {
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

const updateDriver = `-- name: UpdateDriver :one
UPDATE driver
SET full_name = $1
RETURNING id, full_name, kimlik_number, created_at, updated_at, password
`

func (q *Queries) UpdateDriver(ctx context.Context, fullName string) (Driver, error) {
	row := q.db.QueryRowContext(ctx, updateDriver, fullName)
	var i Driver
	err := row.Scan(
		&i.ID,
		&i.FullName,
		&i.KimlikNumber,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.Password,
	)
	return i, err
}