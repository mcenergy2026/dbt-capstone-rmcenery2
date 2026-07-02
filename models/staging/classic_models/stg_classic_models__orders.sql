with source as (

    select *
    from {{ source('classic_models', 'orders') }}

)

select *
from source