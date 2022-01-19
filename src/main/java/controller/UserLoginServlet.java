package controller;

import Dao.UserLoginDao;
import Model.Party;
import Model.UserLogin;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class UserLoginServlet  extends HttpServlet {
    private static final int serialVersionUID = 1;



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String eMail = req.getParameter("username");
        String password = req.getParameter("password");

        UserLogin userlogin = new UserLogin();
        userlogin.setUserName(eMail);
        userlogin.setPassword(password);


        boolean Success = false;
        try {
            Success = UserLoginDao.validate(userlogin);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        

       
        if (Success){
            HttpSession httpSession = req.getSession(true);

            httpSession.setAttribute("username",userlogin.getUserName());
            httpSession.setAttribute("password",userlogin.getPassword());


            RequestDispatcher rd = req.getRequestDispatcher("Profile.jsp");


            rd.forward(req,resp);
        }else {
            RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
            rd.forward(req,resp);
        }




    }
}
