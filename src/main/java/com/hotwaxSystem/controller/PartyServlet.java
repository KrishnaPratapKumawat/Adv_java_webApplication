package com.hotwaxSystem.controller;

import Dao.PartyUserDao;
import Model.Party;
import util.EmailVerify;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Register")
public class PartyServlet extends HttpServlet {
    private static final int serialVersionUID = 1;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NumberFormatException {
try{
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String address = req.getParameter("address");
        String city = req.getParameter("city");
        String zip = req.getParameter("zip");
        String state = req.getParameter("state");
        String country = req.getParameter("country");
        String phone = req.getParameter("phone");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Party party = new Party();
        party.setFirstName(firstName);
        party.setLastname(lastName);
        party.setAddress(address);
        party.setCity(city);
        party.setZip(zip);
        party.setState(state);
        party.setCountry(country);
        party.setPhone(phone);
        party.setUserName(username);
        party.setPassword(password);

        HttpSession httpSession= req.getSession();
              EmailVerify email = new EmailVerify();
              party.setOtp(email.SendOtp());
            boolean result = email.sendEmail(party);


            System.out.println("otp : "+party.getOtp());



            if (result){
                httpSession.setAttribute("party",party);
                RequestDispatcher rd = req.getRequestDispatcher("otpform.html");
                rd.forward(req,resp);
            }
            else {
                RequestDispatcher rd = req.getRequestDispatcher("registration.jsp");
                rd.forward(req,resp);
            }
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}

