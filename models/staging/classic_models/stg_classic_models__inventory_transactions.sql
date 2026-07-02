with source as (

    select *
    from {{ source('classic_models', 'inventory_transactions') }}

),

renamed as (

    select
        transaction_id,
        product_code,
        warehouse_code,
        transaction_type,
        quantity,
        transaction_date,
        reference_id,
        _sync_date
    from source

)

select *
from renamed