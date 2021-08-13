select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    --la colonna amount è scritta in centesimi, convertirla in dollari
   -- amount / 100 as amount_sql,                         --istruzione scritta in SQL
    {{ cents_to_dollars('amount')}} as amount_jinja,    --istruzione scritta in Jinja
    

    created as created_at
from {{ source('stripe', 'payment') }}