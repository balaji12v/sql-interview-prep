-- i used a cte for making another column of rank using window function
-- then i selected the column where rank =2
-- edge case:null value is not printing when there is no 2nd highest salary
-- so i used an aggregation function.so when there is no 2nd highest salary it will print null value
# Write your MySQL query statement below
with ranking as (
    select id,salary,dense_rank() over(order by salary desc) as Second
    from Employee
)

select max(salary) as SecondHighestSalary
from ranking 
where Second = 2;
