WITH source AS (

    SELECT *
    FROM {{ source('classic_models', 'orders') }}

),

renamed AS (

    SELECT
        order_number,
        order_date,
        required_date,
        shipped_date,
        status,
        comments,
        customer_number,
        _sync_date
    FROM source

)

SELECT *
FROM renamed
