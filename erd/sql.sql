CREATE TABLE `Użytkownicy` (
	`Użytkownik_id` INT NOT NULL AUTO_INCREMENT,
	`Login` varchar(255) NOT NULL,
	`Hasło` varchar(255) NOT NULL,
	`e-mail` varchar(255) NOT NULL,
	`Imię` varchar(255) NOT NULL,
	`Nazwisko` varchar(255) NOT NULL,
	`nr tel` INT NOT NULL,
	`nr konta bank` INT NOT NULL,
	`nr konta bankowego` INT NOT NULL,
	PRIMARY KEY (`Użytkownik_id`)
);

CREATE TABLE `Hotele` (
	`Hotel_id` INT NOT NULL AUTO_INCREMENT,
	`na ile osob` INT NOT NULL,
	`Nazwa Hotelu` varchar(255) NOT NULL,
	`ilosc gwiazdek` INT NOT NULL,
	`Adres_id` INT NOT NULL,
	`Lokal_id` INT NOT NULL,
	PRIMARY KEY (`Hotel_id`)
);

CREATE TABLE `Adresy` (
	`Adres_id` varchar(255) NOT NULL,
	`Kraj` varchar(255) NOT NULL,
	`Miasto` varchar(255) NOT NULL,
	`Ulica` varchar(255) NOT NULL,
	`Kod pocztowy` varchar(255) NOT NULL,
	`nr. budynku` INT(255) NOT NULL,
	`nr. lokalu` INT(255) NOT NULL,
	PRIMARY KEY (`Adres_id`)
);

CREATE TABLE `Ośrodki wczasowe` (
	`Ośrodki wczasowe_id` INT NOT NULL AUTO_INCREMENT,
	`Nazwa Ośrodka` varchar(255) NOT NULL,
	`Adres_id` INT(255) NOT NULL,
	`Lokal_id` INT NOT NULL,
	PRIMARY KEY (`Ośrodki wczasowe_id`)
);

CREATE TABLE `Mieszkanie na wynajem` (
	`Mieszkanie na wynajem_id` INT NOT NULL AUTO_INCREMENT,
	`Adres_id` INT NOT NULL,
	`czy ogród` BOOLEAN NOT NULL,
	`Lokal_id` INT NOT NULL,
	PRIMARY KEY (`Mieszkanie na wynajem_id`)
);

CREATE TABLE `Rezerwacje` (
	`użytkownik_id` INT NOT NULL,
	`Hotel_id` INT,
	`Ośrodki wczasowe_id` INT,
	`Mieszkanie na wynajem_id` INT,
	`Historia rezerwacji_id` INT NOT NULL
);

CREATE TABLE `Lokal` (
	`Lokal_id` INT NOT NULL,
	`nr. pokoju/mieszkania` INT NOT NULL,
	`czy wolny` BOOLEAN NOT NULL,
	`koszt/doba` FLOAT NOT NULL,
	`kaucja` FLOAT,
	`czynsz` FLOAT,
	`opis` TEXT,
	`nr. telefonu` varchar NOT NULL,
	`Udogodnienia_id` INT NOT NULL,
	PRIMARY KEY (`Lokal_id`)
);

CREATE TABLE `Udogodnienia` (
	`Udogodnienia_id` BOOLEAN NOT NULL AUTO_INCREMENT,
	`Dostep do basenu` BOOLEAN NOT NULL,
	`zasieg free wi-fi` BOOLEAN NOT NULL,
	`dla palaczy` BOOLEAN NOT NULL,
	`zwierzęta` BOOLEAN NOT NULL,
	`dzieci` BOOLEAN NOT NULL,
	`własna łazienka` BOOLEAN NOT NULL,
	`ilosc osob` INT NOT NULL,
	`ilosc metrow^2` INT NOT NULL,
	`ilosc gwiazdek` INT,
	PRIMARY KEY (`Udogodnienia_id`)
);

CREATE TABLE `Historia rezerwacji` (
	`Historia rezerwacji_id` INT NOT NULL AUTO_INCREMENT,
	`Data rezerwacji` DATE NOT NULL,
	`Data przyjazdu` DATE NOT NULL,
	`Data wyjazdu` DATE NOT NULL,
	`Kwota` FLOAT NOT NULL,
	`ilosc dni` INT NOT NULL,
	`zaksiegowany przelew` BOOLEAN NOT NULL,
	PRIMARY KEY (`Historia rezerwacji_id`)
);

ALTER TABLE `Hotele` ADD CONSTRAINT `Hotele_fk0` FOREIGN KEY (`Adres_id`) REFERENCES `Adresy`(`Adres_id`);

ALTER TABLE `Hotele` ADD CONSTRAINT `Hotele_fk1` FOREIGN KEY (`Lokal_id`) REFERENCES `Lokal`(`Lokal_id`);

ALTER TABLE `Ośrodki wczasowe` ADD CONSTRAINT `Ośrodki wczasowe_fk0` FOREIGN KEY (`Adres_id`) REFERENCES `Adresy`(`Adres_id`);

ALTER TABLE `Ośrodki wczasowe` ADD CONSTRAINT `Ośrodki wczasowe_fk1` FOREIGN KEY (`Lokal_id`) REFERENCES `Lokal`(`Lokal_id`);

ALTER TABLE `Mieszkanie na wynajem` ADD CONSTRAINT `Mieszkanie na wynajem_fk0` FOREIGN KEY (`Adres_id`) REFERENCES `Adresy`(`Adres_id`);

ALTER TABLE `Mieszkanie na wynajem` ADD CONSTRAINT `Mieszkanie na wynajem_fk1` FOREIGN KEY (`Lokal_id`) REFERENCES `Lokal`(`Lokal_id`);

ALTER TABLE `Rezerwacje` ADD CONSTRAINT `Rezerwacje_fk0` FOREIGN KEY (`użytkownik_id`) REFERENCES `Użytkownicy`(`Użytkownik_id`);

ALTER TABLE `Rezerwacje` ADD CONSTRAINT `Rezerwacje_fk1` FOREIGN KEY (`Hotel_id`) REFERENCES `Hotele`(`Hotel_id`);

ALTER TABLE `Rezerwacje` ADD CONSTRAINT `Rezerwacje_fk2` FOREIGN KEY (`Ośrodki wczasowe_id`) REFERENCES `Ośrodki wczasowe`(`Ośrodki wczasowe_id`);

ALTER TABLE `Rezerwacje` ADD CONSTRAINT `Rezerwacje_fk3` FOREIGN KEY (`Mieszkanie na wynajem_id`) REFERENCES `Mieszkanie na wynajem`(`Mieszkanie na wynajem_id`);

ALTER TABLE `Rezerwacje` ADD CONSTRAINT `Rezerwacje_fk4` FOREIGN KEY (`Historia rezerwacji_id`) REFERENCES `Historia rezerwacji`(`Historia rezerwacji_id`);

ALTER TABLE `Lokal` ADD CONSTRAINT `Lokal_fk0` FOREIGN KEY (`Udogodnienia_id`) REFERENCES `Udogodnienia`(`Udogodnienia_id`);

