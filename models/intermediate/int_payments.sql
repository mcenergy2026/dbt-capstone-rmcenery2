WITH payments AS (

    SELECT *
    FROM {{ ref('stg_classic_models__payments') }}

),

customers AS (

    SELECT *
    FROM {{ ref('stg_classic_models__customers') }}

),

final AS (

    SELECT
        p.customer_number,
        p.check_number,
        p.payment_date,
        p.amount,
        c.customer_name,
        c.customer_first_name,
        c.customer_last_name,
        c.phone AS customer_phone,
        c.city AS customer_city,
        c.state AS customer_state,
        c.postal_code AS customer_postal_code,
        c.country AS customer_country,
        c.sales_rep_employee_number,
        c.credit_limit,
        p._sync_date
    FROM payments AS p
        LEFT JOIN customers AS c
            ON p.customer_number = c.customer_number

)

SELECT *
FROM final
