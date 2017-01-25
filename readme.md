# pg3Launch.sh - launch sql files in postgres via pgadmin3

* useful for right-clicking on sql files in file explorer to launch them
* gdialog asks for db params
* xdotool sends an F5 key to the pgadmin3 application to launch the query instantly

## dependancies
* a running postgres server to connect to
* pgadmin3

## usage
1. use from file explorer (example using nemo file explorer on ubuntu)
  * right-click on .sql file in file explorer
  * click "open with" -> "other application"
  * browse to pg3Launch.sh
  * if you want you can choose "set to default"
2. use from eclipse (as of Version: Neon.1 Release (4.6.1))
  * choose "Run" -> "external tools" -> "External Tools Configuration"
  * choose "Browse File System..." and choose pg3Launch.sh
  * in "Arguments" box add "${selected_resource_loc}"
