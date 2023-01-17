/*Rewarding Most Loyal Users: People who have been using the platform for the longest time.
Your Task: Find the 5 oldest users of the Instagram from the database provided*/
SELECT * 
FROM users
ORDER BY created_at
LIMIT 5;

/*Remind Inactive Users to Start Posting: By sending them promotional emails to post their 1st photo.
Your Task: Find the users who have never posted a single photo on Instagram*/

SELECT u.username, u.id
FROM users as u
LEFT JOIN photos as p
ON u.id= p.users_id
WHERE p.id IS NULL

/*Declaring Contest Winner: The team started a contest and the user who gets the most likes on a single photo will win the contest now they wish to declare the winner.
Your Task: Identify the winner of the contest and provide their details to the team*/

