WITH balances as(
    SELECT b.user_id, b.type, b.currency_id, SUM(b.money) as volume  FROM balance b
    GROUP BY b.user_id, b.type, b.currency_id
),
 curr AS (SELECT c.id, name, rate_to_usd
             FROM currency c
                      JOIN (SELECT id, max(updated) AS updated
                            FROM currency
                            GROUP BY id) AS temp
                           ON c.updated = temp.updated AND c.id = temp.id)
         
     SELECT  COALESCE(u.name, 'not defined')AS name,  COALESCE(u.lastname, 'not defined')     AS lastname, balances.type,
	balances.volume, COALESCE(c.name, 'not defined') AS currency_name,
	coalesce(c.rate_to_usd, 1)            AS last_rate_to_usd,
	 (volume * coalesce(c.rate_to_usd, 1)) AS total_volume_in_usd
		 FROM public.user as u
    FULL JOIN balances on u.id = balances.user_id
    LEFT JOIN curr c on balances.currency_id = c.id
    ORDER BY name DESC, lastname, currency_name;
