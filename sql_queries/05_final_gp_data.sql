SELECT 
    g.code AS practice_code,
    INITCAP(staff_agg.practice_name) AS practice_name,
    g.postcode,
    p.latitude,
    p.longitude,
    p.lad_code,
    g.number_of_patients,
    
    COALESCE(staff_agg.admin_non_clinical, 0) AS admin_non_clinical,
    COALESCE(staff_agg.direct_patient_care, 0) AS direct_patient_care,
    COALESCE(staff_agg.gp, 0) AS gp,
    COALESCE(staff_agg.nurses, 0) AS nurses,

    COALESCE(wt_agg.total_appointments, 0) AS total_appointments,

    CASE 
        WHEN COALESCE(wt_agg.total_appointments, 0) > 0 THEN
            ROUND(
                (
                    wt_agg.sum_wt_0 * 0 +
                    wt_agg.sum_wt_1 * 1 +
                    wt_agg.sum_wt_2_7 * 4.5 +
                    wt_agg.sum_wt_8_14 * 11 +
                    wt_agg.sum_wt_15_21 * 18 +
                    wt_agg.sum_wt_22_28 * 25 +
                    wt_agg.sum_wt_28_plus * 28
                )::numeric / wt_agg.total_appointments,
                2
            )
        ELSE NULL
    END AS estimated_wait_time

FROM gp_practices_2025 AS g

LEFT JOIN postcodes_uk AS p ON p.postcode = g.postcode

LEFT JOIN (
    SELECT 
        practice_code,
        MAX(practice_name) AS practice_name, 
        SUM(CASE WHEN staff_group = 'Admin/Non-Clinical' THEN value ELSE 0 END) AS admin_non_clinical,
        SUM(CASE WHEN staff_group = 'Direct Patient Care' THEN value ELSE 0 END) AS direct_patient_care,
        SUM(CASE WHEN staff_group = 'GP' THEN value ELSE 0 END) AS gp,
        SUM(CASE WHEN staff_group = 'Nurses' THEN value ELSE 0 END) AS nurses
    FROM gp_staff
    GROUP BY practice_code
) AS staff_agg ON g.code = staff_agg.practice_code

LEFT JOIN (
    SELECT
        practice_code,
        SUM(wt_0) AS sum_wt_0,
        SUM(wt_1) AS sum_wt_1,
        SUM(wt_2_7) AS sum_wt_2_7,
        SUM(wt_8_14) AS sum_wt_8_14,
        SUM(wt_15_21) AS sum_wt_15_21,
        SUM(wt_22_28) AS sum_wt_22_28,
        SUM(wt_28_plus) AS sum_wt_28_plus,
        SUM(wt_0 + wt_1 + wt_2_7 + wt_8_14 + wt_15_21 + wt_22_28 + wt_28_plus) AS total_appointments
    FROM wait_times
    GROUP BY practice_code
) AS wt_agg ON g.code = wt_agg.practice_code

ORDER BY p.lad_code;