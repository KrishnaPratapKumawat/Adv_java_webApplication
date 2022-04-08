package com.hotwaxSystem.controller;

import Dao.PartyUserDao;
import Model.Party;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/verify")
public class VerifyOtp extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String code = req.getParameter("otp");
        HttpSession httpSession = req.getSession();
        Party party = (Party) httpSession.getAttribute("party");
        String otp = party.getOtp();


        PartyUserDao pUD = new PartyUserDao();

        if (code.equals(otp)) {
            System.out.println(otp);
            boolean result = false;
            try {
                result = pUD.ValidateUser(party);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            if (result) {
                RequestDispatcher rd = req.getRequestDispatcher("Sucess.jsp");
                rd.forward(req, resp);
                out.println("Success");

            }


        } else {
            out.println("error");
            RequestDispatcher rd = req.getRequestDispatcher("otpform.html");
            rd.forward(req, resp);
        }


    }
}
