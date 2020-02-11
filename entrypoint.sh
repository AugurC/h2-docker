#!/bin/bash

# java -cp h2-1.4.200.jar org.h2.tools.Shell -?
# Interactive command line tool to access a database using JDBC.
# Usage: java org.h2.tools.Shell <options>
# Options are case sensitive. Supported options are:
# [-help] or [-?]        Print the list of options
# [-url "<url>"]         The database URL (jdbc:h2:...)
# [-user <user>]         The user name
# [-password <pwd>]      The password
# [-driver <class>]      The JDBC driver class to use (not required in most cases)
# [-sql "<statements>"]  Execute the SQL statements and exit
# [-properties "<dir>"]  Load the server properties from this directory
# If special characters don't work as expected, you may need to use
 # -Dfile.encoding=UTF-8 (Mac OS X) or CP850 (Windows).
# See also https://h2database.com/javadoc/org/h2/tools/Shell.html
java -cp /opt/h2/bin/h2-1.4.200.jar org.h2.tools.Shell -properties "/root/.h2.server.properties" \
     -url "jdbc:h2:tcp://localhost:9092/test;IFEXISTS=TRUE;DB_CLOSE_ON_EXIT=FALSE;AUTO_RECONNECT=TRUE" -user "sa" -password "h2" \
	 -driver org.h2.Driver 

# java -cp h2-1.4.200.jar org.h2.tools.Server -?
# Starts the H2 Console (web-) server, TCP, and PG server.
# Usage: java org.h2.tools.Server <options>
# When running without options, -tcp, -web, -browser and -pg are started.
# Options are case sensitive. Supported options are:
# [-help] or [-?]         Print the list of options
# [-web]                  Start the web server with the H2 Console
# [-webAllowOthers]       Allow other computers to connect - see below
# [-webDaemon]            Use a daemon thread
# [-webPort <port>]       The port (default: 8082)
# [-webSSL]               Use encrypted (HTTPS) connections
# [-webAdminPassword]     Password of DB Console administrator
# [-browser]              Start a browser connecting to the web server
# [-tcp]                  Start the TCP server
# [-tcpAllowOthers]       Allow other computers to connect - see below
# [-tcpDaemon]            Use a daemon thread
# [-tcpPort <port>]       The port (default: 9092)
# [-tcpSSL]               Use encrypted (SSL) connections
# [-tcpPassword <pwd>]    The password for shutting down a TCP server
# [-tcpShutdown "<url>"]  Stop the TCP server; example: tcp://localhost
# [-tcpShutdownForce]     Do not wait until all connections are closed
# [-pg]                   Start the PG server
# [-pgAllowOthers]        Allow other computers to connect - see below
# [-pgDaemon]             Use a daemon thread
# [-pgPort <port>]        The port (default: 5435)
# [-properties "<dir>"]   Server properties (default: ~, disable: null)
# [-baseDir <dir>]        The base directory for H2 databases (all servers)
# [-ifExists]             Only existing databases may be opened (all servers)
# [-ifNotExists]          Databases are created when accessed
# [-trace]                Print additional trace information (all servers)
# [-key <from> <to>]      Allows to map a database name to another (all servers)
# The options -xAllowOthers are potentially risky.
# For details, see Advanced Topics / Protection against Remote Access.
# See also https://h2database.com/javadoc/org/h2/tools/Server.html

# java -cp /opt/h2/bin/h2-1.4.200.jar org.h2.tools.Server -properties "~/.h2.server.properties" \
     # -baseDir "/opt/h2/data" \
	 # -web -webAllowOthers -webDaemon -webSSL -webPort 9092 -webAdminPassword h2
java -cp /opt/h2/bin/h2-1.4.200.jar org.h2.tools.Server -properties "~/.h2.server.properties" \
     -baseDir "/opt/h2/data" \
	 -tcp -tcpAllowOthers -tcpDaemon -tcpSSL -tcpPort 9092