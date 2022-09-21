CREATE TABLE IF NOT EXISTS accounts(
  id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
  name varchar(255) COMMENT 'User Name',
  email varchar(255) COMMENT 'User Email',
  picture varchar(255) COMMENT 'User Picture'
) default charset utf8 COMMENT '';

CREATE TABLE IF NOT EXISTS stix(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  company VARCHAR(255) NOT NULL,
  binder VARCHAR(255) NOT NULL,
  filler VARCHAR(255) NOT NULL,
  wrapper VARCHAR(255) NOT NULL,
  price INT NOT NULL DEFAULT 0,
  img VARCHAR(255) NOT NULL,
  creatorId VARCHAR(255) NOT NULL,

  Foreign Key (creatorId) REFERENCES accounts(id)
  
) default charset utf8 COMMENT '';


ALTER TABLE stix
ADD COLUMN myReview VARCHAR(255) NOT NULL;


INSERT INTO stix
(name, company, binder, filler, wrapper, price, img, creatorId)
VALUES
('Umbagog', 'Dunbarton Tobaco and Trust', 'Nicaraguan', 'Nicaraguan', 'Broadleaf Connecticut', 12, 'https://www.oldvatobacco.com/wp-content/uploads/2019/10/Umbagog-Toro-Toro-Box-768x768.jpg', '62fa6842368b261972f93aa2');
INSERT INTO stix
(name, company, binder, filler, wrapper, price, img, creatorId, myReview)
VALUES
('Inner Circle', 'Cavalier', 'Honduras', 'US/Dominican/Hounduran/Nicaraguan', 'Nicaraguan', 14, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cigaraficionado.com%2Farticle%2Fcavalier-geneve-to-release-inner-circle&psig=AOvVaw10qkf0n4md3hPi-auD5eGx&ust=1663878061249000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLi4rPrapvoCFQAAAAAdAAAAABAD', '62fa6842368b261972f93aa2', 'Great smoke, plan on smoking many many more');

SELECT 
s.*,
a.*
FROM stix s
JOIN accounts a ON a.id = s.creatorId;

