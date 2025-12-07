-- What are the top 3 most common complaint types?
select * from ovo_customer_complaints_sample;


select complaint_Type from ovo_customer_complaints_sample
order by Complaint_Type desc
limit 3;

-- Which communication channel receives the highest number of complaints?
select * from ovo_customer_complaints_sample;

select channel, count(*) as no_of_channel
from ovo_customer_complaints_sample
group by channel
order by no_of_channel desc;


-- What is the trend of total complaints over time (by month)?
select * from ovo_customer_complaints_sample;

select extract(month from cast(Date_Received as Date)) AS Complaint_Month,
count(*) as Total_Complaints
from ovo_customer_complaints_sample
group by Complaint_Month;

-- What is the trend of total complaints over time (by month)?
SELECT EXTRACT(YEAR FROM CAST(Date_Received AS DATE)) AS Complaint_YEAR,
       COUNT(*) AS Total_Complaints
FROM ovo_customer_complaints_sample
GROUP BY Complaint_YEAR
ORDER BY Complaint_YEAR;

-- Which complaint types take the longest time to resolve?
select * from ovo_customer_complaints_sample;

SELECT max(Resolution_Time_Days) as no_of_Resolution, Complaint_Type
From ovo_customer_complaints_sample
group by Complaint_Type
order by no_of_Resolution Desc;


-- What is the overall resolution rate (percentage of resolved complaints)?
Select round(sum(case when status = 'Resolved' then 1 else 0 end)::decimal / count(*)* 100),2) as percentage_Resolution
from ovo_customer_complainnts_sample;


SELECT
  ROUND(
    (SUM(CASE WHEN Status = 'Resolved' THEN 1 ELSE 0 END)::decimal
     / COUNT(*) * 100), 2
  ) AS resolution_rate_percent
FROM ovo_customer_complaints_sample;

-- Which complaint channels have the best (fastest) resolution times?
-- 7️⃣ How do complaints differ between Residential and Business customers?
-- What is the average number of days it takes to resolve a complaint overall?
-- How many complaints remain unresolved or escalated?
-- Are complaints decreasing after process improvements or over specific