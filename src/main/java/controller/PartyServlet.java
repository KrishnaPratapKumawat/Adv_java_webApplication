package controller;

import Dao.PartyUserDao;
import Model.Party;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Register")
public class PartyServlet extends HttpServlet {
    private static final int serialVersionUID = 1;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NumberFormatException {

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


        try {
            Boolean pud = PartyUserDao.ValidateUser(party);

            RequestDispatcher rd;
            if (pud) {
                rd = req.getRequestDispatcher("Sucess.jsp");

            } else {
                rd = req.getRequestDispatcher("registration.jsp");


            }
            rd.forward(req, resp);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}

