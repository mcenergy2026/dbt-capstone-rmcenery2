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
        product_description
    FROM int_products

)

SELECT *
FROM final
