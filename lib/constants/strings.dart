class Strings {
  static const heading = "Job Application Master";

  static const basicDetailTable = """
            CREATE TABLE basicDetails (id INTEGER PRIMARY KEY AUTOINCREMENT, 
              firstName TEXT NOT NULL,
              lastName TEXT NOT NULL,
              designation TEXT NOT NULL,
              address TEXT NOT NULL,
              email TEXT NOT NULL,  phoneNumber TEXT NOT NULL,  zipCode TEXT NOT NULL,  dateOfBirth TEXT NOT NULL,  gender TEXT NOT NULL, state TEXT NOT NULL) """;
}
