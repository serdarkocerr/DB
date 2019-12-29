CREATE TABLE "Kullanici"(
    "kullaniciNo" SERIAL,
    "ad" VARCHAR(40) NOT NULL,
    "soyad" VARCHAR(40) NOT NULL,
    "uyelikTarihi" DATE DEFAULT '2019-01-01',
    "sonGirisTarihi" DATE DEFAULT '2019-01-01',
    "kisiselPuan" INTEGER,
    "profilResmi" bytea,
    "iletisimNo" INTEGER,
    CONSTRAINT "kullaniciNoPK" PRIMARY KEY("kullaniciNo")
);

CREATE TABLE "IletisimBilgileri"(
    "iletisimNo" SERIAL,
    "email" VARCHAR(40) NOT NULL,
    "kullaniciNo" INTEGER,
    "ulke" INTEGER,
    "il" INTEGER,
    CONSTRAINT "iletisimNoPK" PRIMARY KEY("iletisimNo")
);

CREATE TABLE "Ulke"(
    "ulkeNo" SERIAL,
    "ulkeAdi" VARCHAR(40) NOT NULL,
    CONSTRAINT "ulkeNoPK" PRIMARY KEY("ulkeNo")
);

CREATE TABLE Il(
 "ilNo" SERIAL,
 "ilAdi" VARCHAR(40),
  "ulke" INTEGER,
 CONSTRAINT "ilNoPK" PRIMARY KEY("ilNo")
);

CREATE TABLE Ilce(
    "ilceNo" SERIAL,
    "ilceAdi" VARCHAR(40),
    "il" INTEGER,
     CONSTRAINT "ilceNoPK" PRIMARY KEY("ilceNo")
);

CREATE TABLE Favori(
    "favoriNo" SERIAL,
    "favoriAdi" VARCHAR(40),
    "soruNo" INTEGER,
    "cevapNo" INTEGER,
    CONSTRAINT "favoriNoPK" PRIMARY KEY("favoriNo")  
);

CREATE TABLE  KullaniciFavori(
    "kullanici" INTEGER,
    "favori" INTEGER,
    CONSTRAINT "kullaniciFavoriPK" PRIMARY KEY("kullanici", "favori")
);

CREATE TABLE KullaniciEtiket(
    "kullaniciNo" INT,
    "etiketNo" INT,
     CONSTRAINT "kullaniciEtiketPK" PRIMARY KEY("kullaniciNo", "etiketNo")
);

CREATE TABLE Oy(
    "oyNo" SERIAL,
    "soru" INTEGER,
    "cevap" INTEGER,
    CONSTRAINT "oyNoPK" PRIMARY KEY("oyNo")      
);

CREATE TABLE SoruEtiket(
    "soru" INT,
    "etiket" INT,
    "toplamSoru" INT,
    CONSTRAINT "soruEtiketPK" PRIMARY KEY("soru", "etiket")

);

CREATE TABLE Etiket(
    "etiketNo" SERIAL,
    "etiketAdi" VARCHAR(40),
    CONSTRAINT "etiketNoPK" PRIMARY KEY("etiketNo")      
);

CREATE TABLE Rozet(
    "rozetNo" SERIAL,
    "rozetTuru" VARCHAR(40),
    CONSTRAINT "rozetNoPK" PRIMARY KEY("rozetNo") 
);

CREATE TABLE KullaniciRozet(
    "kullaniciNo" INT,
    "rozetNo" INT,
    CONSTRAINT "kullaniciRozetPK" PRIMARY KEY("kullaniciNo", "rozetNo")

);

CREATE TABLE Mesaj(
    "mesajNo" SERIAL,
    "baslik" VARCHAR(40),
    "oySayisi" INT,
    "goruntulenmeSayisi" INT,
    "mesajIcerik" VARCHAR(200),
    "mesajTipi" VARCHAR(40),
    CONSTRAINT "mesajNoPK" PRIMARY KEY("mesajNo") 
    
);

CREATE TABLE Soru(
    "mesajNo" INT,
    "tarih" DATE,
    "kullanici" INTEGER,
    CONSTRAINT "soruPK" PRIMARY KEY ("mesajNo")
    
);

