<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="edu.ncsu.csc326.coffeemaker.*, edu.ncsu.csc326.coffeemaker.exceptions.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CoffeeMaker - Add Inventory</title>
<%@include file="head.jsp" %>
</head>
<body>
<div align=center class="font1">
<h1>CoffeeMaker</h1>
<h3>Add Inventory</h3>
<%
	String amtCoffee = request.getParameter("amtCoffee");
	String amtMilk = request.getParameter("amtMilk");
	String amtSugar = request.getParameter("amtSugar");
	String amtChocolate = request.getParameter("amtChocolate");
	
	CoffeeMaker cm = (CoffeeMaker)session.getAttribute("cm");
	
	if ((amtCoffee != null && !"null".equals(amtCoffee)) && (amtSugar != null && !"null".equals(amtSugar))&& (amtMilk != null && !"null".equals(amtMilk))&& (amtChocolate != null && !"null".equals(amtChocolate))) {
	
		try {				
			cm.addInventory(amtCoffee, amtMilk, amtSugar, amtChocolate);
%>
				<span class="font_success"><%="Inventory successfully added." %> </span><br>
				<%

		} catch (InventoryException e) {
			out.println("<span class=\"font_failure\">" + e.getMessage() + "<br>");
		}
	}

%>
<br>
<form method="post" action="add_inventory.jsp">
<table>
<tr>
<td><input type="text" name="amtCoffee"></td><td><span class="font1">Units Coffee</span></td>
</tr>
<tr>
<td><input type="text" name="amtMilk"></td><td><span class="font1">Units Milk</span></td>
</tr>
<tr>
<td><input type="text" name="amtSugar"></td><td><span class="font1">Units Sugar</span></td>
</tr>
<tr>
<td><input type="text" name="amtChocolate"></td><td><span class="font1">Units Chocolate</span></td>
</tr>
</table>
<input type="submit" value="Add Inventory!">
</form>
<br>
<br>
<a href="index.jsp"><span class="font1">Back to CoffeeMaker Menu</span></a>
</div>
</body>
</html>