# HR-Analytics-Dashboard-Overview

## Project Overview
The HR Dashboard project aims to develop a sophisticated analytical tool for HR managers, enabling them to analyze human resources data effectively. This dashboard will serve as both a high-level overview and a detailed analysis platform, enhancing decision-making processes regarding distribution of workforce, age, gender, performance and education for strategic planning. By synthesizing key metrics and providing actionable insights, the dashboard will support HR initiatives aligned with organizational goals.

Scope
Summary View
Overview Section

Employee Counts:
Display the total number of hired employees, active employees, and terminated employees. This will include historical data to track trends over time.
Hired vs. Terminated Trends:
Visualizations (line charts or bar graphs) to illustrate the total number of hired and terminated employees annually, highlighting trends and potential seasonal patterns.
Departmental Breakdown:
Pie charts or stacked bar charts showing the distribution of employees by department and job titles, allowing for quick identification of staffing levels and departmental needs.
HQ vs. Branch Comparison:
Comparison metrics between headquarters and branches, with specific attention to the New York HQ, providing insights into resource allocation and potential areas for improvement.
Geographic Distribution:
Maps or heat maps showing employee distribution by city and state, helping identify talent pools and regional workforce demographics.
Demographics Section

Gender Ratio:
Visual representation (e.g., gauge or pie chart) of the gender ratio in the company, providing insights into diversity.
Age and Education Distribution:
Histograms displaying the age distribution of employees and bar charts for education levels. This section will help identify the workforce's generational composition and educational qualifications.
Age Group and Education Level Counts:
Detailed counts of employees categorized by age groups (e.g., 20-29, 30-39) and education levels (e.g., high school, bachelor’s, master’s), facilitating targeted recruitment and training programs.
Educational Background and Performance Correlation:
Scatter plots or correlation matrices showcasing the relationship between employees' educational backgrounds and their performance ratings, assisting in assessing the effectiveness of educational qualifications on performance.
Income Analysis Section

Salary Comparison by Education Level:
Box plots or bar graphs comparing average salaries across different education levels, segmented by gender to identify any discrepancies and promote equitable pay practices.
Age and Salary Correlation:
Line graphs illustrating how age correlates with salary within departments, helping to identify trends in compensation related to experience and age.
Employee Records View
Comprehensive Employee Listing:
A searchable and sortable list of all employees that includes:
Name
Department
Position
Gender
Age
Education level
Salary
Include functionality for exporting data (e.g., CSV or Excel) for further analysis or reporting.
Advanced Filtering Options:
Users can filter the list based on any column, allowing for tailored views of specific employee demographics, roles, or other relevant factors.
Recommendations
Data Integration:

Ensure seamless integration with existing HRIS and payroll systems for real-time data updates, allowing HR managers to access the most current information.
Implement data validation processes to maintain data integrity and accuracy.
User-Friendly Interface:

Design a visually appealing and intuitive interface that enables users to navigate easily between sections and understand complex data at a glance.
Incorporate interactive elements like tooltips and hover-over explanations for data visualizations to enhance user comprehension.
Training and Support:

Develop comprehensive training programs for HR staff, including documentation, tutorials, and hands-on workshops to familiarize users with the dashboard's features.
Establish a support system for ongoing assistance and troubleshooting.
Regular Updates:

Schedule periodic reviews and updates to the dashboard to incorporate new metrics, user feedback, and evolving HR practices.
Use analytics to track dashboard usage and user engagement, adjusting features based on user activity.
Feedback Mechanism:

Implement a feedback loop through surveys and user interviews to gather insights on dashboard usability and functionality, ensuring continuous improvement.
Encourage HR personnel to suggest new metrics or features that could enhance the dashboard's effectiveness.


Conclusions
The HR Dashboard represents a significant advancement in the ability to analyze and manage human resources within an organization. By combining high-level overviews with detailed insights, HR managers will be empowered to make informed, data-driven decisions that can enhance workforce management, improve employee satisfaction, and align HR strategies with organizational objectives. The emphasis on user-friendly design, regular updates, and comprehensive support will ensure the dashboard remains a valuable resource for HR professionals, ultimately contributing to a more effective and equitable workplace.





## Project Overview
This project aimed to build a comprehensive HR analytics report for Atlas Labs' HR team using Power BI. The report helps track key HR metrics and factors impacting employee attrition.

## Goals and Objectives
- **Primary Goal:** Monitor key HR metrics on employees.
- **Secondary Goal:** Understand what factors impact employee attrition.

## Scope of Work
Using the Kimball model approach, I worked with facts and dimensions to build a data model. A date dimension table will was added, followed by the analysis.

## Target Audience
Atlas Labs HR team

## Data Sources
- `Employee.csv`
- `EducationLevel.csv`
- `PerformanceRating.csv`
- `RatingLevel.csv`
- `SatisfiedLevel.csv`

The dataset includes a fact table storing performance ratings and five dimension tables: Employee, EducationLevel, RatingLevel, SatisfiedLevel, and Date. The final data model follows a snowflake schema.

## Metrics and KPIs
Key metrics and KPIs used to measure success include:
- Attrition rate
- Employee demographics
- Performance ratings
- Job role distribution
- Departmental metrics

## Overarching Insights

![HR Analytics Overview](https://github.com/)
### Attrition Rate
- **Overall Attrition Rate:** 16.1%
- **Department and Job Role with Highest Attrition Rate:** Sales and Sales Representative (39.8%)
- **Frequent Travelers' Attrition Rate:** 24.9%

### Employee Growth
- The biggest growth in new employees was in Q1 2022, with 130 new hires.

### Department Distribution
- Over half of the active employees work in the technology department.
- Most common job roles: Software Engineer and Data Scientist.

### Demographics

![HR Analytics Demographics](https://github.com/)
- Majority of employees are aged 20-29.
- Employees identifying as white have the highest average salary.
- Employees identifying as mixed or multiple ethnicities have the lowest average salary ($106K).
- Women make up only 2.7% of the organization.
- Managerial rating level and self-performance level often don't align.
  
![HR Analytics Performance Tracker](https://github.com/)

![HR Analytics Attrition](https://github.com/)

## Recommendations
1. **Support Employee Growth:**
   - Organize individual meetings to discuss needs and create improvement plans.
   - Implement regular training and development programs to upskill employees.
2. **Review Travel Policies:**
   - Survey employees on feelings about travel frequency and adjust policies accordingly.
3. **Improve Hiring Strategies:**
   - Focus on diversity hiring to increase the representation of women and other underrepresented groups in the organization.
   - Enhance onboarding processes to ensure new employees are well-integrated and supported from the start.
4. **Monitor and Adjust Compensation:**
   - Regularly review and adjust salaries to ensure competitiveness and fairness.

## Conclusion
The Atlas Labs HR team can now easily navigate key metrics related to company employees, enabling more informed decisions on hiring, monitoring diversity and inclusion, and tracking employee performance and attrition.


