-- Problem: Movie Rating (LC 1341)

-- Pattern: Aggregation + Ranking

-- Approach:
-- 1. Find user with most ratings
-- 2. Find movie with highest average rating (Feb 2020)
-- 3. Combine results using UNION ALL
(
    select u.name as results
    from MovieRating r
    join Users u
    on u.user_id = r.user_id
    group by u.user_id
    order by count(*) desc,u.name asc
    limit 1
)
union all
(
    select m.title as results
    from MovieRating r
    join Movies m
    on m.movie_id = r.movie_id
    where date_format(r.created_at,'%Y-%m') = '2020-02'
    group by m.movie_id
    order by avg(r.rating) desc,m.title asc
    limit 1
)
