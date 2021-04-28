-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: db1
-- Erstellungszeit: 28. Apr 2021 um 15:44
-- Server-Version: 5.7.28-nmm1-log
-- PHP-Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db1`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `addresse`
--

CREATE TABLE `addresse` (
  `id` int(11) NOT NULL,
  `strasse` varchar(255) NOT NULL,
  `hausnummer` varchar(255) NOT NULL,
  `ort` varchar(255) NOT NULL,
  `plz` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auftrag`
--

CREATE TABLE `auftrag` (
  `id` int(11) NOT NULL,
  `datum` datetime NOT NULL,
  `lieferdatum` datetime NOT NULL,
  `kundeId` int(11) DEFAULT NULL,
  `rechnungsAdresseId` int(11) DEFAULT NULL,
  `lieferAdresseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auftrags_pos`
--

CREATE TABLE `auftrags_pos` (
  `position` int(11) NOT NULL,
  `menge` int(11) NOT NULL,
  `auftragId` int(11) DEFAULT NULL,
  `pizzaId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `grundrezepte`
--

CREATE TABLE `grundrezepte` (
  `id` int(11) NOT NULL,
  `beschreibung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `vorname` varchar(255) NOT NULL,
  `telefon` int(11) NOT NULL,
  `adresseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lagerbedingung`
--

CREATE TABLE `lagerbedingung` (
  `id` int(11) NOT NULL,
  `beschreibung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lieferant`
--

CREATE TABLE `lieferant` (
  `id` int(11) NOT NULL,
  `telefon` varchar(255) NOT NULL,
  `addresseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `beschreibung` varchar(255) NOT NULL,
  `grundrezepteId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pizza_zutaten_zutaten`
--

CREATE TABLE `pizza_zutaten_zutaten` (
  `pizzaId` int(11) NOT NULL,
  `zutatenId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `standort`
--

CREATE TABLE `standort` (
  `id` int(11) NOT NULL,
  `beschreibung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zutaten`
--

CREATE TABLE `zutaten` (
  `id` int(11) NOT NULL,
  `beschreibung` varchar(255) NOT NULL,
  `standortId` int(11) DEFAULT NULL,
  `lagerbedingungId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zutaten_lieferant_lieferant`
--

CREATE TABLE `zutaten_lieferant_lieferant` (
  `zutatenId` int(11) NOT NULL,
  `lieferantId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zutaten_pizza_pizza`
--

CREATE TABLE `zutaten_pizza_pizza` (
  `zutatenId` int(11) NOT NULL,
  `pizzaId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `addresse`
--
ALTER TABLE `addresse`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `auftrag`
--
ALTER TABLE `auftrag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REL_d3777085998e228dbd054a7462` (`rechnungsAdresseId`),
  ADD UNIQUE KEY `REL_b5ebd090120bcb15ec66adf07f` (`lieferAdresseId`),
  ADD KEY `FK_2007a8f57c57c652442f3135be3` (`kundeId`);

--
-- Indizes für die Tabelle `auftrags_pos`
--
ALTER TABLE `auftrags_pos`
  ADD PRIMARY KEY (`position`),
  ADD UNIQUE KEY `REL_cbd7e14064b3a3597e1c1b80d8` (`pizzaId`),
  ADD KEY `FK_b96cc6e387dd3cec26ffc5f429f` (`auftragId`);

--
-- Indizes für die Tabelle `grundrezepte`
--
ALTER TABLE `grundrezepte`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REL_d114f98231d26c9e4095a5bece` (`adresseId`);

--
-- Indizes für die Tabelle `lagerbedingung`
--
ALTER TABLE `lagerbedingung`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `lieferant`
--
ALTER TABLE `lieferant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ca2fc309e65fffaf6cce10539be` (`addresseId`);

--
-- Indizes für die Tabelle `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_2e4864f217d58f2f47f974971c5` (`grundrezepteId`);

--
-- Indizes für die Tabelle `pizza_zutaten_zutaten`
--
ALTER TABLE `pizza_zutaten_zutaten`
  ADD PRIMARY KEY (`pizzaId`,`zutatenId`),
  ADD KEY `IDX_089e40660532c9d8d648c5c525` (`pizzaId`),
  ADD KEY `IDX_e26995fcdc46be3b1d53303158` (`zutatenId`);

--
-- Indizes für die Tabelle `standort`
--
ALTER TABLE `standort`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `zutaten`
--
ALTER TABLE `zutaten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_456ffa70ea86a30fbcc3d297947` (`standortId`),
  ADD KEY `FK_104265007c1595840fc3ff166c1` (`lagerbedingungId`);

--
-- Indizes für die Tabelle `zutaten_lieferant_lieferant`
--
ALTER TABLE `zutaten_lieferant_lieferant`
  ADD PRIMARY KEY (`zutatenId`,`lieferantId`),
  ADD KEY `IDX_ae2d977f55f20306d5577cfdaa` (`zutatenId`),
  ADD KEY `IDX_53b2f8541e6efa75cf95ee1017` (`lieferantId`);

--
-- Indizes für die Tabelle `zutaten_pizza_pizza`
--
ALTER TABLE `zutaten_pizza_pizza`
  ADD PRIMARY KEY (`zutatenId`,`pizzaId`),
  ADD KEY `IDX_6da852817bc32980ffb60ebcfe` (`zutatenId`),
  ADD KEY `IDX_393f4cc4eb42815e707cbb05d9` (`pizzaId`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `addresse`
--
ALTER TABLE `addresse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `auftrag`
--
ALTER TABLE `auftrag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `auftrags_pos`
--
ALTER TABLE `auftrags_pos`
  MODIFY `position` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `grundrezepte`
--
ALTER TABLE `grundrezepte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kunde`
--
ALTER TABLE `kunde`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `lagerbedingung`
--
ALTER TABLE `lagerbedingung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `lieferant`
--
ALTER TABLE `lieferant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `standort`
--
ALTER TABLE `standort`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `zutaten`
--
ALTER TABLE `zutaten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `auftrag`
--
ALTER TABLE `auftrag`
  ADD CONSTRAINT `FK_2007a8f57c57c652442f3135be3` FOREIGN KEY (`kundeId`) REFERENCES `kunde` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_b5ebd090120bcb15ec66adf07f5` FOREIGN KEY (`lieferAdresseId`) REFERENCES `addresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_d3777085998e228dbd054a74625` FOREIGN KEY (`rechnungsAdresseId`) REFERENCES `addresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `auftrags_pos`
--
ALTER TABLE `auftrags_pos`
  ADD CONSTRAINT `FK_b96cc6e387dd3cec26ffc5f429f` FOREIGN KEY (`auftragId`) REFERENCES `auftrag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_cbd7e14064b3a3597e1c1b80d89` FOREIGN KEY (`pizzaId`) REFERENCES `pizza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD CONSTRAINT `FK_d114f98231d26c9e4095a5becea` FOREIGN KEY (`adresseId`) REFERENCES `addresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `lieferant`
--
ALTER TABLE `lieferant`
  ADD CONSTRAINT `FK_ca2fc309e65fffaf6cce10539be` FOREIGN KEY (`addresseId`) REFERENCES `addresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `FK_2e4864f217d58f2f47f974971c5` FOREIGN KEY (`grundrezepteId`) REFERENCES `grundrezepte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `pizza_zutaten_zutaten`
--
ALTER TABLE `pizza_zutaten_zutaten`
  ADD CONSTRAINT `FK_089e40660532c9d8d648c5c525b` FOREIGN KEY (`pizzaId`) REFERENCES `pizza` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_e26995fcdc46be3b1d53303158a` FOREIGN KEY (`zutatenId`) REFERENCES `zutaten` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `zutaten`
--
ALTER TABLE `zutaten`
  ADD CONSTRAINT `FK_104265007c1595840fc3ff166c1` FOREIGN KEY (`lagerbedingungId`) REFERENCES `lagerbedingung` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_456ffa70ea86a30fbcc3d297947` FOREIGN KEY (`standortId`) REFERENCES `standort` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `zutaten_lieferant_lieferant`
--
ALTER TABLE `zutaten_lieferant_lieferant`
  ADD CONSTRAINT `FK_53b2f8541e6efa75cf95ee10177` FOREIGN KEY (`lieferantId`) REFERENCES `lieferant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ae2d977f55f20306d5577cfdaa2` FOREIGN KEY (`zutatenId`) REFERENCES `zutaten` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `zutaten_pizza_pizza`
--
ALTER TABLE `zutaten_pizza_pizza`
  ADD CONSTRAINT `FK_393f4cc4eb42815e707cbb05d9d` FOREIGN KEY (`pizzaId`) REFERENCES `pizza` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_6da852817bc32980ffb60ebcfe7` FOREIGN KEY (`zutatenId`) REFERENCES `zutaten` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
