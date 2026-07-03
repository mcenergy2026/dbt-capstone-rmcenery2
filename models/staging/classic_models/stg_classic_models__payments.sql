WITH source AS (

    SELECT *
    FROM {{ source('classic_models', 'payments') }}

),

renamed AS (

    SELECT
        customer_number,
        check_number,
        payment_date,
        amount,
        _sync_date
    FROM source

)

SELECT *
FROM renamed
