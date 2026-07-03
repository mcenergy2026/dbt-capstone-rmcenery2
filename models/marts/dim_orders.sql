WITH int_orders AS (

    SELECT *
    FROM {{ ref('int_orders') }}

),

final AS (

    SELECT
        order_number AS order_pk,
        order_date,
        required_date,
        shipped_date,
        status,
        comments,
        customer_number,
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
        line_count,
        distinct_product_count,
        total_quantity_ordered,
        order_amount,
        _sync_date
    FROM int_orders

)

SELECT *
FROM final
