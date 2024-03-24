WITH formula_and_avg AS (SELECT p.address,
ROUND(max(age::numeric) - (min(age::numeric) / max(age::numeric)),2) formula,
ROUND(AVG(p.age),2) average
FROM person p
GROUP BY 1
)
SELECT fa.address , fa.formula, fa.average ,fa.formula > fa.average AS comparison
FROM formula_and_avg fa
ORDER BY 1