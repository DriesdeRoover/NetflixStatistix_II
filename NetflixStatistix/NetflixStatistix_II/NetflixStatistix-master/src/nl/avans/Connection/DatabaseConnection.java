package nl.avans.Connection;

import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;

public class DatabaseConnection {
    private static java.sql.Connection connection;// DatabaseConnection-data

    private String connectionUrl = "jdbc:sqlserver://localhost\\MSSQLSERVER;databaseName=NetflixStatistix;integratedSecurity=true;";

    //Responsible for connecting with the database
    public static void connect() {
        String connectionUrl = "jdbc:sqlserver://localhost\\MSSQLSERVER;databaseName=NetflixStatistix;integratedSecurity=true;";
        connection = null;


        try {
            // 'Import' the driver.
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            // Get a connection with the database.
            connection = DriverManager.getConnection(connectionUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Get data from the database using a given query
    public static ResultSet getData(String givenQuery) {
        ResultSet resultSet;
        Statement statement;

        try {
            //Create a SQL statement from a given query
            statement = connection.createStatement();
            resultSet = statement.executeQuery(givenQuery);
            return resultSet;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //disconnect from the database
    public static void disconnect()    {
        //Disconnect from the database
        if (connection != null)
            try {
                connection.close();
            } catch(Exception e){
                System.out.println(e.getStackTrace());
            }
    }

    //To retrieve the column names of a table in the database
    public static DatabaseMetaData getMetaData() throws Exception{
        DatabaseMetaData metadata = connection.getMetaData();
        return metadata;
    }

    private ResultSet resultSet = null;
    private Connection connect = null;
    private Statement statement = null;

    public ArrayList<Integer> getAccount(){

        ArrayList<Integer> email = new ArrayList<Integer>();

        try {
            // 'Import' the driver.
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            // Get a connection with the database.
            connect = DriverManager.getConnection(connectionUrl);
            String SQL = "SELECT * FROM  Account";
            statement = connect.createStatement();
            resultSet = statement.executeQuery(SQL);
            while (resultSet.next()){
                email.add(resultSet.getInt("Email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return email;
    }

    //Account toevoegen aan de SQL Table.
    public void createNewAccount(String Email, String Wachtwoord, String Voornaam,
                                 String Achternaam, String Straat, Integer Huisnummer,
                                 String Postcode, String Woonplaats, JFrame frame){
        Connection connect = null;
        Statement statement = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(connectionUrl);
            String SQL = "INSERT INTO Users VALUES ("+ Email +", '"+ Wachtwoord +"', '"+ Voornaam +"', '"
                    + Achternaam +"', "+ Straat +", '"+ Huisnummer +", '" + Postcode +", '"+ Woonplaats+"')";

            statement = connect.createStatement();
            statement.executeUpdate(SQL);
            JOptionPane.showMessageDialog(frame, "Je account is aangemaakt.");
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(frame, "De gegevens zijn niet correct ingevuld.");
        }
    }

    // Verwijderd account de SQL Table.
    public boolean removeAccount(JFrame frame, Object Email){
        Connection connect = null;
        Statement statement = null;
        Boolean result;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(connectionUrl);
            String SQL = "DELETE FROM Account WHERE Email = " + String.valueOf(Email);
            statement = connect.createStatement();
            statement.executeUpdate(SQL);

            JOptionPane.showMessageDialog(frame, "Account is verwijderd");
            result = true;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Account kan niet worden verwijderd");
            e.printStackTrace();
            result = false;
        } finally {
            try {
                statement.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    // Kan account waardes wijzigen vanuit ingevulde waardes naar de SQL Table.
    public boolean editAccount(JFrame frame, String Email, String Wachtwoord, String Voornaam, String Achternaam,
                               String Straat, Integer Huisnummer, String Postcode, String Woonplaats){
        ResultSet Result = null;
        Connection Connect = null;
        Statement statement = null;
        Boolean result;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connect = DriverManager.getConnection(connectionUrl);
            String SQL = "UPDATE Users SET Wachtwoord = '"+Wachtwoord+"', Voornaam = '"+Voornaam+
                    "', Achternaam = '"+Achternaam +"', Straat = '"+Straat+"', Huisnummer = '"+Huisnummer+
                    "', Postcode = '"+Postcode+ "', Woonplaats = '"+Woonplaats+"' WHERE Email = "+Email;

            statement = Connect.createStatement();
            statement.executeUpdate(SQL);

            JOptionPane.showMessageDialog(frame, "The user has been successfully Edited!");
            result = true;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "The user could not be edited!");
            e.printStackTrace();
            result = false;
        } finally {
            try {
                statement.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}