WITH int_order_details AS (

    SELECT *
    FROM {{ ref('int_order_details') }}

),

final AS (

    SELECT
        cast(order_number AS number(38,0)) AS order_pk,
        product_code AS product_pk,
        cast(customer_number AS number(38,0)) AS customer_pk,
        order_date,
        cast(order_line_number AS number(38,0)) AS order_line_number,
        product_code,
        cast(quantity_ordered AS number(38,0)) AS quantity_ordered,
        price_each,
        line_amount
    FROM int_order_details

)

SELECT *
FROM final
