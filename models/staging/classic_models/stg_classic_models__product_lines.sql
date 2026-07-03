WITH source AS (

    SELECT *
    FROM {{ source('classic_models', 'product_lines') }}

),

renamed AS (

    SELECT
        product_line,
        text_description,
        html_description,
        image,
        _sync_date
    FROM source

)

SELECT *
FROM renamed
