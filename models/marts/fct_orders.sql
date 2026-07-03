WITH int_order_details AS (

    SELECT *
    FROM {{ ref('int_order_details') }}

),

final AS (

    SELECT
        order_number,
        order_line_number,
        product_code,
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
        product_name,
        product_line,
        product_scale,
        product_vendor,
        quantity_ordered,
        price_each,
        line_amount,
        _sync_date
    FROM int_order_details

)

SELECT *
FROM final
