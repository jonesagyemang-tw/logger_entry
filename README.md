# Log Parser
This is a web analysis tool for gaining insight into visitor behaviour. This tool can analyse a server log.

# Pre-requisites
 - Ruby v3 or above

# How To Use
1. Browse to the project directory, _log_parser_
2. Open a terminal
3. Issue the following command:
  `$> ./lib/main.rb webserver.log`

*Sample output*
```
~/Projects/side/log_parser$> ./lib/main.rb sample.log
Page Views
********************
/home 4 visits
/about/2 2 visits
/help_page/1 1 visits

Unique Page Views
********************
/home 2 unique visits
/about/2 2 unique visits
/help_page/1 1 unique visits
```

# Limitations
  - this tool cannot provide insight beyond general and unique visits.
  - server log entries must be of the following format:
    `/uri ip_address`
    Any information beyond that will not be processed.
