
CREATE TABLE "Bolum"(
    "bolum_id" SERIAL,
    "bolum_ad" VARCHAR(40) ,
    CONSTRAINT "bolum_idPK" PRIMARY KEY("bolum_id")
);

CREATE Table "Ogrenci"(
    "ogrenci_no" SERIAL,
    "ogrenci_adi" VARCHAR(40) ,
    "ogrenci_soyadi" VARCHAR(40) ,
    "ogrenci_mail" VARCHAR(40) ,
    "bolum_id" INT,
    CONSTRAINT "ogrenci_noPK" PRIMARY KEY("ogrenci_no"),
    CONSTRAINT "bolum_idFK" FOREIGN KEY("bolum_id") REFERENCES "Bolum"("bolum_id")
);

CREATE TABLE "Ders"(
    "ders_kod" SERIAL,
    "ders_ad" VARCHAR(40) ,
    "teorik" INT ,
    "uygulama" INT ,
    "kredi" INT ,
    "donem" VARCHAR(40),
    "bolum_id" INT,
    CONSTRAINT "ders_kodPK" PRIMARY KEY("ders_kod"),
     CONSTRAINT "bolum_idFK" FOREIGN KEY("bolum_id") REFERENCES "Bolum"("bolum_id")
);


CREATE Table "DersKayit"(
    "derskayit_id" SERIAL,
    "ogrenci_no" INT,
    "ders_kod" INT,
    CONSTRAINT "derskayit_idPK" PRIMARY KEY("derskayit_id")
);



ALTER TABLE "DersKayit" ADD CONSTRAINT "DersKayitOgrenciFK" FOREIGN KEY("ogrenci_no") REFERENCES "Ogrenci"("ogrenci_no") ON DELETE NO ACTION ON UPDATE NO ACTION ;
ALTER TABLE "DersKayit" ADD CONSTRAINT "DersKayitDersFK" FOREIGN KEY("ders_kod") REFERENCES "Ders"("ders_kod") ON DELETE NO ACTION ON UPDATE NO ACTION ;
 
/*INSERT INTO "Ogrenci" ( "ogrenci_adi","ogrenci_soyadi","ogrenci_mail", "bolum_id" ) VALUES('Nil','KOCER','nbozer@gmail.com','1');*/
/*Bolumler olmadıgından bolum_ıd kısmı bos kalıyor. Daha sonradan ALTER ile dolduralacak. SERIAL olan da AUTO INCREMENT oldugundan kendi artar.*/
INSERT INTO "Ogrenci" ( "ogrenci_adi","ogrenci_soyadi","ogrenci_mail" ) VALUES('Nil','KOCER','nbozer@gmail.com');
INSERT INTO "Ogrenci" ( "ogrenci_adi","ogrenci_soyadi","ogrenci_mail" ) VALUES('Serdar','KOCER','serdarkocerr@gmail.com');
INSERT INTO "Ogrenci" ( "ogrenci_adi","ogrenci_soyadi","ogrenci_mail" ) VALUES('Buse','OZER','bozer@gmail.com');
INSERT INTO "Ogrenci" ( "ogrenci_adi","ogrenci_soyadi","ogrenci_mail" ) VALUES('Aynur','KOCER','aynurkocer@gmail.com');
INSERT INTO "Ogrenci" ( "ogrenci_adi","ogrenci_soyadi","ogrenci_mail" ) VALUES('Fatih','KOCATAS','fk@sakarya.edu.tr');

/*Bolumler insert edildi.*/
INSert INTO "Bolum"("bolum_ad" ) VALUES('Bilgisayar Müh.');
INSert INTO "Bolum"("bolum_ad" ) VALUES('Elektronik Müh.');
INSert INTO "Bolum"("bolum_ad" ) VALUES('Guzel Sanatlar');
INSert INTO "Bolum"("bolum_ad" ) VALUES('Muhasebe');

/*Dersler insert edildi.*/
INSert INTO "Ders"("ders_ad","teorik","uygulama", "kredi","donem" ) VALUES('IOT','6','7','6','1');
INSert INTO "Ders"("ders_ad","teorik","uygulama", "kredi","donem" ) VALUES('Elektronik','8','5','5','1');
INSert INTO "Ders"("ders_ad","teorik","uygulama", "kredi","donem" ) VALUES('Resim','2','11','3','5');
INSert INTO "Ders"("ders_ad","teorik","uygulama", "kredi","donem" ) VALUES('MuhasebeProgramlari','6','7','4','1');
INSert INTO "Ders"("ders_ad","teorik","uygulama", "kredi","donem" ) VALUES('AnalogHaberlesme','8','5','4','1');

