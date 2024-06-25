class Strings {
  static const heading = "Job Application Master";

  static const basicDetailTable = """
            CREATE TABLE  IF NOT EXISTS basicDetails (id INTEGER PRIMARY KEY AUTOINCREMENT, 
              firstName TEXT NOT NULL,
              lastName TEXT NOT NULL,
              designation TEXT NOT NULL,
              address TEXT NOT NULL,
              email TEXT NOT NULL,  phoneNumber TEXT NOT NULL,  zipCode TEXT NOT NULL,  dateOfBirth TEXT NOT NULL,  
              gender TEXT NOT NULL, state TEXT NOT NULL ,relation TEXT NOT NULL) """;

  static const educationdetail = """
        CREATE TABLE IF  NOT EXISTS educationDetails (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        eid INTEGER NOT NULL,
        board TEXT NOT NULL,
       passingYear TEXT NOT NULL,
       percentage TEXT NOT NULL,
       FOREIGN KEY (eid) REFERENCES basicDetails(id)) """;

  static const lanugageknown = """
        CREATE TABLE   IF  NOT EXISTS languageknown (
              id INTEGER PRIMARY KEY AUTOINCREMENT , 
              lid INTEGER  NOT NULL,
              language TEXT NOT NULL,
              read INTEGER NOT NULL,
              write INTEGER NOT NULL,
              speak INTEGER NOT NULL,
               FOREIGN KEY (lid) REFERENCES basicDetails(id)) """;

  static const technologyknown = """
        CREATE TABLE  IF  NOT EXISTS  technologyknown (
              id INTEGER PRIMARY KEY AUTOINCREMENT , 
              tid INTEGER  NOT NULL,
              techonologyName TEXT NOT NULL,
              know TEXT NOT NULL,
               FOREIGN KEY (tid) REFERENCES basicDetails(id)) """;

  static const workexperience = """
              CREATE TABLE  IF  NOT EXISTS  workexperience (
              id INTEGER PRIMARY KEY AUTOINCREMENT , 
              wid INTEGER  NOT NULL,
              companyName TEXT NOT NULL,
              designation TEXT NOT NULL,
              fromDate TEXT NOT NULL,
              toDate TEXT NOT NULL,
              FOREIGN KEY (wid) REFERENCES basicDetails(id)) """;

  static const referenceDetails = """
        CREATE TABLE IF  NOT EXISTS  referenceDetails (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              rid INTEGER   NOT NULL,
              name TEXT NOT NULL,
              contectNumber TEXT NOT NULL,
              relation TEXT NOT NULL,
               FOREIGN KEY (rid) REFERENCES basicDetails(id)) """;

  static const preference = """
        CREATE TABLE preference (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              pid INTEGER NOT NULL ,
             noticePerirod TEXT NOT NULL,
              expectedCtc INTEGER NOT NULL,
               currentCtc INTEGER NOT NULL,
              department TEXT NOT NULL,
               preferdLocation TEXT NOT NULL,
                 FOREIGN KEY (pid) REFERENCES basicDetails(id)) """;
}
