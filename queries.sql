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

SELECT count(*), l.photo_id, u.username
FROM photos as p
JOIN likes as l
ON l.photo_id = p.id
JOIN users as u
ON p.user_id = u.id
GROUP BY 2
ORDER BY 1 DESC
LIMIT 1

/*A partner brand wants to know, which hashtags to use in the post to reach the most people on the platform.
Your Task: Identify and suggest the top 5 most commonly used hashtags on the platform*/

SELECT tag_id, count(*), tag_name
FROM photo_tags as p
JOIN tags as t
ON t.id = p.tag_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

/*The team wants to know, which day would be the best day to launch ADs.
Your Task: What day of the week do most users register on? Provide insights on when to schedule an ad campaign*/

SELECT date_format(created_at,'%W'), count(*)
FROM users 
GROUP BY 1
ORDER BY 2 DESC

/*Are users still as active and post on Instagram or they are making fewer posts
Your Task: Provide how many times does average user posts on Instagram. Also, provide the total number of photos on Instagram/total number of users*/

SELECT 
    AVG(t1.counter) average_times_a_user_posts
FROM
    (SELECT 
        u.username username, u.id, COUNT(p.id) counter
    FROM
        photos AS p
    JOIN likes AS l ON l.photo_id = p.id
    JOIN users AS u ON p.user_id = u.id
    GROUP BY 1 , 2
    ORDER BY 3 DESC) t1


SELECT 
    count(p.id)/count(u.id)
FROM
    photos AS p
        JOIN
    likes AS l ON l.photo_id = p.id
        JOIN
    users AS u ON p.user_id = u.id

/*The investors want to know if the platform is crowded with fake and dummy accounts
Your Task: Provide data on users (bots) who have liked every single photo on the site (since any normal user would not be able to do this).*/

SELECT u.id, u.username, COUNT(u.id)
FROM users AS u
JOIN likes AS l 
ON u.id = l.user_id
GROUP BY u.id
HAVING COUNT(u.id) = (SELECT COUNT(*)
					  FROM photos);



