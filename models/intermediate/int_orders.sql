WITH orders AS (

    SELECT *
    FROM {{ ref('stg_classic_models__orders') }}

),

order_details AS (

    SELECT *
    FROM {{ ref('stg_classic_models__order_details') }}

),

customers AS (

    SELECT *
    FROM {{ ref('stg_classic_models__customers') }}

),

order_line_rollup AS (

    SELECT
        order_number,
        COUNT(*) AS line_count,
        COUNT(DISTINCT product_code) AS distinct_product_count,
        SUM(quantity_ordered) AS total_quantity_ordered,
        SUM(quantity_ordered * price_each) AS order_amount
    FROM order_details
    GROUP BY 1

),

final AS (

    SELECT
        o.order_number,
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
        c.credit_limit,
        COALESCE(olr.line_count, 0) AS line_count,
        COALESCE(olr.distinct_product_count, 0) AS distinct_product_count,
        COALESCE(olr.total_quantity_ordered, 0) AS total_quantity_ordered,
        COALESCE(olr.order_amount, 0) AS order_amount,
        o._sync_date
    FROM orders AS o
    LEFT JOIN order_line_rollup AS olr
        ON o.order_number = olr.order_number
    LEFT JOIN customers AS c
        ON o.customer_number = c.customer_number

)

SELECT *
FROM final
