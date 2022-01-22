.pragma library

function newWord() {
    var words = ["AIKOA",
                   "AINOA",
                   "AIVAN",
                   "ANSIO",
                   "ASEMA",
                   "AVATA",
                   "AVOIN",
                   "EHTIÄ",
                   "EILEN",
                   "ELLEI",
                   "ELÄIN",
                   "ELÄMÄ",
                   "ELÄVÄ",
                   "ENSIN",
                   "EROTA",
                   "ESIIN",
                   "ESTÄÄ",
                   "ETEEN",
                   "ETSIÄ",
                   "FILMI",
                   "HAKEA",
                   "HARVA",
                   "HENKI",
                   "HERRA",
                   "HETKI",
                   "HIDAS",
                   "HIENO",
                   "HINTA",
                   "HOITO",
                   "HUOLI",
                   "HUONE",
                   "HUONO",
                   "HYÖTY",
                   "IKÄÄN",
                   "ILMAN",
                   "ILMIÖ",
                   "ISTUA",
                   "JAKAA",
                   "JALKA",
                   "JOHTO",
                   "JOTEN",
                   "JOTTA",
                   "JOULU",
                   "JUHLA",
                   "JUTTU",
                   "JÄLKI",
                   "JÄRVI",
                   "JÄSEN",
                   "KANSA",
                   "KANTA",
                   "KASVU",
                   "KATTO",
                   "KAUAN",
                   "KEINO",
                   "KELLO",
                   "KERTA",
                   "KEVÄT",
                   "KIELI",
                   "KIRJA",
                   "KIRJE",
                   "KOHDE",
                   "KOHTA",
                   "KOHTI",
                   "KOIRA",
                   "KOKEA",
                   "KOLME",
                   "KOOTA",
                   "KOULU",
                   "KOVIN",
                   "KUIVA",
                   "KUKIN",
                   "KUKKA",
                   "KULUA",
                   "KUNTA",
                   "KUNTO",
                   "KUTEN",
                   "KUUSI",
                   "KYLLÄ",
                   "KYLMÄ",
                   "KYSYÄ",
                   "LAAJA",
                   "LAATU",
                   "LAHJA",
                   "LAINA",
                   "LAITA",
                   "LAITE",
                   "LAIVA",
                   "LAPPI",
                   "LAULU",
                   "LEHTI",
                   "LIIAN",
                   "LIIKE",
                   "LINJA",
                   "LINTU",
                   "LOPPU",
                   "LUKEA",
                   "LUODA",
                   "LYHYT",
                   "LYÖDÄ",
                   "LÄHES",
                   "MAKSU",
                   "MALLI",
                   "MATKA",
                   "MATTI",
                   "MELKO",
                   "METRI",
                   "METSÄ",
                   "MIHIN",
                   "MIKSI",
                   "MISSÄ",
                   "MITEN",
                   "MITTA",
                   "MUOTO",
                   "MUSTA",
                   "MYYDÄ",
                   "MÄÄRÄ",
                   "NELJÄ",
                   "NOPEA",
                   "NOUSU",
                   "NÄKYÄ",
                   "NÄYTE",
                   "OIKEA",
                   "OPPIA",
                   "OSATA",
                   "OSTAA",
                   "OSUUS",
                   "PAINO",
                   "PALAA",
                   "PANNA",
                   "PAPPI",
                   "PARAS",
                   "PEKKA",
                   "PERHE",
                   "PIIRI",
                   "PIMEÄ",
                   "PINTA",
                   "PISTE",
                   "PITKÄ",
                   "POHJA",
                   "POIKA",
                   "PUHUA",
                   "PUITE",
                   "PUUTE",
                   "PYSYÄ",
                   "PÖYTÄ",
                   "RADIO",
                   "RANTA",
                   "RAUHA",
                   "ROUVA",
                   "RUOKA",
                   "RYHMÄ",
                   "SAARI",
                   "SAKSA",
                   "SARJA",
                   "SEINÄ",
                   "SELVÄ",
                   "SEURA",
                   "SEUTU",
                   "SIINÄ",
                   "SIKSI",
                   "SILMÄ",
                   "SILTI",
                   "SINNE",
                   "SITEN",
                   "SITOA",
                   "SOPIA",
                   "SUHDE",
                   "SUORA",
                   "SYDÄN",
                   "SYKSY",
                   "SYNTI",
                   "SYÖDÄ",
                   "TAHTO",
                   "TAITO",
                   "TAKIA",
                   "TALVI",
                   "TARVE",
                   "TERVE",
                   "TIETO",
                   "TOIMI",
                   "TOSIN",
                   "TUKEA",
                   "TULOS",
                   "TUNNE",
                   "TUNTI",
                   "TUODA",
                   "TUOTE",
                   "TUTTU",
                   "TUULI",
                   "TYHJÄ",
                   "TYTTÖ",
                   "TÄNNE",
                   "TÄYSI",
                   "USEIN",
                   "USKOA",
                   "VAATE",
                   "VAHVA",
                   "VAIHE",
                   "VALTA",
                   "VAPAA",
                   "VARMA",
                   "VASEN",
                   "VASTA",
                   "VERTA",
                   "VETÄÄ",
                   "VIEDÄ",
                   "VIIME",
                   "VIISI",
                   "VIRKA",
                   "VOIMA",
                   "VUORO",
                   "VÄHÄN",
                   "YHTIÖ",
                   "YKSIN"]

    var index = Math.floor(Math.random() * words.length) % words.length
    return words[index]
}