/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
  providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills_dim.skills AS skill_name,
    COUNT(skills_job_dim    .job_id) AS jobs_in_demand
FROM job_postings_fact AS jobs
INNER JOIN skills_job_dim AS skills ON jobs.job_id = skills.job_id
INNER JOIN skills_dim ON skills.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_work_from_home = TRUE
GROUP BY skills_dim.skills
ORDER BY jobs_in_demand DESC
LIMIT 5;

