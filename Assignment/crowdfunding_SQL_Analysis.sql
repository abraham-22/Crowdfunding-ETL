-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT COUNT(cf_id)
FROM campaign 
GROUP BY cf_id
ORDER BY cf_id DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT * FROM campaign ;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

-- Joining campaign and contact tables
SELECT co.first_name,
	co.last_name,
    co.email,
    ca.goal,
    ca.pledged
INTO live_campaign
FROM contacts as co
	INNER JOIN campaign as ca
		ON (co.contact_id = ca.contact_id)
ORDER BY ca.goal DESC;


SELECT ca.goal- ca.pledged AS LEFT remaining_goal
FROM live_campaign as lca 
INNER JOIN campaign as ca
		ON (lca.contact_id = ca.contact_id)
GROUP BY ca.goal
ORDER BY ca.goal DESC;

-- Check the table
SELECT * FROM live_campaign ;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 



-- Check the table


