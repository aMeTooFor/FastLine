BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "path" (
	"id"	INTEGER,
	"pcode"	TEXT,
	"subpcode"	TEXT,
	"ecode"	TEXT,
	PRIMARY KEY("id")
);
INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (1,'P3','P1','P1P3'),
 (2,'P19','P3','P3P19'),
 (3,'P6','P19','P6P19'),
 (4,'P2','P3','P2P3'),
 (5,'P8','P3','P3P8'),
 (6,'P9','P3','P3P9'),
 (7,'P7','P6','P6P7');
COMMIT;
