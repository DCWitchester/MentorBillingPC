ALTER DATABASE "MentorBilling" OWNER TO postgres;

--\connect "<DatabaseName>"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

-- #region Nomenclatoare --

-- Tari --

CREATE TABLE public.tari (
    id SERIAL NOT NULL PRIMARY KEY,
    cod_tara_iso2 VARCHAR(2) DEFAULT '' NOT NULL,
    cod_tara_iso3 VARCHAR(3) DEFAULT '' NOT NULL,
    cod_tara_iso_m49 VARCHAR(3) DEFAULT '' NOT NULL,
    den_tara_ro VARCHAR DEFAULT '' NOT NULL,
    den_tara_en VARCHAR DEFAULT '' NOT NULL
);

ALTER TABLE public.tari OWNER TO postgres;
-- Comments
COMMENT ON COLUMN public.tari.cod_tara_iso2 IS 'International Organization for Standardization 2';
COMMENT ON COLUMN public.tari.cod_tara_iso3 IS 'International Organization for Standardization 3';
COMMENT ON COLUMN public.tari.cod_tara_iso_m49 IS 'International Organization for Standardization m49';
-- Inserts
INSERT INTO public.tari (id, cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES (0, 'NO', 'NON', '000', 'NONE', 'NONE');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AF', 'AFG', '004', 'Afganistan', 'Afghanistan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('ZA', 'ZAF', '710', 'Africa de Sud', 'South Africa');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AL', 'ALB', '008', 'Albania', 'Albania');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('DZ', 'DZA', '012', 'Algeria', 'Algeria');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AD', 'AND', '020', 'Andora', 'Andorra');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AO', 'AGO', '024', 'Angola', 'Angola');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AI', 'AIA', '660', 'Anguilla', 'Anguilla');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AQ', 'ATA', '010', 'Antarctica', 'Antarctic');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AG', 'ATG', '028', 'Antigua si Barbuda', 'Antigua and Barbuda');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AN', 'ANT', '530', 'Antilele Olandeze', 'Netherlands Antilles');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SA', 'SAU', '682', 'Arabia Saudita', 'Saudi Arabia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AR', 'ARG', '032', 'Argentina', 'Argentine');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AM', 'ARM', '051', 'Armenia', 'Armenia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AW', 'ABW', '533', 'Aruba', 'Aruba');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AU', 'AUS', '036', 'Australia', 'Australia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AT', 'AUT', '040', 'Austria', 'Austria');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AZ', 'AZE', '031', 'Azerbaidjan', 'Azerbaijan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BS', 'BHS', '044', 'Bahamas', 'Bahamas');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BH', 'BHR', '048', 'Bahrain', 'Bahrain');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BD', 'BGD', '050', 'Bangladesh', 'Bangladesh');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BB', 'BRB', '052', 'Barbados', 'Barbados');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BY', 'BLR', '112', 'Belarus', 'Belarus');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BE', 'BEL', '056', 'Belgia', 'Belgium');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BZ', 'BLZ', '084', 'Belize', 'Belize');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BJ', 'BEN', '204', 'Benin', 'Benin');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BM', 'BMU', '060', 'Bermude', 'Bermuda');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BT', 'BTN', '064', 'Bhutan', 'Bhutan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BO', 'BOL', '068', 'Bolivia', 'Bolivia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BA', 'BIH', '070', 'Bosnia si Hertegovina', 'Bosnia and Herzegovina');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BW', 'BWA', '072', 'Botswana', 'Botswana');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BV', 'BVT', '074', 'Bouvet', 'Bouvet');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BR', 'BRA', '076', 'Brazilia', 'Brazil');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BN', 'BRN', '096', 'Brunei Darussalam', 'Brunei Darussalam');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BG', 'BGR', '100', 'Bulgaria', 'Bulgaria');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BF', 'BFA', '854', 'Burkina Faso', 'Burkina Faso');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('BI', 'BDI', '108', 'Burundi', 'Burundi');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('KH', 'KHM', '116 ', 'Cambogia', 'Cambodia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CM', 'CMR', '120', 'Camerun', 'Cameroon');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CA', 'CAN', '124', 'Canada', 'Canada');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CV', 'CPV', '132', 'Capul Verde', 'Cape Verde');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('KY', 'KYM', '136', 'Cayman', 'Cayman');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CZ', 'CZE', '203', 'Cehia', 'Czech Republic');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CF', 'CAF', '140', 'Republica Centrafricana', 'Central African Republic');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CL', 'CHL', '152', 'Chile', 'Chile');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CN', 'CHN', '156', 'China', 'China');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CX', 'CXR', '162', 'Christmas', 'Christmas');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TD', 'TCD', '148', 'Ciad', 'Chad');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CY', 'CYP', '196', 'Cipru', 'Cyprus');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CC', 'CCK', '166', 'Insulele Cocos', 'Cocos Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CO', 'COL', '170', 'Columbia', 'Colombia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('KM', 'COM', '174', 'Comore', 'Comoros');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CD', 'COD', '180', 'Congo', 'Congo');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CK', 'COK', '184', 'Cook', 'Cook Island');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('KR', 'KOR', '410', 'Coreea de sud', ' South Korea');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('KP', 'PRK', '408', 'Coreea de nord', 'North Korea');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CR', 'CRI', '188', 'Costa Rica', 'Costa Rica');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CI', 'CIV', '384', 'Coasta de fildes', 'Ivory Coast');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('HR', 'HRV', '191', 'Croatia', 'Croatia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CU', 'CUB', '192', 'Cuba', 'Cuba');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('DK', 'DNK', '208', 'Danemarca', 'Danemark');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('DJ', 'DJI', '262', 'Djibouti', 'Djibouti');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('DM', 'DMA', '212', 'Dominica', 'Dominica');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('DO', 'DOM', '214', 'Republica Dominicana', 'Dominican Republic');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('EC', 'ECU', '218', 'Ecuador', 'Ecuador');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('EG', 'EGY', '818', 'Egipt', 'Egypt');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SV', 'SLV', '222', 'El Salvador', 'Egypt');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('CH', 'CHE', '756', 'Elvetia', 'Switzerland');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AE', 'ARE', '784', 'Emiratele Arabe Unite', 'United Arab Emirates');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('ER', 'ERI', '232', 'Eritrea', 'Eritrea');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('EE', 'EST', '233', 'Estonia', 'Estonia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('ET', 'ETH', '231', 'Etiopia', 'Ethiopia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('FK', 'FLK', '238', 'Insulele Falkland', 'Falkland Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('FO', 'FRO', '234', 'Insulele Feroe', 'Faroe Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('FJ', 'FJI', '242', 'Fiji', 'Fiji');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PH', 'PHL', '608', 'Filipine', 'Philippines');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('FR', 'FRA', '250', 'Franta', 'France');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GA', 'GAB', '266', 'Gabon', 'Gabon');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GM', 'GMB', '270', 'Gambia', 'Gambia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GE', 'GEO', '268', 'Georgia', 'Georgia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GS', 'SGS', '239', 'Georgia de Sud si Insulele Sandwich de Sud ', 'South Georgia and the South Sandwich Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('DE', 'DEU', '276', 'Germania', 'Germany');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GH', 'GHA', '288', 'Ghana', 'Ghana');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GI', 'GIB', '292', 'Gibraltar', 'Gibraltar');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GR', 'GRC', '300', 'Grecia', 'Greece');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GD', 'GRD', '308', 'Grenada', 'Grenada Island');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GL', 'GRL', '304', 'Groenlanda', 'Greenland');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GP', 'GLP', '312', 'Guadelupa', 'Guadeloupe');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GU', 'GUM', '316', 'Guam', 'Guam');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GT', 'GTM', '320', 'Guatemala', 'Guatemala');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GW', 'GNB', '624', 'Guineea-Bissau', 'Guinea-Bissau');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GQ', 'GNQ', '226', 'Guineea Ecuatoriala', 'Equatorial Guinea');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GY', 'GUY', '328', 'Guyana', 'Guyana');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GF', 'GUF', '254', 'Guyana Franceza', 'French Guiana');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('HT', 'HTI', '332', 'Haiti', 'Haiti');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('HM', 'HMD', '334', 'Insulele Heard si McDonald', 'Heard Island and McDonald Island');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('HN', 'HND', '340', 'Honduras', 'Honduras');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('HK', 'HKG', '344', 'Hong Kong', 'Hong Kong');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('IN', 'IND', '356', 'India', 'India');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('ID', 'IDN', '360', 'Indonezia', 'Indonesia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('UM', 'UMI', '581', 'Insulele mici periferice ale Statelor Unite', 'United States Minor Outlying Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('VG', 'VGB', '092', 'Insulele virgine Britanice', 'British Virgin Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('VI', 'VIR', '850', 'Insulele virgine Americane', ' United States Virgin Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('JO', 'JOR', '400', 'Iordania', 'Jordan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('IR', 'IRN', '364', 'Iran', 'Iran');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('IQ', 'IRQ', '368', 'Iraq', 'Iraq');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('IE', 'IRL', '372', 'Irlanda', 'Ireland');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('IS', 'ISL', '352', 'Islanda', 'Iceland');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('IL', 'ISR', '376', 'Israel', 'Israel');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('IT', 'ITA', '380', 'Italia', 'Italy');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('YU', 'YUG', '891', 'Iugoslavia', 'Yugoslavia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('JM', 'JAM', '388', 'Jamaica', 'Jamaica');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('JP', 'JPN', '392', 'Japonia', 'Japan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('KZ', 'KAZ', '398', 'Kazahstan', 'Kazakhstan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('KE', 'KEN', '404', 'Kenya', 'Kenya');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('KG', 'KGZ', '417', 'Kirghizia', 'Kyrgyzstan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('KI', 'KIR', '296', 'Kiribati', 'Kiribati');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('LA', 'LAO', '418', 'Laos', 'Laos');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('LS', 'LSO', '426', 'Lesotho', 'Lesotho');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('LV', 'LVA', '428', 'Letonia', 'Latvia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('LB', 'LBN', '422', 'Liban', 'Lebanon');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('LR', 'LBR', '430', 'Liberia', 'Liberia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('LY', 'LBY', '434', 'Jamahiria Araba Libiana', 'Libyan Arab Jamahiriya');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('LI', 'LIE', '438', 'Liechtenstein', 'Liechtenstein');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('LT', 'LTU', '440', 'Lituania', 'Lithuania');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('LU', 'LUX', '442', 'Luxemburg', 'Luxembourg');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MO', 'MAC', '446', 'Macao', 'Macao');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MK', 'MKD', '807', 'Macedonia', 'Macedonia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MG', 'MDG', '450', 'Madagascar', 'Madagascar');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MW', 'MWI', '454', 'Malawi', 'Malawi');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MY', 'MYS', '458', 'Malaysia', 'Malaysia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MV', 'MDV', '462', 'Maldive', 'Maldives');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('ML', 'MLI', '466', 'Mali', 'Mali');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MT', 'MLT', '470', 'Malta', 'Malta');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('GB', 'GBR', '826', 'Marea Britanie', 'Great Britain');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MP', 'MNP', '580', 'Insulele Mariane de Nord', 'Northern Mariana Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MA', 'MAR', '504', 'Maroc', 'Morocco');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MH', 'MHL', '584', 'Insulele Marshall', 'Marshall Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MQ', 'MTQ', '474', 'Martinica', 'Martinique');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MR', 'MRT', '478', 'Mauritania', 'Mauritania');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MU', 'MUS', '480', 'Mauritius', 'Mauritius');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('YT', 'MYT', '175', 'Mayotte', 'Mayotte');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MX', 'MEX', '484', 'Mexic', 'Mexico');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('FM', 'FSM', '583', 'Statele Federate ale Microneziei', 'Federated States of Micronesia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MD', 'MDA', '498', 'Moldova', 'Moldavia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MC', 'MCO', '492', 'Monaco', 'Monaco');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MN', 'MNG', '496', 'Mongolia', 'Mongolia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MS', 'MSR', '500', 'Montserrat', 'Montserrat');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MZ', 'MOZ', '508', 'Mozambic', 'Mozambique');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('MM', 'MMR', '104', 'Myanmar', 'Myanmar');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NA', 'NAM', '516', 'Namibia', 'Namibia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NR', 'NRU', '520', 'Nauru', 'Nauru');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NP', 'NPL', '524', 'Nepal', 'Nepal');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NI', 'NIC', '558', 'Nicaragua', 'Nicaragua');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NE', 'NER', '562', 'Niger', 'Niger');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NG', 'NGA', '566', 'Nigeria', 'Nigeria');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NU', 'NIU', '570', 'Niue', 'Niue');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NF', 'NFK', '574', 'Insula Norfolk', 'Norfolk Island');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NO', 'NOR', '578', 'Norvegia', 'Norway');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NC', 'NCL', '540', 'Noua Caledonie', 'New Caledonia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NZ', 'NZL', '554', 'Noua Zeelanda', 'New Zealand');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('NL', 'NLD', '528', 'Olanda', 'Netherlands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('OM', 'OMN', '512', 'Oman', 'Oman');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PK', 'PAK', '586', 'Pakistan', 'Pakistan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PW', 'PLW', '585', 'Palau', 'Palau');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PA', 'PAN', '591', 'Panama', 'Panama');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PG', 'PNG', '598', 'Papua-Noua-Guinee', 'Papua New Guinea');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PY', 'PRY', '600', 'Paraguay', 'Paraguay');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PE', 'PER', '604', 'Peru', 'Peru');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PN', 'PCN', '612', 'Pitcairn', 'Pitcairn Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PF', 'PYF', '258', 'Polinezia Franceza', 'French Polynesia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PL', 'POL', '616', 'Polonia', 'Poland');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PT', 'PRT', '620', 'Portugalia', 'Portugal');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PR', 'PRI', '630', 'Puerto Rico', 'Puerto Rico');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('QA', 'QAT', '634', 'Qatar', 'Qatar');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('RE', 'REU', '638', 'Reunion', 'Reunion');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('RO', 'ROM', '642', 'Romania', 'Romania');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('RU', 'RUS', '643', 'Rusia', 'Russia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('RW', 'RWA', '646', 'Rwanda', 'Rwanda');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('EH', 'ESH', '732', 'Sahara Occidentala', 'Western Sahara');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('PM', 'SPM', '666', 'Saint Pierre si Miquelon', 'Saint Pierre and Miquelon');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('WS', 'WSM', '882', 'Samoa', 'Samoa');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('AS', 'ASM', '016', 'Samoa Americana', 'American Samoa');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SM', 'SMR', '674', 'San Marino', 'San Marino');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('ST', 'STP', '678', 'Sao Tome si Principe', 'Sao Tome and Principe');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SN', 'SEN', '686', 'Senegal', 'Senegal');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SC', 'SYC', '690', 'Seychelles', 'Seychelles');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SH', 'SHN', '654', 'Sfanta Elena', 'Saint Helena');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('LC', 'LCA', '662', 'Sfanta Lucia', 'Saint Lucia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('KN', 'KNA', '659', 'Sfantul Cristofor si Nevis', 'Saint Kitts and Nevis');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('VA', 'VAT', '336', 'Stat Vatican', 'Vatican State');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('VC', 'VCT', '670', 'Sfantul Vicentiu si Grenadine', 'Saint Vincent and the Grenadines');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SL', 'SLE', '694', 'Sierra Leone', 'Sierra Leone');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SG', 'SGP', '702', 'Singapore', 'Singapore');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SY', 'SYR', '760', 'Siria', 'Syria');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SK', 'SVK', '703', 'Slovacia', 'Slovakia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SI', 'SVN', '705', 'Slovenia', 'Slovenia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SB', 'SLB', '090', 'Insulele Solomon', 'Solomon Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SO', 'SOM', '706', 'Somalia', 'Somalia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('ES', 'ESP', '724', 'Spania', 'Spain');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('LK', 'LKA', '144', 'Sirlanka', 'Sri Lanka');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('US', 'USA', '840', 'Statele Unite ale Americii', 'United States of America');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SD', 'SDN', '736', 'Sudan', 'Sudan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SE', 'SWE', '752', 'Suedia', 'Sweden');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SR', 'SUR', '740', 'Surinam', 'Suriname');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SJ', 'SJM', '744', 'Svalbard si Jan Mayen', 'Svalbard and Jan Mayen');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('SZ', 'SWZ', '748', 'Swaziland', 'Swaziland');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TJ', 'TJK', '762', 'Tadjikistan', 'Tadjikistan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TW', 'TWN', '158', 'Taiwan', 'Taiwan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TZ', 'TZA', '834', 'Tanzania', 'Tanzania');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TF', 'ATF', '260', 'Teritoriile Australe Franceze', 'French Southern Territories');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('IO', 'IOT', '086', 'Teritoriul Britanic din Oceanul Indian ', 'British Indian Ocean Territory');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TH', 'THA', '764', 'Thailanda', 'Thailand');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TP', 'TMP', '624', 'Timorul de Est ', 'East Timor');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TG', 'TGO', '768', 'Tago', 'Tago');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TK', 'TKL', '772', 'Tokelau', 'Tokelau');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TO', 'TON', '776', 'Tonga', 'Tonga');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TT', 'TTO', '780', 'Trinidad-Tobago', 'Trinidad and Tobago');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TN', 'TUN', '788', 'Tunisia', 'Tunisia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TR', 'TUR', '792', 'Turcia', 'Turkey');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TM', 'TKM', '795', 'Turkmenistan', 'Turkmenistan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TC', 'TCA', '796', 'Insulele Turks si Caicos', 'Turks and Caicos Islands');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('UA', 'UKR', '804', 'Ucraina', 'Ukraine');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('UG', 'UGA', '800', 'Uganda', 'Uganda');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('HU', 'HUN', '348', 'Ungaria', 'Hungary');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('UY', 'URY', '858', 'Uruguay', 'Uruguay');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('UZ', 'UZB', '860', 'Uzbekistan', 'Uzbekistan');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('VU', 'VUT', '548', 'Vanuatu', 'Vanuatu');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('VE', 'VEN', '862', 'Venezuela', 'Venezuela');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('VN', 'VNM', '704', 'Vietnam', 'Vietnam');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('WF', 'WLF', '876', 'Wallis si Futuna', 'Wallis and Futuna');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('YE', 'YEM', '887', 'Yemen', 'Yemen');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('ZM', 'ZMB', '894', 'Zambia', 'Zambia');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('ZW', 'ZWE', '716', 'Zimbabwe', 'Zimbabwe');
INSERT INTO public.tari (cod_tara_iso2, cod_tara_iso3, cod_tara_iso_m49, den_tara_ro, den_tara_en) VALUES ('TV', 'TUV', '798', 'Tuvalu', 'Tuvalu');

