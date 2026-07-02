with source as (

    select *
    from {{ source('classic_models', 'returns') }}

),

renamed as (

    select
        return_id,
        order_number,
        product_code,
        quantity_returned,
        return_date,
        reason,
        refund_amount,
        status,
        _sync_date
    from source

)

select *
from renamed