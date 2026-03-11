BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "path" (
	"id"	INTEGER,
	"pcode"	TEXT,
	"subpcode"	TEXT,
	"ecode"	TEXT,
	PRIMARY KEY("id")
);
INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (1,'P3','P1','P1P3');
INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (2,'P19','P3','P3P19');
INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (3,'P6','P19','P6P19');
INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (4,'P2','P3','P2P3');
INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (5,'P8','P3','P3P8');
INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (6,'P9','P3','P3P9');
INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (7,'P7','P6','P6P7');
INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (8,'P6','P4','P4P6');
INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (9,'P4','P1','P1P4');
COMMIT;
