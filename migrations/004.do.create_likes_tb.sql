CREATE TABLE likes_tb (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INTEGER REFERENCES users_tb(id) ON DELETE CASCADE NOT NULL,
    post_id INTEGER REFERENCES posts_tb(id) ON DELETE CASCADE NOT NULL
);


