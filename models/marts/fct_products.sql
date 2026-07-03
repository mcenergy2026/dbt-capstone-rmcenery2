WITH int_products AS (

    SELECT *
    FROM {{ ref('int_products') }}

),

final AS (

    SELECT
        product_code AS product_pk,
        product_name,
        product_line,
        product_scale,
        product_vendor,
        product_description,
        quantity_in_stock,
        buy_price,
        msrp,
        _sync_date
    FROM int_products

)

SELECT *
FROM final
