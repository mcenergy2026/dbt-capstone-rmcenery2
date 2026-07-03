WITH int_payments AS (

    SELECT *
    FROM {{ ref('int_payments') }}

),

final AS (

    SELECT
        customer_number AS customer_pk,
        check_number,
        payment_date,
        amount
    FROM int_payments
)

SELECT *
FROM final