-- Judete --
CREATE TABLE public.judete (
    id SERIAL NOT NULL PRIMARY KEY,
    cod_judet VARCHAR(2) DEFAULT '' NOT NULL,
    den_judet VARCHAR DEFAULT '' NOT NULL
);


ALTER TABLE public.judete OWNER TO postgres;

INSERT INTO public.judete (id, cod_judet, den_judet) VALUES (0, 'NO', 'NONE');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('AB', 'Alba');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('AG', 'Arges');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('AR', 'Arad');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('B', 'Bucuresti');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('BC', 'Bacau');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('BH', 'Bihor');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('BN', 'Bistrita Nasaud');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('BR', 'Braila');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('BT', 'Botosani');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('BV', 'Brasov');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('BZ', 'Buzau');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('CJ', 'Cluj');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('CL', 'Calarasi');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('CS', 'Caras-Severin');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('CT', 'Constanta');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('CV', 'Covasna');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('DB', 'Dambovita');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('DJ', 'Dolj');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('GJ', 'Gorj');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('GL', 'Galati');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('GR', 'Giurgiu');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('HD', 'Hunedoara');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('HR', 'Harghita');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('IF', 'Ilfov');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('IL', 'Ialomita');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('IS', 'Iasi');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('MH', 'Mehedinti');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('MM', 'Maramures');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('MS', 'Mures');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('NT', 'Neamt');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('OT', 'Olt');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('PH', 'Prahova');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('SB', 'Sibiu');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('SJ', 'Salaj');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('SM', 'Satu-Mare');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('SV', 'Suceava');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('TL', 'Tulcea');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('TM', 'Timis');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('TR', 'Teleorman');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('VL', 'Valcea');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('VN', 'Vrancea');
INSERT INTO public.judete (cod_judet, den_judet) VALUES ('VS', 'Vaslui');

