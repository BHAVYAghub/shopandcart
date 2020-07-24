<%@page import="com.learn.shopandcart.helper.Helper"%>
<%@page import="com.learn.shopandcart.entities.Category"%>
<%@page import="com.learn.shopandcart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.shopandcart.entities.Product"%>
<%@page import="com.learn.shopandcart.dao.ProductDao"%>
<%-- 
    Document   : index
    Created on : 17-Jul-2020, 2:42:13 AM
    Author     : BHAVYA
--%>

<%@page import="com.learn.shopandcart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop And Cart</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">
                <%                String cat = request.getParameter("category");
                    //out.println(cat);

                    ProductDao dao = new ProductDao(FactoryProvider.getfactory());
                    List<Product> list = null;
                    int cid=-1;
                    if (cat==null||cat.trim().equals("all")) {
                        list = dao.getAllProducts();

                    } else {
                        cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);

                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getfactory());
                    List<Category> clist = cdao.getCategory();


                %>


                <!--show categories-->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <%if(cid==-1)
                        {
                        %>
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>
                        <%}
                            else
                            {
                        %>
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action">
                            All Products
                        </a>
                        <%}%>
                    </div>

                    <%   
                        
                        
                        for (Category c : clist) {
                            if((c.getCategoryId())==cid)
                            {
                    
                    %>





                    <a  href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action active"><%=c.getCategoryTitle()%></a>
                    <%}
                        else
{
                    

                    
                    %>
                                        <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

                    
                    <%
                        }
                        }
                    %>


                </div>
                    
                    
                <!--//show products-->
                <div class="col-md-10">
                    <div class="row mt-4">


                        <div class="col-md-12">
                            <div class="card-columns">


                                <%
                                    for (Product p : list) {
                                %>
                                <div class="card product-card">

                                    <div class="container text-center">

                                        <img style="max-height: 200px;max-width: 100%;width: auto;"src="img/products/<%=p.getpPhoto()%>" class="card-img-top mt-2" alt="...">

                                    </div>
                                    <div class="card-body">

                                        <h5 class="card-title"><%=p.getpName()%></h5>
                                        <p class="card-text">
                                            <%=Helper.get10Words(p.getpDesc())%>
                                        </p>

                                    </div>
                                    <div class="card-footer text-center">

                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterDiscount()%>)">Add to Cart</button>

                                        &nbsp;<button class="btn btn-outline-success">&#8377;<%=p.getPriceAfterDiscount()%>/- <span class="text-secondary discount-label"><strike> &#8377;<%=p.getpPrice()%></strike> <%= p.getpDiscount()+"% off"%></span></button>
        

                                    
                                    </div>
                                </div>





                                <%}
                                    if (list.size() == 0) {
                                       out.println("<H3>No Item In This Category</H3>");


                                    }

                                %>

                            </div>



                        </div>
                    </div>

                </div>



            </div>
        </div>
                                
                                
                                
                              <%@include file="components/common_modals.jsp"%>
                              
                              <h6><p style="text-align: right">Admin Contact: 6398706809</p></h6>
    </body>
</html>
