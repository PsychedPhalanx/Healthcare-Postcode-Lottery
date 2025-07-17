# Healthcare Postcode Lottery
Investigating the role of GP surgeries in shaping health and social inequalities in England

## Background
- There is significant variation in deprivation levels and life expectancy across England. At the local authority-level, there is moderate correlation between the proportion of deprived households and life expectancy (r = -0.77, p < 0.0001, n = 294). A 10% increase in the number of deprived households leads to a 2.4 year reduction in life expectancy.
- Given that GP surgeries constitute the frontline of the NHS, their performance likely serves as a key determinant of deprivation and life expectancy.

## Aims
- To determine whether and to what extent GP surgery performance predicts deprivation and life expectancy at the local authority-level.
- To determine differences in GP surgery composition across rural/urban and socioeconomic divides.
- To create a tool, enabling users to investigate GP performance in their area.

## Key Findings
- **Substantial variation in GPs per capita and average appointment wait times:**
  - GPs per capita (CV = 0.61) and average appointment wait times (CV = 0.38) are widely used healthcare access measures, both of which show significant variation.

- **Limited correlation with health outcomes (urban local authorities only):**
  - GPs per Capita vs Deprivation: R² = 2.2% (p < 0.05)
  - GPs per Capita vs Life Expectancy: R² = 1.3% (not significant)  
  - Wait Times vs Deprivation: R² = 0.3% (not significant)
  - Wait Times vs Life Expectancy: R² = 0.6% (not significant)

- **The ratio of GPs to non-GP clinical staff (nurses plus Direct Patient Care) shows superior predictive power (urban local authorities only):**
  - GPs per Clinical Staff vs Deprivation: R² = 9.7% (p < 0.05)
  - GPs per Clinical Staff vs Life Expectancy: R² = 15.5% (p < 0.05)
  - GPs per Clinical Staff vs Wait Times: R² = 9.3% (p < 0.05)

## Dashboard

**[Access the Tableau dashboard here:](https://public.tableau.com/app/profile/shivam.wadhia/viz/HealthcarePostcodeLottery/TheHealthcarePostcodeLottery)**
 
## Data Sources
**Local Authority-Level:**
1. **Deprivation:** [ONS Census 2021 Households by Deprivation Dimensions](https://www.ons.gov.uk/datasets/TS011/editions/2021/versions/6#variables) - Proportion of households experiencing deprivation in one or more measures by local authority, extracted for England only.
2. **Life Expectancy:** [ONS Life Expectancy for Local Areas of Great Britain, 2023](https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/healthandlifeexpectancies/datasets/lifeexpectancyforlocalareasofgreatbritainsingleyearperiods) - Life expectancy at birth estimates by local authority.
3. **Population Numbers:** [ONS Estimate of the Population for England and Wales, 2023](https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/estimatesofthepopulationforenglandandwales) - 2023, mid-year population estimates by local authority.
4. **Rural/Urban Classification:** [ONS Rural Urban Classification 2021](https://www.data.gov.uk/dataset/8daa9988-f4e6-40e3-82df-58bb0ae947a3/rural-urban-classification-2021-of-local-authority-districts-2024-in-ew) - four-category classification of local authorities as urban, intermediate urban, intermediate rural, or rural, as per [2021 Rural Urban Classification].(https://www.ons.gov.uk/methodology/geography/geographicalproducts/ruralurbanclassifications/2021ruralurbanclassification)

**GP Surgery-Level:**
1. **Staff Data:** [General Practice Workforce, 30 April 2025](https://digital.nhs.uk/data-and-information/publications/statistical/general-and-personal-medical-services/30-april-2025) - Headcount data for GPs, practice nurses, and direct patient care staff across GP practices in England
2. **Patient Data:** [Patients Registered at a GP Practice, April 2025](https://digital.nhs.uk/data-and-information/publications/statistical/patients-registered-at-a-gp-practice/april-2025) - Total number of registered patients per GP practice.
3. **Appointment Data:** [Appointments in General Practice, April 2025](https://digital.nhs.uk/data-and-information/publications/statistical/appointments-in-general-practice/april-2025) - total appointments and counts satisfied within same day, 1 day, 2-7 days, 8-14 days, etc. by practice.

**Geographic:**
1. **Postcode to Local Authority Mapping:** [ONS Postcode Directory (February 2024)](https://geoportal.statistics.gov.uk/datasets/e14b1475ecf74b58804cf667b6740706) - Geographic lookup enabling linkage between GP practice postcodes and local authorities.
2. **Local Authority Shapefile:** [Local Authority Districts (May 2024)](https://geoportal.statistics.gov.uk/datasets/ons::local-authority-districts-may-2024-boundaries-uk-bfe-2/about) - Shapefile for the plotting of choropleth maps.
## Methodology
1. **Local Authority Data Processing:**
    - Extracted local authority-level data from ONS sources containing several geographic levels of detail. Used PostgreSQL to join datasets on local authority code.
2. **GP Surgery Data Processing:**
    - Extracted headcount data (rather than FTE) from staff data. Used PostgreSQL to convert staffing data from long to wide format, generating a singular row per GP practice, with columns for the number of GPs, nurses and DPC staff.
    - Estimated average wait times per practice from appointment interval data by assigning values to each time bracket (0 days, 1 day, 2-7 days = 4.5 days, 8-14 days = 11 days, etc.) and calculating the weighted average based on appointment volumes to generate a single estimated wait time per practice.
    - Used ONS Postcode Directory to map GP practice postcodes to their corresponding local authorities, enabling aggregation of practice-level data to the local authority level.
    - Joined all GP surgery datasets on practice code.
3. **Analysis and Visualisation:**
    - Aggregated practice-level metrics to local authority level.
    - Created calculated fields for per capita metrics, staff ratios, and variation measures.
    - Performed statistical analysis examining relationships between healthcare metrics and health outcomes across continuous and categorical variables.
    - Built an interactive dashboard on Tableau with a GP finder tool.
## Tools Used
- PostgreSQL
- Tableau Public
## Repository Structure