-- Forme Juridice --
CREATE TABLE public.forme_juridice (
    id SERIAL NOT NULL PRIMARY KEY,
    cod VARCHAR DEFAULT '' NOT NULL,
    denumire VARCHAR DEFAULT '' NOT NULL
);

ALTER TABLE public.forme_juridice OWNER TO postgres;

INSERT INTO public.forme_juridice (id, cod, denumire) VALUES (0, 'NAN', 'None');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('AFJ', 'Alte forme juridice');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('ASF', 'Asociatie familiala');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('CON', 'Concesiune');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('CRL', 'Soc civila profesionala cu pers juridica si raspundere limitata(SPRL)');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('INC', 'Inchiriere');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('LOC', 'Locatie de gestiune');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('OC1', 'Organizatie cooperatista mestesugareasca');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('OC2', 'Organizatie cooperatista de consum');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('OC3', 'Organizatie cooperatista de credit');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('PFA', 'Persoana fizica independenta');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('RA', 'Regie autonoma');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('SA', 'Societate comerciala pe actiuni');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('SCS', 'Societate comerciala in comandita simpla');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('SNC', 'Societate comerciala in nume colectiv');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('SPI', 'Societate profesionala practicieni in insolventa');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('SRL', 'Societate comerciala cu raspundere limitata');
INSERT INTO public.forme_juridice (cod, denumire) VALUES ('URL', 'Intreprindere profesionala unipersonala cu raspundere limitata(IPURL)');

