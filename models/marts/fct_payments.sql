WITH int_payments AS (

    SELECT *
    FROM {{ ref('int_payments') }}

),

final AS (

    SELECT
        customer_number AS CUSTOMER_PK,
        check_number,
        payment_date,
        amount
    FROM int_payments
)

SELECT *
FROM final
