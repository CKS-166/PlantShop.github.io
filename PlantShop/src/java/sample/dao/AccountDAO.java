/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import sample.dto.Account;
import sample.utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class AccountDAO {

    public static Account getAccount(String email, String pwd) throws Exception {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID, email, password, fullname, phone, status, role\n"
                        + "from dbo.Accounts\n"
                        + "where status=1 and email=? and password=? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, pwd);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    acc = new Account(AccID, Email, Password, Fullname, Phone, Status, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return acc;
    }

    public static Account getAccount(String token) throws Exception {
        Account acc = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID, email, password, fullname, phone, status, role\n"
                        + "from dbo.Accounts\n"
                        + "where token = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                ResultSet rs = pst.executeQuery();
                int AccID = rs.getInt("accID");
                String Email = rs.getString("email");
                String Password = rs.getString("password");
                String Fullname = rs.getString("fullname");
                String Phone = rs.getString("phone");
                int Status = rs.getInt("status");
                int Role = rs.getInt("role");
                acc = new Account(AccID, Email, Password, Fullname, Phone, Status, Role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return acc;
    }

    public static ArrayList<Account> getAccounts() throws Exception {
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID,email,password,fullname,phone,status,role "
                    + "from Accounts";
            Statement st = cn.createStatement();
            ResultSet table = st.executeQuery(sql);
            if (table != null) {
                while (table.next()) {
                    int accid = table.getInt("accID");
                    String email = table.getString("email");
                    String password = table.getString("password");
                    String fullname = table.getString("fullname");
                    String phone = table.getString("phone");
                    int status = table.getInt("status");
                    int role = table.getInt("role");
                    Account acc = new Account(accid, email, password, fullname, phone, status, role);
                    list.add(acc);
                }
            }
            cn.close();
        }
        return list;
    }

    public static int insertAccount(String email, String password, String fullname, String phone, int status, int role) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "insert dbo.Accounts(email, password, fullname, phone, status, role) values (?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            pst.setString(3, fullname);
            pst.setString(4, phone);
            pst.setInt(5, status);
            pst.setInt(6, role);
            result = pst.executeUpdate();
            cn.close();
        }
        return result;
    }

    public static int changeProfile(String email, String fullname, String phone) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update dbo.Accounts\n"
                    + "set fullname=?, phone=?\n"
                    + "where email=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, fullname);
            pst.setString(2, phone);
            pst.setString(3, email);
            result = pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    
    public static void updateAccountStatus(String email, int status) throws Exception {
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update Accounts\n"
                    + "set status=?\n"
                    + "where email=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setString(2, email);
            int result = pst.executeUpdate();
            cn.close();
        }

    }

    public static void updateToken(String token, String email) throws Exception {
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "UPDATE Accounts SET token=? WHERE email=?";
            pst = cn.prepareStatement(sql);
            pst.setString(1, token);
            pst.setString(2, email);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<Account> getSearchedAccount(String information) throws Exception {
        ArrayList<Account> list = new ArrayList<>();
        Account acc = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID,email,password,fullname,phone,status,role\n"
                    + "from Accounts\n"
                    + "where email LIKE ? or fullname LIKE ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + information + "%");
            pst.setString(2, "%" + information + "%");
            ResultSet table = pst.executeQuery();
            if (table != null && table.next()) {
                while(table.next()){
                int accid = table.getInt("accID");
                String email = table.getString("email");
                String password = table.getString("password");
                String fullname = table.getString("fullname");
                String phone = table.getString("phone");
                int status = table.getInt("status");
                int role = table.getInt("role");
                acc = new Account(accid, email, password, fullname, phone, status, role);
                list.add(acc);
                }
            }
            cn.close();
        }
        return list;
    }

}
