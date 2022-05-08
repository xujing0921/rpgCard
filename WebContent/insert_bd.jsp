<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="Race-class.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rpg Card Generator</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<%
	//Crear un race aleatòriament
	Race nRace = new Race();
	nRace.iniAleatori();
	%>


	<h2>Creació personatge</h2>
	<h3>
		Valor generats:
		<%
	//Mostrar els valor de característiques amb FOR
	for (int i = 0; i < nRace.carac.length; i++) {
		if (i == nRace.carac.length - 1) {
			out.print(nRace.carac[i]);
		} else {
			out.print(nRace.carac[i] + ",  ");
		}
	}
	%>
	</h3>
	<!-- Form per enviar les dades modificades -->
	<form action="./insert_OK.jsp" method="post">
		<label for="nom">NOM:</label> 
		<input type="text" id="nom" name="nom" placeholder="no-Name"><br /> 
		<%
		for (int i = 0; i < nRace.caracs.length; i++) {
			out.print("<label for=\"" + nRace.caracs[i].toLowerCase() + "\">" + nRace.caracs[i].toUpperCase()
			+ ": </label> <input type=\"text\" id=\"" + nRace.caracs[i].toLowerCase() + "\"name=\"" + nRace.caracs[i].toLowerCase()
			+ "\" value=\"" + nRace.carac[i] + "\"><br>");
		}
		%>
		<input type="hidden" name="picture" value=<%="\"" + nRace.imatge + "\""%>>
		<input type="hidden" name="race" value=<%="\"" + nRace.race + "\""%>>
		<tr>
		
		<input type="submit" value="Reiniciar" formaction="./insert_bd.jsp">
		<input type="submit" value="Guardar">
	</form>

	<!-- Table que mostrar la carta actual de race -->
	<table border="1px solid black">
		<tr>
			<th colspan="2"><img src="<%=nRace.imatge%>" width="200"
				height="300"></th>
		</tr>
		<tr>
			<td colspan="2">Nom: <%=nRace.nom%></td>
		</tr>
		<tr>
			<td colspan="2">Nom_perso: <%=nRace.race%></td>
		</tr>
		<tr>
			<td colspan="2">PV: <%=nRace.pv%>
				<hr size="5" color="red" align="left" width="<%=nRace.pv*2.5%>" /></td>
		</tr>
		<tr>
			<td colspan="2">PM: <%=nRace.pm%>
				<hr size="5" color="blue" align="left" width="<%=nRace.pm*2.5%>"></td>
		</tr>

	<%
		for (int i = 0; i < (nRace.caracs.length / 2); i++) {
			out.print("<tr>");
			out.print("<td>" + nRace.caracs[i].toUpperCase().charAt(0) + nRace.caracs[i].substring(1).toLowerCase() + ": "
			+ nRace.carac[i] + "</td>");
			out.print("<td>" + nRace.caracs[i + 3].toUpperCase().charAt(0) + nRace.caracs[i + 3].substring(1).toLowerCase() + ": "
			+ nRace.carac[3 + i] + "</td>");
			out.print("</tr>");
		}
		%>
	</table>
</body>
</html>




