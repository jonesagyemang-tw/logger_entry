# Possible Improvements
  - Provider a better experience for repeated analysis i.e. it should be possible for a user to provide more than one server log file; users should be able to interactively submit a log file on the terminal etc.
  - Add SimpleCov to track code coverage
  - use fixtures in spec to reduce duplicate test data
  - provide file validation for server log i.e. it should have the right format
  - revisit the interaction between the Parser class and the Printer class; is it worth injecting a printer object into the Parser class of should they remain separated
