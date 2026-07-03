WITH int_orders AS (

    SELECT *
    FROM {{ ref('int_orders') }}

),

final AS (

    SELECT
        order_number AS order_pk,
        required_date,
        shipped_date,
        status,
        comments
    FROM int_orders

)

SELECT *
FROM final
