<%@page import="java.util.Map"%>
<%@page import="com.learn.shopandcart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.shopandcart.entities.Category"%>
<%@page import="com.learn.shopandcart.helper.FactoryProvider"%>
<%@page import="com.learn.shopandcart.dao.CategoryDao"%>
<%@page import="com.learn.shopandcart.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;

    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin !! Do not access this page");
            response.sendRedirect("login.jsp");

            return;
        }
    }


%>
     <%
                                CategoryDao cdao=new CategoryDao(FactoryProvider.getfactory());
                                List<Category> list=cdao.getCategory();
                                //getting count
                                Map<String,Long> m=Helper.getCounts(FactoryProvider.getfactory());
                                %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%> 

        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-3">

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px"class="img-fluid rounded-circle" src="img/profile.png" alt="user_icon">
                            </div>
                            <h1><%=m.get("userCount")%></h1>

                            <h1 class="text-uppercase text-muted">Users</h1>

                        </div>
                    </div>  

                </div>
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px"class="img-fluid rounded-circle" src="img/order.png" alt="user_icon">
                            </div>
                            <h1><%=list.size()%></h1>

                            <h1 class="text-uppercase text-muted">Categories</h1>


                        </div>
                    </div>

                </div>
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px"class="img-fluid" src="img/survey.png" alt="user_icon">
                            </div>
                            <h1><%=m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>



                        </div>
                    </div>

                </div>

            </div>

            <div class="row mt-3">


                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px"class="img-fluid" src="img/admin.png" alt="user_icon">
                            </div>
                            <h1>1234</h1>
                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>



                        </div>
                    </div>


                </div>
                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px"class="img-fluid" src="img/product.png" alt="user_icon">
                            </div>
                            <h1>1234</h1>
                            <p class="mt-2">Click here to add new product</p>

                            <h1 class="text-uppercase text-muted"> Add Product</h1>



                        </div>
                    </div>

                </div>

            </div>
        </div>

        <!--add category-->



        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">


                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category Title" required/>


                            </div>
                            <div class="form-group">
                                <textarea style="height:300px"class="form-control " placeholder="Enter category description" name="catDescription" required></textarea>


                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>


                        </form>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>




        <!--End add category-->

        <!-- product modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct"/>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required>
                                
                                
                                
                            </div>
                            
                            <div class="form-group">
                                <textarea style="height:150px;"class="form-control" placeholder="Enter product description" name="pDesc"></textarea>
                                
                                
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product price" name="pPrice" required>
                                
                                
                                
                            </div>
                            
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required>
                                
                                
                                
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required>
                                
                                
                                
                            </div>
                           
                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    
                                    <%
                                        for(Category c:list)
                                        {
                                    %>
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                    <% }%>
                                </select>
                                
                                
                            </div>
                            <div class="form-group">
                                <label for="pPic">select Picture of Product</label>
                                <br>
                                <input type="file" name="pPic"required/>
                                
                                
                            </div>
                            
                            <!--submit button-->
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                
                            </div>
                    
                    
                            
                                
                            
                            
                            
                            
                            
                        </form>
                            
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- end product modal-->

        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
