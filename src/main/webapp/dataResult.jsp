<%@page import="java.sql.DriverManager" %>
  <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.Statement" %>
      <%@page import="java.sql.ResultSet" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <link rel="stylesheet" href="result.css">
          <meta charset="UTF-8">
          <title>Search Page</title>
        </head>

        <body>
          <nav>
            <div class="logo">
              <img src="./images/hotwax-systems-logo_fe34b522273d8b9d6ef33253908487bf@2x.png" alt="" class="img">
            </div>
          </nav>
          <div class="col-lg-8 mx-auto p-3 py-md-5">


            <% String firstName=request.getParameter("firstName"); String lastName=request.getParameter("lastName");
              session.setAttribute("firstName",firstName); session.setAttribute("lastName",lastName); %>

              <% Connection connection=null; Statement statement=null; ResultSet resultSet=null; String
                url="jdbc:mysql://localhost:3306/userapp" ; // MySQL URL and followed by the Database name String
                username="root" ; // MySQL username String password="123456" ; // MySQL password try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Loading MySQL driver
                connection=DriverManager.getConnection(url, username, password); // Attempting to connect to MySQL
                Database System.out.println("Connection Established"); } catch (ClassNotFoundException exception) {
                exception.printStackTrace(); } %>

                <% try { connection=DriverManager.getConnection(url, username, password);
                  statement=connection.createStatement(); System.out.println(request.getParameter("firstName"));
                  System.out.println(request.getParameter("lastName")); String
                  firstname=request.getParameter("firstName"); String lastname=request.getParameter("lastName");
                  resultSet=statement.executeQuery("SELECT * FROM partyuser pu Join userlogin ul on
                  pu.partyid=ul.partyid WHERE firstname='"
                 + firstname + "' AND lastname='" + lastname + "'");
                  while(resultSet.next()) {
                %>
           <div>

<table class=" table">
                  <thead>
                    <tr>

                      <th scope="col">FirstName</th>
                      <th scope="col">LastName</th>
                      <th scope="col">City</th>
                      <th scope="col">Address</th>
                      <th scope="col">Zip</th>
                      <th scope="col">State</th>
                      <th scope="col">Country</th>
                      <th scope="col">Phone</th>
                      <th scope="col">username</th>

                    </tr>
                  </thead>
                  <tbody>

                    <tr>
                      <td>
                        <%=resultSet.getString("firstName")%>
                      </td>

                      <td>
                        <%=resultSet.getString("lastName")%>
                      </td>

                      <td>
                        <%=resultSet.getString("address")%>
                      </td>

                      <td>
                        <%=resultSet.getString("city")%>
                      </td>

                      <td>
                        <%=resultSet.getString("zip")%>
                      </td>

                      <td>
                        <%=resultSet.getString("state")%>
                      </td>

                      <td>
                        <%=resultSet.getString("country")%>
                      </td>

                      <td>
                        <%=resultSet.getString("phone")%>
                      </td>

                      <td>
                        <%=resultSet.getString("username")%>
                      </td>


                    </tr>

                  </tbody>
                  </table>

          </div>
          </div>
          </div>
          </div>

          <% } connection.close(); } catch (Exception exception) { exception.printStackTrace(); } %>

            </span>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
            </section>
            <div>
              <a href="Profile.jsp"> <button class="button">Back</button>
              </a>
            </div>
        </body>

        </html>