/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connect;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bebet
 */
public class TestDB {

    public static void main(String[] args) {
        DBContext connect = new DBContext();
        try {
            System.out.println(connect.openConnection());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