-- Cote TVA --

CREATE TABLE public.cote_tva(
    id SERIAL NOT NULL PRIMARY KEY,
    cota VARCHAR NOT NULL DEFAULT '',
    tva NUMERIC(2) NOT NULL DEFAULT 0,
    indice_casa_marcat VARCHAR NOT NULL DEFAULT 0,
    cod VARCHAR NOT NULL DEFAULT '',
    activ VARCHAR NOT NULL DEFAULT true
);

ALTER TABLE public.cote_tva OWNER TO postgres;

INSERT INTO public.cote_tva(id,cota,tva,indice_casa_marcat,cod) VALUES(0,'0',0,'7','Neplatitor');
INSERT INTO public.cote_tva(cota,tva,indice_casa_marcat,cod) VALUES('A',19,'1','Cota A');
INSERT INTO public.cote_tva(cota,tva,indice_casa_marcat,cod) VALUES('B',9,'2','Cota B');
INSERT INTO public.cote_tva(cota,tva,indice_casa_marcat,cod) VALUES('C',5,'3','Cota 5');
INSERT INTO public.cote_tva(cota,tva,indice_casa_marcat,cod) VALUES('D',0,'4','Scutit');

-- Metode Plata --

CREATE TABLE public.metode_plata(
    id SERIAL NOT NULL PRIMARY KEY,
    metoda_plata VARCHAR NOT NULL DEFAULT '',
    indice_casa_marcat VARCHAR NOT NULL DEFAULT 0,
    activ VARCHAR NOT NULL DEFAULT true
);

