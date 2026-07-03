WITH int_products AS (

    SELECT *
    FROM {{ ref('int_products') }}

),

final AS (

    SELECT
        product_code AS product_pk,
        quantity_in_stock,
        buy_price,
        msrp
    FROM int_products

)

SELECT *
FROM final
