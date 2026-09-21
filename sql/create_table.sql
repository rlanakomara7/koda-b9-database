--EVENTHUB DATABASE---

CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);
SELECT*FROM roles;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    role_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    avatar VARCHAR(255),
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (role_id) REFERENCES roles(role_id)
); 
SELECT*FROM users;

CREATE TABLE organizers (
    organizer_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    organization_name VARCHAR(100) NOT NULL,
    description TEXT,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
SELECT*FROM organizers;

CREATE TABLE event_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
)
SELECT*FROM event_categories;

CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    organizer_id INT NOT NULL,
    category_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    event_date DATE,
    event_time TIME,
    location VARCHAR(150),
    capacity INT,
    image VARCHAR(255),
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id),
    FOREIGN KEY (category_id) REFERENCES event_categories(category_id)
);
SELECT*FROM events;

CREATE TABLE event_members (
    event_member_id SERIAL PRIMARY KEY,
    event_id INT,
    user_id INT,
    status VARCHAR(20),
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);
SELECT*FROM event_members;

CREATE TABLE community_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE communities (
    community_id SERIAL PRIMARY KEY,
    creator_id INT NOT NULL,
    category_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(150),
    image VARCHAR(255),

    FOREIGN KEY (creator_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES community_categories(category_id)

);

CREATE TABLE community_members (
    member_id SERIAL PRIMARY KEY,
    community_id INT NOT NULL,
    user_id INT NOT NULL,
    role VARCHAR(50),
    status VARCHAR(20),

    FOREIGN KEY (community_id) REFERENCES communities(community_id),
    FOREIGN KEY (user_id)REFERENCES users(user_id)

);


CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    message TEXT,
    rating INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id)

);

CREATE TABLE notifications (
    notification_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(150),
    message TEXT,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(user_id)

);