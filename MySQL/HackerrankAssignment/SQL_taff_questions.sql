/*
    Questions:
        Link: https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

        Description:
            Julia asked her students to create some coding challenges. 
            Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
            Sort your results by the total number of challenges in descending order. 
            If more than one student created the same number of challenges, then sort the result by hacker_id. 
            If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
*/



/*
Enter your query here.
*/
-- Get Max Challenges: 50
-- select max(tchallenges) from 
--         (select hacker_id, count(challenge_id) as tchallenges 
--             from Challenges group by hacker_id) as max_channenges;


-- with count_table as 
--     (select hacker_id, count(challenge_id) as tchallenges from Challenges group by hacker_id)
--     select tchallenges, count(*) as no_of_students from count_table
--         group by tchallenges 
--         having (tchallenges < 50 and no_of_students = 1) or tchallenges = 50
--         order by tchallenges desc;
        
-- find total_channanges (=50 or (<50 with count=1))
-- with count_table as 
--         (select hacker_id, count(challenge_id) as tchallenges from Challenges group by hacker_id)
--     select tchallenges, count(*) as no_of_students from count_table
--         group by tchallenges 
--         having (no_of_students = 1 
--                     and 
--                 tchallenges < (select max(tc1) from 
--                               (select hacker_id, count(challenge_id) as tc1 
--                                     from Challenges group by hacker_id) as max_tc1)) 
--             or 
--                 tchallenges = (select max(tc) from 
--                               (select hacker_id, count(challenge_id) as tc 
--                                     from Challenges group by hacker_id) as max_tc)
--         order by tchallenges desc;

-- select tchallenges from (
--     with count_table as 
--         (select hacker_id, count(challenge_id) as tchallenges from Challenges group by hacker_id)
--     select tchallenges, count(*) as no_of_students from count_table
--         group by tchallenges 
--         having (no_of_students = 1 
--                     and 
--                 tchallenges < (select max(tc1) from 
--                               (select hacker_id, count(challenge_id) as tc1 
--                                     from Challenges group by hacker_id) as max_tc1)) 
--             or 
--                 tchallenges = (select max(tc) from 
--                               (select hacker_id, count(challenge_id) as tc 
--                                     from Challenges group by hacker_id) as max_tc)
--         order by tchallenges desc
-- ) as selected_challanges_list;

select H.hacker_id, H.name, C.t_challenges
    from Hackers H 
            inner join 
        (select hacker_id, count(challenge_id) as t_challenges from Challenges group by hacker_id) C 
        on H.hacker_id = C.hacker_id
    where C.t_challenges in (
          select tchallenges from (
                with count_table as 
                    (select hacker_id, count(challenge_id) as tchallenges from Challenges group by hacker_id)
                select tchallenges, count(*) as no_of_students from count_table
                    group by tchallenges 
                    having (no_of_students = 1 
                                and 
                            tchallenges < (select max(tc1) from 
                                          (select hacker_id, count(challenge_id) as tc1 
                                                from Challenges group by hacker_id) as max_tc1)) 
                        or 
                            tchallenges = (select max(tc) from 
                                          (select hacker_id, count(challenge_id) as tc 
                                                from Challenges group by hacker_id) as max_tc)
                    order by tchallenges desc
            ) as selected_challanges_list
    )
    order by C.t_challenges desc, H.hacker_id;