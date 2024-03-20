<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allcdn.jsp"%>

</head>
<body>
	<jsp:include page="Profileheader.jsp"></jsp:include>
	<jsp:include page="menubar.jsp"></jsp:include>
	<%
	String name = (String) session.getAttribute("s_name");
	String email = (String) session.getAttribute("s_email");
	String gender = (String) session.getAttribute("s_gender");
	String feild = (String) session.getAttribute("s_feild");
	String city = (String) session.getAttribute("s_city");
	
	if(name==null || name.equals(""))
	{
		response.sendRedirect("login.jsp");
		
	}
	
	%>
 <div class="col-md-10">
                        <h3 style="color: blue"> <jsp:expression> name.toUpperCase()</jsp:expression> </h3>
                        <table>
                            <tr>
                                <td> <span style="color: #acaaaa"> Gender : </span> </td>
                                <td> <input type="text" value="<jsp:expression> gender</jsp:expression>" class="textfield_design" /> <br> <br> </td>
                            </tr>
                            <tr>
                                <td> <span style="color: #acaaaa"> City : </span> </td>
                                <td> <input type="text" value="<jsp:expression> city</jsp:expression>" class="textfield_design" /> <br> <br> </td>
                            </tr>
                            <tr>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td> <input type="submit" value="Update" class="btn btn-danger" /> </td>
                            </tr>
                        </table>
                         
                        </div>
                    </div>
                        <div class="row">
                            <div class="col-md-2"> </div>
                            <div class="col-md-10">
                                <h5> Education Details </h5>
                                <table>
                                    <tr>
                                        <td> School : </td>
                                        <td> <input type="text" value="" class="textfield_design" /> <br> <br> </td>
                                    </tr>
                                    <tr>
                                        <td> Year : </td>
                                        <td> <input type="text" value="" class="textfield_design" /> <br> <br> </td>
                                    </tr>
                                    <tr>
                                        <td> College : </td>
                                        <td> <input type="text" value="" class="textfield_design" /> <br> <br> </td>
                                    </tr>
                                    <tr>
                                        <td> Passing Year : </td>
                                        <td> <input type="text" value="" class="textfield_design" /> <br> <br> </td>
                                    </tr>
                                    <tr>
                                        <td> Experience : </td>
                                        <td> <input type="text" value="" class="textfield_design" /> <br> <br> </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td> <input type="submit" value="Update" class="btn btn-danger" /> </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                </div>
                      <jsp:include page="footer.jsp"></jsp:include>
                
</body>

</html>