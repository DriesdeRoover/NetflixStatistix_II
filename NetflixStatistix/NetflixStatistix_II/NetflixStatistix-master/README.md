# NetflixStatistix
Avans Informatica - Programmeren II &amp; Databases II
This Application is created by Dries de Roover and Wesley de Jonge (2144101) as a project
for Avans Hogeschool Informatica courses Programmeren II and Relationele Databases II.

This project has been made for educational purposes and the images used within belong to their respectfull owners.

In order to use the database properly you need to run the "NetflixStatistix.sql" script in the master 
of the Microsoft SQL Server Management Studio.
The DatabaseConnection class automatically detects wether there is a "NetflixStatistix"-database or not, but the name of the program could
be diffirent to you. In order to fix that you have to change the "MSSQLSERVER" to the proper name. (Example of the line of code is underneath)

String connectionUrl = "jdbc:sqlserver://localhost\\MSSQLSERVER;databaseName=NetflixStatistix;integratedSecurity=true;";

To run the project you should add the Project-folder "NetflixStatistix-master" als project folder. Than you need to edit the project settings. Make sure you select the "src" folder as Source folder. Also provide a URL to the "out" folder.