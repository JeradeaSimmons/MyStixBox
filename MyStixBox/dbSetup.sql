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
('Inner Circle', 'Cavalier', 'Honduras', 'US/Dominican/Hounduran/Nicaraguan', 'Nicaraguan', 14, 'https://mshanken.imgix.net/cao/bolt/2022-07/cavalier-geneve-inner-circle-1-1600.jpg', '62fa6842368b261972f93aa2', 'Great smoke, plan on smoking many many more');
INSERT INTO stix
(name, company, binder, filler, wrapper, price, img, creatorId, myReview)
VALUES
('Tuxtla T110', 'Tatuaje', 'Nicaraguan', 'Nicaraguan', 'Sand Andres/Mexican', 12, 'https://cdn11.bigcommerce.com/s-2ooutu2zpl/images/stencil/900x900/products/44534/51971/TUX-01-100M__46299.1655847963.jpg?c=2', '62fa6842368b261972f93aa2', 'There seems to be a creamyness to this one. A go to for sure.');

SELECT 
s.*,
a.*
FROM stix s
JOIN accounts a ON a.id = s.creatorId;

