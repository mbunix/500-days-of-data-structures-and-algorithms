---You are given two tables, teams and matches, with the following structures:

--   create table teams (
--       team_id integer not null,
--       team_name varchar(30) not null,
--       unique(team_id)
--   );

--   create table matches (
--       match_id integer not null,
--       host_team integer not null,
--       guest_team integer not null,
--       host_goals integer not null,
--       guest_goals integer not null,
--       unique(match_id)
--   );
-- Each record in the table teams represents a single soccer team. Each record in the table matches represents a finished match between two teams. Teams (host_team, guest_team) are represented by their IDs in the teams table (team_id). No team plays a match against itself. You know the result of each match (that is, the number of goals scored by each team).

-- You would like to compute the total number of points each team has scored after all the matches described in the table. The scoring rules are as follows:

-- If a team wins a match (scores strictly more goals than the other team), it receives three points.
-- If a team draws a match (scores exactly the same number of goals as the opponent), it receives one point.
-- If a team loses a match (scores fewer goals than the opponent), it receives no points.
-- Write an SQL query that returns a ranking of all teams (team_id) described in the table teams. For each team you should provide its name and the number of points it received after all described matches (num_points). The table should be ordered by num_points (in decreasing order). In case of a tie, order the rows by team_id (in increasing order).

-- For example, for:

--   teams:

--    team_id | team_name
--   ---------+---------------
--    10      | Give
--    20      | Never
--    30      | You
--    40      | Up
--    50      | Gonna


--   matches:

--    match_id | host_team | guest_team | host_goals | guest_goals
--   ----------+-----------+------------+------------+-------------
--    1        | 30        | 20         | 1          | 0
--    2        | 10        | 20         | 1          | 2
--    3        | 20        | 50         | 2          | 2
--    4        | 10        | 30         | 1          | 0
--    5        | 30        | 50         | 0          | 1
-- your query should return:

--    team_id | team_name | num_points
--   ---------+-----------+------------
--    20      | Never     | 4
--    50      | Gonna     | 4
--    10      | Give      | 3
--    30      | You       | 3
--    40      | Up        | 0

WITH match_results AS (
  SELECT
    host_team AS team_id,
    host_goals AS goals_scored,
    guest_goals AS goals_conceded
  FROM matches
  UNION ALL
  SELECT
    guest_team AS team_id,
    guest_goals AS goals_scored,
    host_goals AS goals_conceded
  FROM matches
),
team_points AS (
  SELECT
    team_id,
    SUM(
      CASE
        WHEN goals_scored > goals_conceded THEN 3
        WHEN goals_scored = goals_conceded THEN 1
        ELSE 0
      END
    ) AS num_points
  FROM match_results
  GROUP BY team_id
)
SELECT
  t.team_id,
  t.team_name,
  COALESCE(tp.num_points, 0) AS num_points
FROM teams t
LEFT JOIN team_points tp ON t.team_id = tp.team_id
ORDER BY num_points DESC, t.team_id;
