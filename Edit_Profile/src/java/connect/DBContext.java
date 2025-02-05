/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connect;

import static connect.Databaseinfor.driverName;
import static connect.Databaseinfor.pass;
import static connect.Databaseinfor.url;
import static connect.Databaseinfor.user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bebet
 */
public class DBContext {
    private static DBContext instance;

    public Connection openConnection() throws ClassNotFoundException {
        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(url, user, pass);
            return con;
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // get instance of database only one time
    public static DBContext getInstance() {
        if (instance == null) {
            instance = new DBContext();
        }
        return instance;
    }
}
