# CREATE TABLE  projects (
#   id INTEGER PRIMARY KEY,
#   title TEXT,
#   category TEXT,
#   funding_goal REAL,
#   start_date TEXT,
#   end_date TEXT
# );
#
# CREATE TABLE users (
#   id INTEGER PRIMARY KEY,
#   name TEXT,
#   age INTEGER
# );
#
# CREATE TABLE pledges (
#   id INTEGER PRIMARY KEY,
#   amount FLOAT,
#   user_id INTEGER,
#   project_id INTEGER
# );

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
  <<-SQL
  SELECT projects.title, sum(pledges.amount) FROM pledges
  JOIN projects ON projects.id = pledges.project_id
  GROUP BY(title);
  SQL
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  <<-SQL
  SELECT users.name, users.age, sum(pledges.amount) FROM users -- When coming from one table (users) we must join with another table(pledges).
  JOIN pledges  ON pledges.user_id = users.id
  GROUP BY (users.name);
  SQL
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  <<-SQL
  SELECT projects.title,  (sum(pledges.amount )- projects.funding_goal)
  AS amount_left
  FROM projects
  JOIN pledges ON projects.id = pledges.project_id
  GROUP BY  projects.title
  HAVING amount_left >=0;
  SQL
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
  <<-SQL
  SELECT users.name, sum(pledges.amount) as total_amount FROM users
  JOIN pledges on pledges.user_id = users.id
  GROUP BY users.name
  ORDER BY total_amount ASC;
  SQL
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
<<-SQL
SELECT projects.category, pledges.amount
FROM projects
JOIN pledges ON pledges.project_id = projects.id
WHERE projects.category = "music";
SQL
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  <<-SQL
  SELECT projects.category, SUM(pledges.amount)
  FROM projects
  JOIN pledges ON pledges.project_id = projects.id
  GROUP BY (projects.category)
  HAVING projects.category = 'books';
  SQL
end
