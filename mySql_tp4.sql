CREATE TABLE ETUDE(
    code VARCHAR2(20) PRIMARY KEY,
    nom VARCHAR2(20)
);

INSERT INTO ETUDE(code,nom)
VALUES
('A1','ERIC');

INSERT INTO ETUDE(code,nom)
VALUES
('B1','NARITA');

INSERT INTO ETUDE(code,nom)
VALUES
('C1','ANAS');

SET SERVEROUTPUT ON;
DECLARE
v_code ETUDE.code%TYPE;
v_nom ETUDE.nom%TYPE;
    CURSOR mycursor IS
    SELECT code,nom
    FROM ETUDE;

BEGIN
    OPEN mycursor;
    FETCH mycursor INTO v_code,v_nom;
    DBMS_OUTPUT.PUT_LINE('code : '||v_code||' nom : '||v_nom);
    CLOSE mycursor;
END;

SET SERVEROUTPUT ON;
DECLARE
v_ETUDE ETUDE%ROWTYPE;

    CURSOR mycursor IS
    SELECT *
    FROM ETUDE;

BEGIN
    OPEN mycursor;
    FETCH mycursor INTO v_ETUDE;
    DBMS_OUTPUT.PUT_LINE('code : '||v_etude.code||' nom : '||v_etude.nom);
    CLOSE mycursor;
END;



SET SERVEROUTPUT ON;
DECLARE
v_ETUDE ETUDE%ROWTYPE;

    CURSOR mycursor IS
    SELECT *
    FROM ETUDE;

BEGIN
    OPEN mycursor;
    FETCH mycursor INTO v_ETUDE;
    while mycursor%FOUND
        loop
        DBMS_OUTPUT.PUT_LINE('code : '||v_etude.code||' nom : '||v_etude.nom);
        FETCH mycursor INTO v_ETUDE;  
        if(mycursor%NOTFOUND)then
        DBMS_OUTPUT.PUT_LINE('Not found');
        end if;
        end loop;
    CLOSE mycursor;
END;




SET SERVEROUTPUT ON;
DECLARE
v_ETUDE ETUDE%ROWTYPE;

    CURSOR mycursor IS
    SELECT *
    FROM ETUDE;

BEGIN
    for v_ETUDE in mycursor
        loop
        DBMS_OUTPUT.PUT_LINE('code : '||v_etude.code||' nom : '||v_etude.nom);
        end loop;
END;



CREATE TABLE PRODUIT(
    id VARCHAR2(20) PRIMARY KEY,
    nomProduit VARCHAR2(20),
    prix FLOAT
);

INSERT INTO PRODUIT(id,nomProduit,prix)
VALUES
('PROD01','savon',1.3);

INSERT INTO PRODUIT(id,nomProduit,prix)
VALUES
('PROD02','parfum',90);

INSERT INTO PRODUIT(id,nomProduit,prix)
VALUES
('PROD03','cafe',2.3);

INSERT INTO PRODUIT(id,nomProduit,prix)
VALUES
('PROD04','biscuit',1.3);






SET SERVEROUTPUT ON;
DECLARE
v_PRODUIT PRODUIT%ROWTYPE;

    CURSOR mycursor IS
    SELECT id, nomProduit, prix 
    FROM produit 
    WHERE nomProduit='savon'
--    WHERE nomProduit='cafe'
--    WHERE nomProduit='parfum'
--    WHERE nomProduit='biscuit'
    FOR UPDATE OF prix;
    

BEGIN
    OPEN mycursor;
        loop
        FETCH mycursor INTO v_PRODUIT; 
        DBMS_OUTPUT.PUT_LINE('prix : '||v_PRODUIT.prix); 
      
        UPDATE produit
        SET prix = prix * 1.1;
        --le prix sleon le nomProduit.
--        WHERE CURRENT OF mycursor;
        
        exit when mycursor%NOTFOUND;
        end loop;
    CLOSE mycursor;
END;






