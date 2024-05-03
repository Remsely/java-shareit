CREATE TABLE IF NOT EXISTS users
(
    id    BIGINT AUTO_INCREMENT PRIMARY KEY,
    name  VARCHAR(255)                    NOT NULL,
    email VARCHAR(512)                    NOT NULL,
    CONSTRAINT UQ_USER_EMAIL UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS requests
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(255)                         NOT NULL,
    requester_id BIGINT                               NOT NULL,
    FOREIGN KEY (requester_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS items
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(255)                         NOT NULL,
    description  VARCHAR(1000)                        NOT NULL,
    is_available BOOLEAN                              NOT NULL,
    owner_id     BIGINT                               NOT NULL,
    request_id   BIGINT,
    FOREIGN KEY (owner_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (request_id) REFERENCES requests (id)
);

CREATE TABLE IF NOT EXISTS bookings
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    start_date TIMESTAMP                               NOT NULL,
    end_date   TIMESTAMP                               NOT NULL,
    item_id    BIGINT                                  NOT NULL,
    booker_id  BIGINT                                  NOT NULL,
    status     VARCHAR(20)                             NOT NULL,
    FOREIGN KEY (item_id) REFERENCES items (id),
    FOREIGN KEY (booker_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS comments
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    text          VARCHAR(2000)                        NOT NULL,
    item_id       BIGINT                               NOT NULL,
    author_id     BIGINT                               NOT NULL,
    creation_date TIMESTAMP                            NOT NULL,
    FOREIGN KEY (item_id) REFERENCES items (id),
    FOREIGN KEY (author_id) REFERENCES users (id) ON DELETE CASCADE
);