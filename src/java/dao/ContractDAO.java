package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Contract;
import database.database;

public class ContractDAO {
    private Connection connection;

    public ContractDAO() throws ClassNotFoundException {
        connection = database.getConnection();
    }

    public void addContract(Contract contract) throws SQLException {
        String sql = "INSERT INTO Contract (contract_id, booking_id, tenant_id, landlord_id, creation_date, content, status, request_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, contract.getContractId());
            stmt.setInt(2, contract.getBookingId());
            stmt.setInt(3, contract.getTenantId());
            stmt.setInt(4, contract.getLandlordId());
            stmt.setDate(5, new java.sql.Date(contract.getCreationDate().getTime()));
            stmt.setString(6, contract.getContent());
            stmt.setString(7, contract.getStatus());
            stmt.setInt(8, contract.getRequestId());
            stmt.executeUpdate();
        }
    }

    public List<Contract> getAllContracts() throws SQLException {
        List<Contract> contracts = new ArrayList<>();
        String sql = "SELECT * FROM Contract";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Contract contract = new Contract(
                    rs.getInt("contract_id"),
                    rs.getInt("booking_id"),
                    rs.getInt("tenant_id"),
                    rs.getInt("landlord_id"),
                    rs.getDate("creation_date"),
                    rs.getString("content"),
                    rs.getString("status"),
                    rs.getInt("request_id")
                );
                contracts.add(contract);
            }
        }
        return contracts;
    }

    // Other CRUD operations can be added here
}
