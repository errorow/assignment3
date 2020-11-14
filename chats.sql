CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    userid VARCHAR(16) NOT NULL,
    pw VARCHAR(16) NOT NULL,
    name VARCHAR(16) NOT NULL,
    link VARCHAR(100) NOT NULL,
    message VARCHAR(50) NOT NULL,
    membership TINYINT NOT NULL DEFAULT 0,
    date VARCHAR(8) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE channels (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    user INT NOT NULL,
    link VARCHAR(100) NOT NULL,
    maxnum INT NOT NULL,
    membership TINYINT NOT NULL DEFAULT 0,
    date VARCHAR(14) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (user)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chats (
    message VARCHAR(500) NOT NULL,
    writer INT NOT NULL,
    channel INT NOT NULL,
    date VARCHAR(14) NOT NULL,
    FOREIGN KEY(writer)
    REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(channel)
    REFERENCES channels(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE follows (
    follower INT NOT NULL,
    followee INT NOT NULL,
    date VARCHAR(14) NOT NULL,
    FOREIGN KEY (follower)
    REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (followee)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE blocks (
    block INT NOT NULL,
    blocked INT NOT NULL,
    date VARCHAR(14) NOT NULL,
    FOREIGN KEY (block)
    REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (blocked)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;