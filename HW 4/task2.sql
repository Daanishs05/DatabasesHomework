INSERT INTO petPet (petname, owner, species, gender, birth)
VALUES ('Fluffy', 'Harold', 'cat', 'F', '1993-02-04');

INSERT INTO petPet (petname, owner, species, gender, birth)
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30');

INSERT INTO petPet (petname, owner, species, gender, birth)
VALUES ('Claws', 'Gwen', 'cat', 'M', '1994-03-17');

INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES ('Puffball', 'Diane', 'hamster', 'F', '1999-03-30', '2020-09-01');

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'injury', 'broke rib');


DELETE FROM petPet
WHERE petname = 'Buffy' AND owner = 'Harold';
