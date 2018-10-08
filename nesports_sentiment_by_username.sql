SELECT concat(text, "----", user.screen_name) as concat, created_at as date, 
CASE 
      WHEN avg(polarity) < .1 THEN 'Negative'
      WHEN avg(polarity) >= .1 AND avg(polarity) < .5 THEN 'Neutral'
      WHEN avg(polarity) >= .5 THEN 'Positive'
      END as sentiment,
FROM [p2f-prod:twitter_stream_nesports.tweets_sentiment]
WHERE user.screen_name = "Jonny_swamp"
GROUP BY concat, date
ORDER BY date desc
LIMIT 5
