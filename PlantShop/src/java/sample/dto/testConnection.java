/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dto;

import sample.dao.AccountDAO;
import java.io.Serializable;

/**
 *
 * @author user
 */
public class testConnection {
    public static void main(String[] args) throws Exception {
        //test login
        Account acc = AccountDAO.getAccount("test@gmail.com", "test");
        if(acc!=null){
            if(acc.getRole() == 1){
                System.out.println("I am an admin");
            }else{
                System.out.println("I am a user");
            }
        }else{
            System.out.println("Login fail");
        }
    }
}
