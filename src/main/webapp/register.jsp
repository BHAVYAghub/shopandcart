
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
           
                <%@include file="components/navbar.jsp"%>
                <div class="container-fluid">
                    
                <div class="row mt-5">
                    <div class="col-md-4 offset-md-4">
                       
                        <div class="card">
                            <%@include file="components/message.jsp"%>
                             <div class="card-body px-5">
                                <div class="container text-center">
                                    <img src="img/sig2.jpg" style="max-width: 200px;" class="img-fluid" alt="">
                                </div>
                                 <!--<h3 class="text-center">Sign Up !!</h3>-->
                                 <form action="RegisterServlet" method="post">
                            <div class="form-group">
                                <label for="name">Your Name</label>
                                <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here">
                               
                              </div> 
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter  here">
                               
                              </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter  here ">
                               
                              </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter  here ">
                               
                              </div>
                            <div class="form-group">
                                <label for="phone">Email</label>
                                <textarea name="user_address" style="height: 150px;" class="form-control" placeholder="Enter your address"></textarea>
                               
                              </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                <button class="btn btn-outline-warning">Reset</button>
                            </div>
                            
                        </form>
                       
                                
                            </div>
                            
                        </div> 
                    </div>
                </div>
                </div>
    </body>
</html>
