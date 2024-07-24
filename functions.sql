--Explore data with select ALL
select * from payment;

--Stored procedure example
--Simulate a late fee charge 

create or replace procedure latefee(
    customer INTEGER, 
    lateFeeAmount DECIMAL
)
language plpgsql
as $$
begin 
	--Add a late fee to the customer payment amount 
	update payment 
	set amount = amount + lateFeeAmount 
	where customer_id = customer;

    --Commit the above statement inside of a transaction 
    commit;
end
$$

--Calling a stored procedure 
call latefee(341,2.00)

select * from payment 
where customer_id = 134

--DELETE fucntions
--Make a stored fucntion to insert data into the actor table 

create or replace function add_actor(
     _actor_id INTEGER,
     _first_name VARCHAR,
     _last_name VARCHAR, 
     -last_update TIMESTAMP without TIME zone 
)
returns void 
as $MAINS 
begin 
     insert into actor(actor_id, first_name, last_name, last_update)
     values(_actor_id, _first_name, _last_name, _last_update)
end
$MAIN$
language plpgsql

--Bad way to call the function 
--Call add_actor(500, 'Kevin', 'Hart', NOW()::timestamp);

--Verify that the new actor has been added

select * from actor 
where actor_id > 500