ALTER TABLE public.metode_plata OWNER TO postgres;

INSERT INTO public.metode_plata(id,metoda_plata,indice_casa_marcat) VALUES(0,'Numerar','0');
INSERT INTO public.metode_plata(metoda_plata,indice_casa_marcat) VALUES('Card Credit','1');
INSERT INTO public.metode_plata(metoda_plata,indice_casa_marcat) VALUES('Bonuri Masa','2');
INSERT INTO public.metode_plata(metoda_plata,indice_casa_marcat) VALUES('Virament','3');

-- #endregion --

-- #region Structuri de Baza --

--  Societati --

CREATE TABLE public.societati (
    id SERIAL NOT NULL PRIMARY KEY,
    nume VARCHAR DEFAULT '' NOT NULL,
    cif VARCHAR DEFAULT '' NOT NULL,
    nr_reg_com VARCHAR DEFAULT '' NOT NULL,
    adresa VARCHAR DEFAULT '' NOT NULL,
    mail VARCHAR DEFAULT '' NOT NULL,
    telefon VARCHAR DEFAULT '' NOT NULL,
    website VARCHAR DEFAULT '' NOT NULL,
    platitor_tva BOOLEAN DEFAULT false NOT NULL,
    split_tva BOOLEAN DEFAULT false NOT NULL,
    tva_incasare BOOLEAN DEFAULT false NOT NULL,
    activ BOOLEAN DEFAULT true NOT NULL
);

