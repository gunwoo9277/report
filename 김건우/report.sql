CREATE DATABASE IF NOT EXISTS boardDB;

USE boardDB;

CREATE TABLE IF NOT EXISTS posts (
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(255) NOT NULL,
content TEXT,
file_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS member(
 id VARCHAR(20) NOT NULL,
 passwd VARCHAR(20),
 name VARCHAR(30),
 PRIMARY KEY (id)
);

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

CREATE TABLE likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id)
);