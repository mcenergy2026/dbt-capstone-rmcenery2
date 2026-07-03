WITH int_customers AS (

    SELECT *
    FROM {{ ref('int_customers') }}

),

final AS (

    SELECT
        customer_number AS customer_pk,
        customer_name,
        customer_first_name,
        customer_last_name,
        phone,
        address_line1,
        address_line2,
        city,
        state,
        postal_code,
        country,
        sales_rep_employee_number,
        credit_limit,
        _sync_date
    FROM int_customers

)

SELECT *
FROM final
