/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
  helping job seekers understand which skills to develop that align with top salaries
*/

WITH highest_paying_jobs AS (
    SELECT 
        job_id,
        job_title, 
        name AS company_name,
        salary_year_avg,
        job_posted_date
    FROM job_postings_fact 
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_work_from_home = True AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    highest_paying_jobs.job_id,
    highest_paying_jobs.job_title, 
    skills_dim.skills AS skill_name,
    highest_paying_jobs.company_name,
    highest_paying_jobs.salary_year_avg,
    highest_paying_jobs.job_posted_date
FROM highest_paying_jobs
INNER JOIN skills_job_dim ON highest_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
