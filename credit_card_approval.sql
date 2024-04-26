use capstone_credit_worthyness;

select * from credit_card_prospects;
desc credit_card_prospects;

select * from credit_card_label;
desc credit_card_label;

select * from credit_card_prospects ccp inner join credit_card_label ccl on ccp.Ind_ID = ccl.Ind_ID;

-- Group the customers based on their income type and find the average of their annual income.
select Type_Income, avg(Annual_income) from credit_card_prospects ccp
group by ccp.Type_Income;

-- Find the female owners of cars and property.
select Ind_ID, Gender, Car_owner, Propert_owner  from credit_card_prospects ccp
where ccp.Gender = 'F'
AND ccp.Car_owner = 'Y'
AND ccp.Propert_owner = 'Y';

-- Find the male customers who are staying with their families.
select Ind_ID, Gender, Family_Members  from credit_card_prospects ccp
where ccp.Gender = 'M'
AND ccp.Family_Members > 1;

-- Please list the top five people having the highest income.
select Ind_ID, Annual_income from credit_card_prospects ccp
order by Annual_income desc limit 5;

-- How many married people are having bad credit?
select count(*) from credit_card_prospects ccp inner join credit_card_label ccl on ccp.Ind_ID = ccl.Ind_ID
where ccp.Marital_status = 'Married'
AND label = 1;

-- What is the highest education level and what is the total count?
select count(*) from credit_card_prospects cp where cp.Education = 'Academic degree';

-- Between married males and females, who is having more bad credit? 
select count(ccp.Ind_ID), Gender, Marital_status, ccl.label from credit_card_prospects ccp inner join credit_card_label ccl on ccp.Ind_ID = ccl.Ind_ID
where ccl.label = 1 AND ccp.Marital_status = 'Married'
group by ccp.Gender;