CREATE TABLE Cevap(
    "mesajNo" INT,
    "zaman" DATE,
    "kullanici" INTEGER,
    "soru" INTEGER,
    CONSTRAINT "cevapPK" PRIMARY KEY ("mesajNo")
);


ALTER TABLE "Kullanici" ADD CONSTRAINT "KullaniciIletisimBilgileriFK" FOREIGN KEY("iletisimNo") REFERENCES "IletisimBilgileri"("iletisimNo") ON DELETE NO ACTION ON UPDATE NO ACTION ;

ALTER TABLE "IletisimBilgileri" ADD CONSTRAINT "IletisimBilgileriKullaniciFK" FOREIGN KEY("kullaniciNo") REFERENCES "Kullanici"("kullaniciNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "IletisimBilgileri" ADD CONSTRAINT "IletisimBilgileriUlkeFK" FOREIGN KEY("ulke") REFERENCES "Ulke"("ulkeNo") ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE "IletisimBilgileri" ADD CONSTRAINT "IletisimBilgileriIlFK" FOREIGN KEY("il") REFERENCES "il"("ilNo")ON DELETE NO ACTION ON UPDATE NO ACTION;



ALTER TABLE "il" ADD CONSTRAINT "ilUlkeFK" FOREIGN KEY("ulke") REFERENCES "Ulke"("ulkeNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

Alter table  "ilce"  ADD CONSTRAINT "ilceIlFK" FOREIGN KEY("il") REFERENCES "il"("ilNo") ON DELETE NO ACTION ON UPDATE NO ACTION;


ALter TAble "soru" ADD CONSTRAINT "SoruMesajFK" FOREIGN KEY("mesajNo") REFERENCES "mesaj"("mesajNo") ON DELETE CASCADE ON UPDATE CASCADE;

ALter TAble "cevap" ADD CONSTRAINT "CevapMesajFK" FOREIGN KEY("mesajNo") REFERENCES "mesaj"("mesajNo") ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE "favori" ADD CONSTRAINT "FavoriSoruFK" FOREIGN KEY("soruNo") REFERENCES "soru"("mesajNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "favori" ADD CONSTRAINT "FavoriCevapFK" FOREIGN KEY("cevapNo") REFERENCES "cevap"("mesajNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "kullanicifavori" ADD CONSTRAINT "KullaniciFavoriKullaniciFK" FOREIGN KEY("kullanici") REFERENCES "Kullanici"("kullaniciNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "kullanicifavori" ADD CONSTRAINT "KullaniciFavoriFavoriFK" FOREIGN KEY("favori") REFERENCES "favori"("favoriNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table "kullanicietiket" add CONSTRAINT "KullaniciEtiketKullaniciFK" FOREIGN KEY("kullaniciNo") REFERENCES "Kullanici"("kullaniciNo")ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table "kullanicietiket" add CONSTRAINT "KullaniciEtiketEtiketFK" FOREIGN KEY("etiketNo") REFERENCES "etiket"("etiketNo")ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table "oy" add CONSTRAINT "OySoruFK" FOREIGN KEY("soru") REFERENCES "soru"("mesajNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table "oy" add CONSTRAINT "OyCevapFK" FOREIGN KEY("cevap") REFERENCES "cevap"("mesajNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table "soruetiket" add CONSTRAINT "SoruEtiketSoruFK" FOREIGN KEY("soru")REFERENCES "soru"("mesajNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table "soruetiket" add CONSTRAINT "SoruEtiketEtiketFK" FOREIGN KEY("etiket")REFERENCES "etiket"("etiketNo") ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TAble "kullanicirozet" ADD CONSTRAINT "KullaniciRozetKullaniciFK" FOREIGN KEY("kullaniciNo") REFERENCES "Kullanici"("kullaniciNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TAble "kullanicirozet" ADD CONSTRAINT "KullaniciRozetRozetFK" FOREIGN KEY("rozetNo") REFERENCES "rozet"("rozetNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

/*ALTER TABLE "kullanicirozet" DROP CONSTRAINT "KullaniciRozetRozetFK";*/

