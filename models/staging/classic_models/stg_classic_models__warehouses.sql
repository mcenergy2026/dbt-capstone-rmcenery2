with source as (

    select *
    from {{ source('classic_models', 'warehouses') }}

),

renamed as (

    select
        warehouse_code,
        warehouse_name,
        address_line1,
        city,
        state,
        country,
        postal_code,
        capacity,
        _sync_date
    from source

)

select *
from renamed