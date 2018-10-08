SELECT
CASE 
      WHEN avg(polarity) < .1 THEN 'Negative'
      WHEN avg(polarity) >= .1 AND avg(polarity) < .5 THEN 'Neutral'
      WHEN avg(polarity) >= .5 THEN 'Positive'
      END as sentiment,
superbowlTeams,
COUNT(1) as tweets_count, round(avg(polarity),2) as polarity, round(avg(magnitude), 2) as magnitude
FROM (
  SELECT
    CASE
      WHEN text LIKE '%@Eagles%'   OR text LIKE '%@philly%' OR text LIKE '%@Philly%' THEN 'Eagles'
      WHEN text LIKE '%@Patriots%'  OR text LIKE '%@patriots%' OR text LIKE '%@Pats%' THEN 'Patriots'
    END as superbowlTeams,magnitude, polarity
    FROM
    superbowl_tweets.tweets_sentiment) as subQuery
   WHERE superbowlTeams IS NOT NULL
   GROUP BY
   superbowlTeams
   ORDER BY tweets_count DESC
    
