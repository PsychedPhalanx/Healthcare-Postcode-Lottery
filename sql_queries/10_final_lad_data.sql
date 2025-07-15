SELECT 
	l.lad_code,
	l.local_authority,
	r.region,
	ROUND(AVG(l.life_expectancy),2) AS life_expectancy,
	ROUND(AVG(p.population),0) AS population,
	ROUND((1 - (d.not_deprived)/100),3) AS deprived
FROM life_expectancy AS l
LEFT JOIN lad_population AS p
ON l.lad_code = p.code
LEFT JOIN local_authority_deprivation AS d
ON l.local_authority = d.local_authority
LEFT JOIN lad_to_region AS r
ON l.local_authority = r.local_authority
GROUP BY region, lad_code, l.local_authority, d.not_deprived
ORDER BY lad_code;