/*Ders Kayit insert edildi.*/
INSERT INTO "DersKayit" ("ogrenci_no") SELECT "ogrenci_no" FROM "Ogrenci" WHERE ogrenci_adi = 'Nil';
UPDATE "DersKayit" SET "ders_kod"=(SELECT "ders_kod"  FROM "Ders" WHERE ders_ad='IOT') WHERE ogrenci_no = (SELECT "ogrenci_no" FROM "Ogrenci" WHERE ogrenci_adi = 'Nil') ;

INSERT INTO "DersKayit" ("ogrenci_no") SELECT "ogrenci_no" FROM "Ogrenci" WHERE ogrenci_adi = 'Serdar';
UPDATE "DersKayit" SET "ders_kod"=(SELECT "ders_kod"  FROM "Ders" WHERE ders_ad='Elektronik') WHERE ogrenci_no = (SELECT "ogrenci_no" FROM "Ogrenci" WHERE ogrenci_adi = 'Serdar') ;

/*Ogrenci tablosunda bolum_id'ler  update edildi.*/
/* Update "Ogrenci" SET "bolum_id" = NULL;*/
Update "Ogrenci" SET "bolum_id" = (SELECT "bolum_id" FROM "Bolum" WHERE bolum_ad LIKE 'Bilgis%') WHERE ogrenci_adi = (SELECT "ogrenci_adi" FROM "Ogrenci" WHERE ogrenci_mail LIKE 'nbozer%');
Update "Ogrenci" SET "bolum_id" = (SELECT "bolum_id" FROM "Bolum" WHERE bolum_ad LIKE '%lektronik%') WHERE ogrenci_adi = (SELECT "ogrenci_adi" FROM "Ogrenci" WHERE ogrenci_mail LIKE '_erdarkocer%');

/*Ders tablosunda bolum_id'ler  update edildi.*/
UPDATE "Ders" SET "bolum_id" = '1' WHERE ders_ad='IOT';
UPDATE "Ders" SET "bolum_id" = '2' WHERE ders_ad LIKE '%lektronik%';
 UPDATE "Ders" SET "bolum_id" = '2' WHERE ders_ad LIKE 'AnalogHaberlesme';



INSERT INTO "Ogrenci" ( "ogrenci_adi","ogrenci_soyadi","ogrenci_mail" ) VALUES('Hakan','KOCER','hk@gmail.com');
INSert INTO "Ders"("ders_ad","teorik","uygulama", "kredi","donem" ) VALUES('MezunDersi','100','100','185','2');
INSERT INTO "DersKayit" ("ogrenci_no") SELECT "ogrenci_no" FROM "Ogrenci" WHERE ogrenci_adi = 'Hakan';

UPDATE "DersKayit" SET "ders_kod"=(SELECT "ders_kod"  FROM "Ders" WHERE ders_ad='MezunDersi') WHERE ogrenci_no = (SELECT "ogrenci_no" FROM "Ogrenci" WHERE ogrenci_adi = 'Hakan') ;
Update "Ogrenci" SET "bolum_id" = (SELECT "bolum_id" FROM "Bolum" WHERE bolum_ad LIKE 'Elekt%') WHERE ogrenci_adi = (SELECT "ogrenci_adi" FROM "Ogrenci" WHERE ogrenci_mail LIKE 'hk%');
UPDATE "Ders" SET "bolum_id" = '2' WHERE ders_ad='MezunDersi';



INSERT INTO "DersKayit" ("ogrenci_no") SELECT "ogrenci_no" FROM "Ogrenci" WHERE ogrenci_adi = 'Hakan';
UPDATE "DersKayit" SET "ders_kod"=(SELECT "ders_kod"  FROM "Ders" WHERE ders_ad='AnalogHaberlesme') WHERE derskayit_id='4'; 



/*ODEV Soruları*/
/*Soru 1: Öğrenciler arasında hiçbir derse kayıt olmayanların olup olmadığını listeleyen SQL ifadesini yazınız. */
/*Left outer join'de left tablo sabit tutulur, join olan tablo ek olarak gelir. Join olan tablonun, sabit tablo ile arasındaki uyumsuzluklara NULL gelir. (join olan tablonun her elemanı sabit tabloda karşılığı vardır.)*/

SELECT * FROM "Ogrenci" LEFT OUTER JOIN "DersKayit" ON  "Ogrenci"."ogrenci_no" = "DersKayit"."ogrenci_no" WHERE "DersKayit"."ogrenci_no" IS NULL;

/*Soru 2: Öğrencilerin ad, soyad verileri ile aldıkları derslerin adı, teorik, uygulama ve kredi verilerini gösteren SQL ifadesini yazınız. */

SELECT "Ogrenci"."ogrenci_adi","Ogrenci"."ogrenci_soyadi","Ders"."ders_ad","Ders"."teorik","Ders"."uygulama","Ders"."kredi" FROM "Ogrenci" 
INNER JOIN "DersKayit" ON "Ogrenci"."ogrenci_no"="DersKayit"."ogrenci_no" 
INNER JOIN  "Ders" ON "DersKayit"."ders_kod"= "Ders"."ders_kod";

