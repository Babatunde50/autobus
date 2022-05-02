-- name: GetPassengerPayments :many
SELECT *
FROM payment
WHERE passenger_id = $1;
-- name: CreatePayment :one
INSERT INTO payment (amount_paid, payment_date, passenger_id)
VALUES ($1, $2, $3)
RETURNING *;