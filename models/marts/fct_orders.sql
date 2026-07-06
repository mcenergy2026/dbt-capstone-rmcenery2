WITH int_order_details AS (

    SELECT *
    FROM {{ ref('int_order_details') }}

),

final AS (

    SELECT
        order_number AS order_pk,
        product_code AS product_pk,
        customer_number AS customer_pk,
        order_line_number,
        product_code,
        quantity_ordered,
        price_each,
        line_amount
    FROM int_order_details

)

SELECT *
FROM final
