BEGIN;

TRUNCATE
    likes_tb,
    comments_tb,
    posts_tb,
    users_tb
    RESTART IDENTITY CASCADE;

-- CREATE TABLE users_tb (
--     id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
--     first_name TEXT NOT NULL,
--     last_name TEXT NOT NULL,
--     user_name TEXT NOT NULL UNIQUE,
--     password TEXT NOT NULL,
--     date_created TIMESTAMPTZ NOT NULL DEFAULT now(),
--     date_modified TIMESTAMPTZ,
--     profile_image_url TEXT,
--     bg_image_url TEXT,
--     user_bio TEXT,
-- );

INSERT INTO users_tb (first_name, last_name, user_name, password, profile_image_url, bg_image_url, user_bio)
VALUES
    (
        'Steve', 
        'Cioccolanti', 
        'cioccolanti', 
        '$2a$12$qXPyWzMaEHendl0y.ARQQuNa0zx5ZlzrzgwlAGZjdNCV5a1fTtczK',
        'https://i.imgur.com/1TFqjAS.jpg',
        'https://i.imgur.com/nYN45VB.jpg',
        'Hello world, I''m Pastor Steve!'
    ),
    (
        'Christine',
        'Caine',
        'ccaine',
        '$2a$12$qXPyWzMaEHendl0y.ARQQuNa0zx5ZlzrzgwlAGZjdNCV5a1fTtczK',
        'https://i.imgur.com/9vln7v6.jpg',
        null,
        null
    ),
    (
        'Eitan',
        'Bar',
        'ebar1',
        '$2a$12$qXPyWzMaEHendl0y.ARQQuNa0zx5ZlzrzgwlAGZjdNCV5a1fTtczK',
        'https://i.imgur.com/9vln7v6.jpg',
        null,
        null
    );

-- CREATE TABLE posts_tb (
--     id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
--     message TEXT NOT NULL,
--     date_created TIMESTAMPTZ NOT NULL DEFAULT now(),
--     share_url TEXT,
--     user_id INTEGER REFERENCES users_tb(id) ON DELETE CASCADE NOT NULL
-- );

INSERT INTO posts_tb (message, share_url, user_id)
VALUES
    (
        'If my interpretation of the Bible is correct, there will be a new strain of coronavirus named something like chrysoscoronavirus or Covidaurum. A lot of times the Bible plays on words that become common or clear later. Like chloroquine is a play on chloros + equine = green horse.',
        null,
        1
    ),
    (
        'Sitting with friends watching a stunning SoCal sunset is good for my soul.',
        'https://i.imgur.com/VArOc1b.jpg',
        2
    ),
    (
        'You must have a capacity to receive, or even omnipotence can''t give. -C.S. Lewis',
        null,
        1
    ),
    (
        'Check out our facebook page at https://www.facebook.com/oneforIsrael/',
        null,
        3
    ),
    (
        'Quantum Theory is the closest thing to secular minds catching up to the Bible. The duality of light as particle & wave (the God-Man Jesus). Quantum nonlocality (Omnipresence). Action at a distance or instantaneous affect of one particle on another regardless of distance (Prayer).',
        null,
        1
    );

-- CREATE TABLE comments_tb (
--     id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
--     user_id INTEGER REFERENCES users_tb(id) ON DELETE CASCADE NOT NULL,
--     post_id INTEGER REFERENCES posts_tb(id) ON DELETE CASCADE NOT NULL,
--     comment TEXT NOT NULL,
--     date_created TIMESTAMPTZ NOT NULL DEFAULT now()
-- );


INSERT INTO comments_tb (user_id, post_id, comment)
VALUES
    (
        1,
        2,
        'Beautiful!'
    );

-- CREATE TABLE likes_tb (
--     id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
--     user_id INTEGER REFERENCES users_tb(id) ON DELETE CASCADE NOT NULL,
--     post_id INTEGER REFERENCES posts_tb(id) ON DELETE CASCADE NOT NULL,
-- );

INSERT INTO likes_tb (user_id, post_id)
VALUES
    (
        2,
        3
    );


COMMIT;