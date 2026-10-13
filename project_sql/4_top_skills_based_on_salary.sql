/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify
  the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills_dim.skills AS skill,
    ROUND(AVG(jobs.salary_year_avg), 4) AS average_yearly_salary
FROM job_postings_fact AS jobs
INNER JOIN skills_job_dim AS skills ON jobs.job_id = skills.job_id
INNER JOIN skills_dim ON skills.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Machine Learning Engineer' AND 
    jobs.salary_year_avg IS NOT NULL
GROUP BY job_title_short, skill
ORDER BY ROUND(AVG(jobs.salary_year_avg), 4) DESC
LIMIT 5;

-- WORK FROM HOME
SELECT 
    job_title_short,
    skills,
    ROUND(AVG(jobs.salary_year_avg), 4) AS average_yearly_salary
FROM job_postings_fact AS jobs
INNER JOIN skills_job_dim AS skills ON jobs.job_id = skills.job_id
INNER JOIN skills_dim ON skills.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    jobs.salary_year_avg IS NOT NULL AND 
    jobs.job_work_from_home = TRUE
GROUP BY job_title_short, skills
ORDER BY ROUND(AVG(jobs.salary_year_avg), 4) DESC
LIMIT 5;