
package dao;
import database.database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Transaction;


public class TransactionDAO {
        public boolean createTransaction(int userId, double amount, int status) {
            String sql = "INSERT INTO Transactions (user_id, amount, status, created_at) VALUES (?, ?, ?, GETDATE())";
            try (Connection conn = database.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, userId);
                ps.setDouble(2, amount);
                ps.setInt(3, status);
                return ps.executeUpdate() > 0;
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            return false;
        }

    public List<Transaction> getTransactionsByUser(int userId) {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * FROM Transactions WHERE user_id = ?";
        try (Connection conn = database.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                transactions.add(new Transaction(
                    rs.getInt("transaction_id"),
                    rs.getInt("user_id"),
                    rs.getDouble("amount"),
                    rs.getInt("status"),
                    rs.getTimestamp("created_at")
                ));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return transactions;
    }
}