ALTER TABLE public.societati OWNER TO postgres;

-- Utilizatori --

CREATE TABLE public.utilizatori (
    id SERIAL NOT NULL PRIMARY KEY,
    nume_utilizator VARCHAR DEFAULT '' NOT NULL,
    parola VARCHAR DEFAULT '' NOT NULL,
    nume VARCHAR DEFAULT '' NOT NULL,
    prenume VARCHAR DEFAULT '' NOT NULL,
    cod_numeric_personal VARCHAR DEFAULT '' NOT NULL,
    serie_buletin VARCHAR DEFAULT '' NOT NULL,
    numar_buletin VARCHAR DEFAULT '' NOT NULL,
    administrator BOOLEAN DEFAULT false NOT NULL,
    super_user BOOLEAN DEFAULT false NOT NULL,
    activ BOOLEAN DEFAULT true NOT NULL
);

ALTER TABLE public.utilizatori OWNER TO postgres;

-- Plaje --

CREATE TABLE public.plaje(
    id SERIAL NOT NULL PRIMARY KEY,
    valoare_initiala INTEGER NOT NULL DEFAULT 0,
    valoare_finala INTEGER NOT NULL DEFAULT 0,
    valoare_curenta INTEGER NOT NULL DEFAULT 0,
    activ BOOLEAN DEFAULT true NOT NULL
);

ALTER TABLE public.plaje OWNER TO postgres;

COMMENT ON TABLE public.plaje IS 'Tabela va contine plajele pentru facturi si chitante cu o valoare initiala si finala';
COMMENT ON COLUMN public.plaje.valoare_finala IS 'Valoare finala pentru plaja de facturare: Desi exita in D394 nu am gasit softuri care sa nu permita depasirea plajei';

-- Setari Facturare --

CREATE TABLE public.setari_facturare(
    id SERIAL NOT NULL PRIMARY KEY,
    pachet VARCHAR NOT NULL DEFAULT '',
    gestiune VARCHAR NOT NULL DEFAULT '',
    firma_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.societati(id),
    plaja_facturare_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.plaje(id),
    serie_factura VARCHAR NOT NULL DEFAULT '',
    plaja_chitanta_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.plaje(id),
    serie_chitanta VARCHAR NOT NULL DEFAULT '',
    activ BOOLEAN DEFAULT true NOT NULL
);

