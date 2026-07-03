WITH int_payments AS (

    SELECT *
    FROM {{ ref('int_payments') }}

),

final AS (

    SELECT
        customer_number,
        check_number,
        payment_date,
        amount,
        customer_name,
        customer_first_name,
        customer_last_name,
        customer_phone,
        customer_city,
        customer_state,
        customer_postal_code,
        customer_country,
        sales_rep_employee_number,
        credit_limit,
        _sync_date
    FROM int_payments

)

SELECT *
FROM final