/*Soru 3: Öğrencilerin bir bölümden mezun olabilmeleri için en az 180 kredilik ders almaları gerekmektedir. Mezun olabilecek öğrencilerin numara, ad, soyad ve aldıkları derslerin toplam kredisini gösteren SQL ifadesini yazınız. */
/*AS "sonucTablosu" ile join , select distinc vs yapılan islemlerin sonucuda bir tablo oldugundan ismi "sonucTablosu" olarak adlandırıldı.
over (partition by column) ifadesi kredilerin toplanmasını ve ogrenci no'su aynı olan row'lara toplamKredi kolununa aynı ifadeyi yazmasını saglar.*/
/*DISTINCT  ile ise aynı row'un duplicate olmaması saglanır.*/

SELECT * FROM 
(SELECT DISTINCT "Ogrenci"."ogrenci_no","Ogrenci"."ogrenci_adi","Ogrenci"."ogrenci_soyadi", SUM("Ders"."kredi") over (partition by "Ogrenci"."ogrenci_no") AS ToplamKredi FROM "Ogrenci" 
INNER JOIN "DersKayit" ON "Ogrenci"."ogrenci_no"="DersKayit"."ogrenci_no" 
INNER JOIN  "Ders" ON "DersKayit"."ders_kod"= "Ders"."ders_kod" ) AS "sonucTablosu" 
WHERE ToplamKredi>=180;

/*Soru 4: Her bir bölümde okuyan öğrenci sayısını hesaplayan ve listeleyen SQL ifadesini yazınız. */

SELECT "Bolum"."bolum_ad", COUNT("Ogrenci"."ogrenci_no") AS ogrenciSayisi FROM "Bolum" INNER JOIN "Ogrenci" ON "Ogrenci"."bolum_id"="Bolum"."bolum_id" GROUP BY ("Bolum"."bolum_ad");

/*Soru 5: Elektronik Müh. bölümünde okuyan öğrencilerin aldıkları derslerin adını, dersin teorik ve uygulama verilerinin toplamından oluşan haftalık saatini ve kredisini gösteren SQL ifadesini yazınız. Dersler yalnızca bir kere listelenecektir. */

SELECT "Ders"."ders_ad" ,"Ders"."kredi" ,SUM ("Ders"."teorik"+"Ders"."uygulama") AS TeorikUygulamaToplam FROM "Ders" 
INNER JOIN "Bolum" ON "Bolum"."bolum_id"= "Ders"."bolum_id" WHERE "Bolum"."bolum_ad" = 'Elektronik Müh.'  
GROUP BY ("Ders"."ders_ad" ,"Ders"."kredi" );


/*Soru 6: Her bölümde okutulan toplam ders sayısını veren SQL ifadesini yazınız. */

SELECT "Bolum"."bolum_ad", COUNT("Ders"."ders_kod") AS DersSayisi FROM "Bolum"
INNER JOIN "Ders" ON "Bolum"."bolum_id" = "Ders"."bolum_id" GROUP BY("Bolum"."bolum_ad");

/*Soru 7: 5. (beşinci) dönemde okutulan derslerin Bölüm adı ve adını listeleyen SQL ifadesini yazınız. */

SELECT "Ders"."ders_ad","Bolum"."bolum_ad" FROM "Ders" 
INNER JOIN "Bolum" ON "Ders"."bolum_id" = "Bolum"."bolum_id"
WHERE "Ders"."donem"='5';

/*Soru 8: . Öğrenciler arasında okul tarafından verilmiş olan edu.tr uzantılı e-posta adresini kullanmayanların ad, soyad ve bölüm bilgilerini listeleyen SQL ifadesini yazınız. */

SELECT "Ogrenci"."ogrenci_adi","Ogrenci"."ogrenci_soyadi","Bolum"."bolum_ad" FROM "Ogrenci"
LEFT OUTER JOIN "Bolum" ON "Ogrenci"."bolum_id"="Bolum"."bolum_id"  
WHERE "Ogrenci"."ogrenci_mail" NOT LIKE  '%edu.tr' ;

/*Soru 9: Her bir bölümde her bir dönemde verilmekte olan derslerin toplam kredilerini hesaplayan SQL ifadesini yazınız. */

SELECT "Bolum"."bolum_ad","Ders"."donem", SUM("Ders"."kredi") AS donemdekiToplamDersKredisi FROM "Bolum"
INNER JOIN "Ders" ON "Bolum"."bolum_id"="Ders"."bolum_id" GROUP BY("Bolum"."bolum_ad","Ders"."donem" ) ORDER BY  "Bolum"."bolum_ad" ASC;
