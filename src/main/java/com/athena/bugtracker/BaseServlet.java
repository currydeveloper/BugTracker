package com.athena.bugtracker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/BaseServlet")
public class BaseServlet extends HttpServlet {
    private static final  String username="test";
   private static final  String password="test";
//TODO https://medium.com/@kasunpdh/session-management-in-java-using-servlet-filters-and-cookies-7c536b40448f
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reqUsername=request.getParameter("username");
        String reqPwd=request.getParameter("password");
        if(this.username.equals(reqUsername)&&this.password.equals(reqPwd)){
        HttpSession oldSession=request.getSession(false);
        if (null!=oldSession){
            oldSession.invalidate();
        }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        System.out.println("current session is "+session);
        if (null!=session&&!session.isNew()) {
            System.out.println("User is logged in");
        }
        else {
            System.out.println("User is not logged in");
        }
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h3>Hello World 1234!</h3>");
    }
}
