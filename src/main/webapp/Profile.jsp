<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

  <%@page import="java.sql.*" %>
    <%@page import="java.sql.Connection" %>
      <%@page import="java.sql.DriverManager" %>
        <%@page import="java.sql.ResultSet" %>
          <%@page import="util.DBConnection" %>
            <%@page import="javax.servlet.http.*" %>



              <!DOCTYPE html>
              <html lang="en">

              <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Profile</title>
                <link rel="stylesheet" href="profile.css">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                  crossorigin="anonymous">
                   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

              </head>

              <body>
                <!-- Nav Bar -->
                <nav class="navbar navbar-dark bg-dark">
                  <div class="container">
                    <span class="navbar-brand mb-0 h1">Profile Page </span>
                    <div>
                      <a href="search.jsp" class="button">Search</a>
                  </div>
                      <div>
                      <a href="logout" class="button">Log-Out</a>
                  </div>
                  </div>
                </nav>


                <div class="col-lg-8 mx-auto p-3 py-md-5">


                  <header class="d-flex align-items-center pb-3 mb-5 border-bottom">
                    <span class="fs-4">Welcome to your Profile</span>
                    <br>
                  </header>
                  <% String username=(String) session.getAttribute("username"); String password=(String)
                    session.getAttribute("password"); String firstName="" ; String lastName="" ; String address="" ;
                    String city="" ; String zip="" ; String state="" ; String Country="" ; String phone="" ; String
                    partyId="" ; try { Connection conn=null; try { Class.forName("com.mysql.cj.jdbc.Driver");
                    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/userapp", "root" ,"123456");
                    System.out.println("profile Connection Established"); } catch (Exception e) { e.printStackTrace(); }
                    String profileQuery="select username, password from userlogin" ; Statement
                    stmt=conn.createStatement(); ResultSet rs=stmt.executeQuery(profileQuery); while(rs.next()){
                    if(rs.getString("username").equalsIgnoreCase(username) &&
                    rs.getString("Password").equals(password)){ String
                    userData="select * from partyuser natural join userlogin where username=?" ; PreparedStatement
                    ps=conn.prepareStatement(userData); ps.setString(1, username); ResultSet rs1=ps.executeQuery();
                    if(rs1.next()){ partyId=rs1.getString("partyId"); firstName=rs1.getString("firstName");
                    lastName=rs1.getString("lastName"); address=rs1.getString("address"); city=rs1.getString("city");
                    zip=rs1.getString("zip"); state=rs1.getString("state"); Country=rs1.getString("country");
                    phone=rs1.getString("phone"); } request.getSession();
                    session.setAttribute("partyId",Integer.parseInt(partyId));
                    session.setAttribute("username",username); session.setAttribute("password",password);
                    session.setAttribute("firstName",firstName); session.setAttribute("lastName",lastName);
                    session.setAttribute("address",address); session.setAttribute("city",city);
                    session.setAttribute("zip",zip); session.setAttribute("state",state);
                    session.setAttribute("country",Country); session.setAttribute("phone",phone); } } }catch (Exception
                    e){ e.printStackTrace(); } %>

                    <section class="vh-70" style="background: linear-gradient(365deg,#ffffff,#000000);">
                      <div class="container py-5 h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                          <div class="col col-xl-10">
                            <div class="card mb-5" style="border-radius: 15px;">
                              <div class="card-body p-4">
                                <div class="row">
                                  <div class="col-9">
                                    <h3 class="mb-3">
                                      <%= firstName%>
                                        <%= lastName%>
                                    </h3>
                                  </div>
                                  <div class="col-1">

                                    <button type="button" class="btn btn-warning btn-sm" id="button"
                                      data-bs-toggle="modal" data-bs-target="#editModal"
                                      data-bs-whatever="@getbootstrap">Edit</button>
                                    <div class="modal fade" id="editModal" tabindex="-1"
                                      aria-labelledby="exampleModalLabel" aria-hidden="true">
                                      <div class="modal-dialog">
                                        <div class="modal-content">
                                          <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Edit Profile</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                              aria-label="Close"></button>
                                          </div>
                                          <div class="modal-body">
                                            <form action="/edit" style="align-items: center;" method="post">
                                              <div class="col-md-12">
                                                <label for="inputFirstName4" class="form-label">First Name</label>
                                                <input type="text" class="form-control" id="inputFirstName"
                                                  name="firstName" placeholder="firstName" value=<%=firstName%>>
                                              </div>
                                              <div class="col-md-12">
                                                <label for="inputLastName4" class="form-label">Last Name</label>
                                                <input type="text" class="form-control" id="inputLastName"
                                                  name="lastName" placeholder="lastName" value=<%=lastName%> required>
                                              </div>
                                              <div class="col-md-12">
                                                <label for="inputLastName4" class="form-label">Address</label>
                                                <input type="text" class="form-control" id="inputAddress" name="address"
                                                  placeholder="Address" value=<%=address%> required>
                                              </div>


                                              <div class="col-md-12">
                                                <label for="inputCity" class="form-label">City</label>
                                                <input type="text" class="form-control" id="inputCity" name="city"
                                                  value=<%=city%>>
                                              </div>
                                              <div class="col-md-12">
                                                <label for="inputState" class="form-label">State</label>
                                                <input type="text" class="form-control" id="inputState" name="state"
                                                  value=<%=state%> >
                                              </div>
                                              <div class="col-md-12">
                                                <label for="inputZip" class="form-label">Zip</label>
                                                <input type="text" class="form-control" name="zip" id="inputZip"
                                                  value=<%=zip%> >
                                              </div>
                                              <div class="col-12">
                                                <label for="inputAddress" class="form-label">Country</label>
                                                <input type="text" class="form-control" id="inputAddress" name="country"
                                                  value=<%=Country%> >
                                              </div>
                                              <div class="col-md-12">
                                                <label for="inputFirstName4" class="form-label">Phone</label>
                                                <input type="text" class="form-control" name="phone"
                                                  placeholder="+91 77xxxxxx" value=<%=phone%> >
                                              </div>

                                          </div>
                                          <div class="modal-footer">
                                            <button type="submit" class="btn btn-secondary"
                                              data-bs-dismiss="modal">save</button>

                                          </div>
                                          </form>
                                        </div>
                                      </div>
                                    </div>
                                    <!-- Edit Modal Close -->

                                  </div>
                                  <div class="col-2">
                                    <!-- Delete Button modal -->
                                    <form action="/delete" method="post">
                                      <button type="button" class="btn btn-danger btn-sm" id="button"
                                      data-bs-toggle="modal"  data-bs-target="#deleteModal">
                                        Delete
                                      </button>
                                        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                <div class="modal-content">
                                                               <div class="modal-header">
                                                             <h5 class="modal-title" id="exampleModalLabel">Delete Profile</h5>
                                                          <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                          aria-label="Close"></button>
                                                        </div>
                                                      <div class="modal-body">
                                                   <h3> Are you sure...?</h3>
                                                   <h5>Once deleted, you will not be able to recover this imaginary file!</h5>
                                                  </div>
                                               <div class="modal-footer">
                                              <button type="button" class="btn btn-secondary btn-sm"
                                           data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-secondary btn-sm"
                                              data-bs-dismiss="modal">Delete</button>

                                        </div>
                                       </div>
                                     </div>
                                  </div>
                               </div>
                                </div>
                              </div>


                            </div>
                          </div>
                          <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2">|</span> username:

                            <strong>
                              <%=username%>
                            </strong>
                          </p>
                          <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2">|</span> Phone:
                            <strong>
                              <%=phone%>
                            </strong>
                          </p>
                          <hr class="my-4">
                          <div class="d-flex justify-content-start align-items-center">
                            <p class="mb-0 text-uppercase"><i class="fas fa-cog me-2"></i> <span
                                class="text-muted small">
                                <%=city%>
                              </span></p>
                            <p class="mb-0 text-uppercase"><i class="fas fa-cog me-2"></i> <span
                                class="text-muted small">
                                <%=zip%>
                              </span></p>
                            <p class="mb-0 text-uppercase"><i class="fas fa-link ms-4 me-2"></i> <span
                                class="text-muted small">
                                <%=state%>
                              </span></p>
                            <p class="mb-0 text-uppercase"><i class="fas fa-ellipsis-h ms-4 me-2"></i> <span
                                class="text-muted small">
                                <%= Country%>

                              </span>
                          </div>
                        </div>
                      </div>
                </div>
                </div>
                </div>
                </section>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                  integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                  crossorigin="anonymous"></script>



              </body>

              </html>