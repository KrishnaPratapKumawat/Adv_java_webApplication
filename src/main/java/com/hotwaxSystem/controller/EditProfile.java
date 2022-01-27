package com.hotwaxSystem.controller;

import util.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/edit")
public class EditProfile extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        try{
            Connection conn = DBConnection.createConnection();

            int partyId = (int) session.getAttribute("partyId");
            String firstName = req.getParameter("firstName");
            String lastName  = req.getParameter("lastName");
            String address   = req.getParameter("address");
            String city      = req.getParameter("city");
            String zip       =  req.getParameter("zip");
            String state     =  req.getParameter("state");
            String country   =   req.getParameter("country");
            String phone     =    req.getParameter("phone");
            String UpdateQuery = "update partyuser set firstname =?, lastname =?, address = ?, city = ?, zip = ?, state =?, country = ?, phone = ? where partyId ="+partyId;
            System.out.println(partyId);
            System.out.println(firstName);
            PreparedStatement ps = conn.prepareStatement(UpdateQuery);
            ps.setString(1,firstName);
            ps.setString(2,lastName);
            ps.setString(3,address);
            ps.setString(4,city );
            ps.setString(5,zip);
            ps.setString(6, state);
            ps.setString(7,country);
            ps.setString(8, phone);

             ps.executeUpdate();
            RequestDispatcher rd = req.getRequestDispatcher("/Profile.jsp");
            rd.include(req,resp);
            conn.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