ALTER TABLE public.setari_facturare OWNER TO postgres;

COMMENT ON TABLE public.setari_facturare IS 'Tabela va contine setari necesare atat programului de facturare cat si trimiterii datelor in Evidenta primara.';

-- Mijloace Transport --

CREATE TABLE public.mijloace_transport(
    id SERIAL NOT NULL PRIMARY KEY,
    denumire VARCHAR NOT NULL DEFAULT '',
    numar VARCHAR NOT NULL DEFAULT '',
    activ BOOLEAN DEFAULT true NOT NULL
);

ALTER TABLE public.mijloace_transport OWNER TO postgres;

COMMENT ON TABLE public.mijloace_transport IS 'Spre deosebire de Evidenta Primara vom tine Mijloacele de Transport separat pentru a avea un autocomplete';

-- Delegati --

CREATE TABLE public.delegati(
    id SERIAL NOT NULL PRIMARY KEY,
    cod_agent VARCHAR NOT NULL DEFAULT '',
    nume VARCHAR NOT NULL DEFAULT '',
    serie_buletin VARCHAR NOT NULL DEFAULT '',
    numar_buletin VARCHAR NOT NULL DEFAULT '',
    emitent VARCHAR NOT NULL DEFAULT '',
    cnp VARCHAR NOT NULL DEFAULT '',
    activ BOOLEAN DEFAULT true NOT NULL
);

ALTER TABLE public.delegati OWNER TO postgres;

COMMENT ON TABLE public.delegati IS 'Echivalent la tabela de agenti din Evidenta Primara. Contine doar elementele ce se vor inscrie pe factura';
COMMENT ON COLUMN public.delegati.cod_agent IS 'Echivalentul campului de agent din Evidenta Primara. Va putea fi autogenerat.';

-- Produse --
CREATE TABLE public.produse(
    id SERIAL NOT NULL PRIMARY KEY,
    cod_produs VARCHAR NOT NULL DEFAULT '',
    cod_evidenta VARCHAR(4) NOT NULL DEFAULT '',
    activ BOOLEAN NOT NULL DEFAULT true
);

ALTER TABLE public.produse OWNER TO postgres;

COMMENT ON COLUMN public.produse.cod_produs IS 'Codul de produs va fi codul de produs de legatura cu MentorData';
COMMENT ON COLUMN public.delegati.cod_agent IS 'Codul de produs va fi codul de produs de legatura cu Evidenta Primara';

-- Produse Detalii --

CREATE TABLE public.produse_detalii(
    id SERIAL NOT NULL PRIMARY KEY,
    denumire VARCHAR NOT NULL DEFAULT '',
    unitate_masura VARCHAR NOT NULL DEFAULT '',
    pret_unitar DOUBLE PRECISION NOT NULL DEFAULT 0,
    cota_tva_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.cote_tva(id),
    produs_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.produse(id),
    activ BOOLEAN NOT NULL DEFAULT true
);

ALTER TABLE public.produse_detalii OWNER TO postgres;

-- Clienti --

CREATE TABLE public.clienti(
    id SERIAL NOT NULL PRIMARY KEY,
    cod_client VARCHAR NOT NULL DEFAULT '',
    cod_client_evidenta VARCHAR(4) NOT NULL DEFAULT '',
    persoana_fizica BOOLEAN NOT NULL DEFAULT FALSE,
    persoana_juridica BOOLEAN NOT NULL DEFAULT FALSE,
    activ BOOLEAN NOT NULL DEFAULT TRUE
);

ALTER TABLE public.clienti OWNER TO postgres;

-- Conturi Bancare --

CREATE TABLE public.conturi_bancare(
    id SERIAL NOT NULL PRIMARY KEY,
    cont VARCHAR NOT NULL DEFAULT '',
    banca VARCHAR NOT NULL DEFAULT '',
    client_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.clienti(id),
    societate_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.societati(id),
    activ BOOLEAN NOT NULL DEFAULT TRUE
);

ALTER TABLE public.conturi_bancare OWNER TO postgres;

-- Persoane fizice --

CREATE TABLE public.persoane_fizice(
    id SERIAL NOT NULL PRIMARY KEY,
    client_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.clienti(id),
    nume VARCHAR NOT NULL DEFAULT '',
    prenume VARCHAR NOT NULL DEFAULT '',
    cnp VARCHAR NOT NULL DEFAULT '',
    serie_buletin VARCHAR NOT NULL DEFAULT '',
    numar_buletin VARCHAR NOT NULL DEFAULT '',
    emitent VARCHAR NOT NULL DEFAULT '',
    tara_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.tari(id),
    judet_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.judete(id),
    activ BOOLEAN NOT NULL DEFAULT false
);

