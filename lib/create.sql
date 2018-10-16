CREATE TABLE projects (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  category VARCHAR(255),
  funding_goal INTEGER,
  start_date VARCHAR(255),
  end_date VARCHAR(255)
);

-- - A project has a title, a category, a funding goal, a start date, and an end date.

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER
);
-- - A user has a name and an age



CREATE TABLE pledges (
  id INTEGER PRIMARY KEY,
  amount INTEGER,
  user_id INTEGER,
  project_id INTEGER,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(project_id) REFERENCES projects(id)
);
-- - A pledge has an amount. It belongs to a user, and it also belongs to a project.
