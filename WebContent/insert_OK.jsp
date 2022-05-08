<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ include file="Race-class.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<%
	// variables per fer la connexio:
	String user = "m8";
	String password = "thos";
	String host = "localhost";
	String db = "races";
	String url = "jdbc:mysql://" + host + "/" + db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;

	// recollim valors formulari:
	String nom = request.getParameter("nom");

	String nrace = request.getParameter("race");
	String npicture = request.getParameter("picture");

	String fue = request.getParameter("fue");
	int nfue = Integer.parseInt(fue);
	String des = request.getParameter("des");
	int ndes = Integer.parseInt(des);
	String con = request.getParameter("con");
	int ncon = Integer.parseInt(con);
	String intt = request.getParameter("int");
	int nint = Integer.parseInt(intt);
	String sab = request.getParameter("sab");
	int nsab = Integer.parseInt(sab);
	String car = request.getParameter("car");
	int ncar = Integer.parseInt(car);

	int[] nCarac = { nfue, ndes, ncon, nint, nsab, ncar };

	Race raceClass = new Race();
	int npv = raceClass.canviarPV(nCarac);
	int npm = raceClass.canviarPM(nCarac);

	//Insert el race a la  bd
	try {

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
		int i = statement.executeUpdate(
		"insert into Carta(NOM_carta,PIC_carta,RACE_carta,FUE_carta,DES_carta,CON_carta,INT_carta,SAB_carta,CAR_carta,PV_carta,PM_carta)values('"
				+ nom + "','" + npicture + "','" + nrace + "'," + nfue + "," + ndes + "," + ncon + "," + nint + ","
				+ nsab + "," + ncar + "," + npv + "," + npm + ")");
		out.println("<p class=\"msg\">Data is successfully inserted!</p>");
	} catch (SQLException error) {
		out.print("Error de Conexión : " + error.toString());
	}
	%>


	<!-- Una carta que mostrar el race que has insertat -->
	<table border="1px solid black">
		<tr>
			<th colspan="2"><img src="<%=npicture%>" width="200"
				height="300"></th>
		</tr>
		<tr>
			<td colspan="2">Nom: <%=nom%></td>
		</tr>
		<tr>
			<td colspan="2">Nom_perso: <%=nrace%></td>
		</tr>
		<tr>
			<td colspan="2">PV: <%=npv%>
				<hr size="5" color="red" align="left" width="<%=npv * 2.5%>" /></td>
		</tr>
		<tr>
			<td colspan="2">PM: <%=npm%>
				<hr size="5" color="blue" align="left" width="<%=npm * 2.5%>"></td>
		</tr>

		<%
		for (int i = 0; i < (raceClass.caracs.length / 2); i++) {
			out.print("<tr>");
			out.print("<td>" + raceClass.caracs[i].toUpperCase().charAt(0) + raceClass.caracs[i].substring(1).toLowerCase()
			+ ": " + nCarac[i] + "</td>");
			out.print("<td>" + raceClass.caracs[i + 3].toUpperCase().charAt(0)
			+ raceClass.caracs[i + 3].substring(1).toLowerCase() + ": " + nCarac[3 + i] + "</td>");
			out.print("</tr>");
		}
		%>
	</table>

	<form>
		<input type="submit" value="OK" formaction="./index.jsp"> <br>
		<input type="submit" value="Tornar" formaction="./insert_bd.jsp">
	</form>

</body>
</html>