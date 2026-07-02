WITH source AS (

    SELECT *
    FROM {{ source('classic_models', 'orders') }}

)

SELECT *
FROM source
