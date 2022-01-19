package controller;

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
import java.sql.Statement;

    @WebServlet("/delete")
    public class deleteServlet  extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
            int partyId = (int) session.getAttribute("partyId");
            System.out.println(partyId);
            if (session.getAttribute("username")!=null){
                partyId = (int) session.getAttribute("partyId");
                try{
                    Connection conn = DBConnection.createConnection();
                    String deleteQuery = "delete ul,pu from userlogin ul inner join partyuser pu  where ul.partyid = pu.partyid and pu.partyid = "+partyId;
                    try (Statement stmt = conn.createStatement()) {
                        stmt.executeUpdate(deleteQuery);
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                    session.invalidate();

                   RequestDispatcher rd = req.getRequestDispatcher("delete.html");
                   rd.include(req,resp);
                }catch (Exception e){
                    e.printStackTrace();
                }
            }

        }
    }


