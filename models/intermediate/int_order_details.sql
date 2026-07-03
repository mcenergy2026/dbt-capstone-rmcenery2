WITH order_details AS (

    SELECT *
    FROM {{ ref('stg_classic_models__order_details') }}

),

orders AS (

    SELECT *
    FROM {{ ref('stg_classic_models__orders') }}

),

customers AS (

    SELECT *
    FROM {{ ref('stg_classic_models__customers') }}

),

products AS (

    SELECT *
    FROM {{ ref('stg_classic_models__products') }}

),

final AS (

    SELECT
        od.order_number,
        od.order_line_number,
        od.product_code,
        o.order_date,
        o.required_date,
        o.shipped_date,
        o.status,
        o.comments,
        o.customer_number,
        c.customer_name,
        c.customer_first_name,
        c.customer_last_name,
        c.phone AS customer_phone,
        c.city AS customer_city,
        c.state AS customer_state,
        c.postal_code AS customer_postal_code,
        c.country AS customer_country,
        c.sales_rep_employee_number,
        p.product_name,
        p.product_line,
        p.product_scale,
        p.product_vendor,
        od.quantity_ordered,
        od.price_each,
        od.line_amount,
        od._sync_date
    FROM order_details AS od
        LEFT JOIN orders AS o
            ON od.order_number = o.order_number
        LEFT JOIN customers AS c
            ON o.customer_number = c.customer_number
        LEFT JOIN products AS p
            ON od.product_code = p.product_code

)

SELECT *
FROM final
