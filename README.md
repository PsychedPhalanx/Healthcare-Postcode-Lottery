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

- **GP:Non-GP clinical staff (nurses plus Direct Patient Care) shows superior predictive power (urban local authorities only):**
  - GPs per Clinical Staff vs Deprivation: R² = 9.7% (p < 0.05)
  - GPs per Clinical Staff vs Life Expectancy: R² = 15.5% (p < 0.05)
  - GPs per Clinical Staff vs Wait Times: R² = 9.3% (p < 0.05)
 
## Data Sources
**Local Authority-Level:**
1. **Deprivation:** [ONS Census 2021 Households by Deprivation Dimensions](https://www.ons.gov.uk/datasets/TS011/editions/2021/versions/6#variables)
2. **Life Expectancy:** [ONS Life Expectancy for Local Areas of Great Britain, 2023](https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/healthandlifeexpectancies/datasets/lifeexpectancyforlocalareasofgreatbritainsingleyearperiods)
3. **Population Numbers:** [ONS Estimate of the Population for England and Wales, 2023](https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/estimatesofthepopulationforenglandandwales)
4. **Rural/Urban Classification:** [ONS Rural Urban Classification 2021](https://www.data.gov.uk/dataset/8daa9988-f4e6-40e3-82df-58bb0ae947a3/rural-urban-classification-2021-of-local-authority-districts-2024-in-ew)

**GP Surgery-Level:**
1. **Staff Data:** [General Practice Workforce, 30 April 2025](https://digital.nhs.uk/data-and-information/publications/statistical/general-and-personal-medical-services/30-april-2025)
2. **Patient Data:** [Patients Registered at a GP Practice, April 2025](https://digital.nhs.uk/data-and-information/publications/statistical/patients-registered-at-a-gp-practice/april-2025)
3. **Appointment Data:** [Appointments in General Practice, April 2025](https://digital.nhs.uk/data-and-information/publications/statistical/appointments-in-general-practice/april-2025)

## Methodology

## Tools Used

## Repository Structure
