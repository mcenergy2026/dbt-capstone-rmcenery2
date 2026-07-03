WITH stg_products AS (

    SELECT *
    FROM {{ ref('stg_classic_models__products') }}

),

final AS (

    SELECT
        product_code,
        product_name,
        product_line,
        product_scale,
        product_vendor,
        product_description,
        quantity_in_stock,
        buy_price,
        msrp,
        _sync_date
    FROM stg_products

)

SELECT *
FROM final