ALTER TABLE public.persoane_fizice OWNER TO postgres;

-- Persoane Juridice --

CREATE TABLE public.persoane_juridice(
    id SERIAL NOT NULL PRIMARY KEY,
    client_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.clienti(id),
    denumire VARCHAR NOT NULL DEFAULT '',
    forma_juridica_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.forme_juridice(id),
    cod_fiscal VARCHAR NOT NULL DEFAULT '',
    sediu VARCHAR NOT NULL DEFAULT '',
    judet_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.judete(id),
    tara_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.tari(id),
    activ BOOLEAN NOT NULL DEFAULT false
);

ALTER TABLE public.persoane_juridice OWNER TO postgres;


-- Facturi --

CREATE TABLE public.facturi(
    id SERIAL NOT NULL PRIMARY KEY,
    societate_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.societati(id),
    client_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.clienti(id),
    utilizator_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.utilizatori(id),
    delegat_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.delegati(id),
    mijloc_transport_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.mijloace_transport(id),
    serie_factura VARCHAR NOT NULL DEFAULT '',
    numar_factura INTEGER NOT NULL DEFAULT 0,
    data_factura DATE NOT NULL DEFAULT 'now'::DATE,
    data_scadenta DATE NOT NULL DEFAULT 'now'::DATE,
    data_expediere DATE NOT NULL DEFAULT 'now'::DATE,
    numar_aviz INTEGER NOT NULL DEFAULT 0
);

ALTER TABLE public.facturi OWNER TO postgres;

-- Facturi Detalii --

CREATE TABLE public.facturi_detalii(
    id SERIAL NOT NULL PRIMARY KEY,
    factura_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.facturi(id),
    produs_detalii_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.produse_detalii(id),
    cantitate DOUBLE PRECISION NOT NULL DEFAULT 0
);

ALTER TABLE public.facturi_detalii OWNER TO postgres;

-- Bonuri Fiscale --

CREATE TABLE public.bonuri_fiscale(
    id SERIAL NOT NULL PRIMARY KEY,
    numar INTEGER NOT NULL DEFAULT 0,
    text_suplimentar VARCHAR NOT NULL DEFAULT '',
    suma DOUBLE PRECISION NOT NULL DEFAULT 0,
    factura_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.facturi(id)
);

ALTER TABLE public.bonuri_fiscale OWNER TO postgres;

-- Bonuri Fiscale Detalii --

CREATE TABLE public.bonuri_fiscale_detalii(
    id SERIAL NOT NULL PRIMARY KEY,
    bon_fiscal_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.bonuri_fiscale(id),
    metoda_plata_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.metode_plata(id),
    suma DOUBLE PRECISION NOT NULL DEFAULT 0
);

ALTER TABLE public.bonuri_fiscale_detalii OWNER TO postgres;

-- Chitante --
CREATE TABLE public.chitante(
    id SERIAL NOT NULL PRIMARY KEY,
    client_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.clienti(id),
    serie VARCHAR NOT NULL DEFAULT '',
    numar INTEGER NOT NULL DEFAULT 0,
    factura_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.facturi(id),
    societate_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.societati(id),
    utilizator_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.utilizatori(id),
    data_chitanta DATE NOT NULL DEFAULT 'now'::DATE,
    suma DOUBLE PRECISION NOT NULL DEFAULT 0
);

ALTER TABLE public.chitante OWNER TO postgres;

-- #endregion

-- #region Tabele de Legatura

-- Setari Facturare Utilizatori --

CREATE TABLE public.setari_facturare_utilizatori(
    id SERIAL NOT NULL PRIMARY KEY,
    setari_facturare_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.setari_facturare(id),
    utilizator_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.utilizatori(id)
);

ALTER TABLE public.setari_facturare_utilizatori OWNER TO postgres;

COMMENT ON TABLE public.setari_facturare_utilizatori IS 'Un grup de setari poate fi folosit de unul sau mai multi utilizatori.';

-- Delegati Mijloace Transport --

CREATE TABLE public.delegati_mijloace_transport(
    id SERIAL NOT NULL PRIMARY KEY,
    delegat_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.delegati(id),
    mijloc_transport_id INTEGER NOT NULL DEFAULT 0 REFERENCES public.mijloace_transport(id)
);

ALTER TABLE public.delegati_mijloace_transport OWNER TO postgres;

COMMENT ON TABLE public.delegati_mijloace_transport IS 'Tabela de lagatura necesara doar pentru trimiterea in Evidenta Primara a agentilor, respectiv mijloacelor de transport.';

--#endregion