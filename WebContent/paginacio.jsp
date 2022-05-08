<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Rpg Card Generator</title>
<style type="text/css">
body {
	background: blue;
	color: white;
}

.breadcrumb {
	list-style: none;
}

.breadcrumb li {
	background-color: black;
	width: 150px;
	height: 30px;
	margin: 10px 0;
	font-size: 20px;
	padding: 5px;
	transition: all 0.8s;
}

.breadcrumb a, breadcrumb2>a {
	color: white;
	text-decoration: none;
}

.breadcrumb li:hover, .canviPag:hover, .breadcrumb2:hover {
	opacity: 0.8;
	transform: scale(0.8);
}

.canviPag, .breadcrumb2 {
	color: white;
	text-decoration: none;
	background-color: black;
	width: 200px;
	margin: 10px 20px;
	font-size: 20px;
	padding: 5px 15px;
	transition: all 0.8s;
}

table {
	float: left;
	width: 400px;
	height: 630px;
	margin: 100px 0px 100px 100px;
	font-size: 20px;
}

.breadcrumb2 {
	padding: 10px;
}

.breadcrumb2>a {
	color: white;
	text-decoration: none;
}
</style>
</head>
<body>
	<h1 class="titol">Visualitzar cartes</h1>
	<br>
	<%
	//  variables per fer la connexio:
	String user = "m8";
	String password = "thos";
	String host = "localhost";
	String db = "races";
	String url = "jdbc:mysql://" + host + "/" + db;
	Connection conn = null;
	Statement statement = null;
	Statement num_registres = null;
	ResultSet rs = null;
	ResultSet num_reg = null;
	int inicio;

	//Limito la busqueda
	int TAMANO_PAGINA = 4;

	//examino la página a mostrar y el inicio del registro a mostrar
	String pag = request.getParameter("pagina");
	int pagina = Integer.parseInt(pag);
	if (pagina == 0) {
		inicio = 0;
		pagina = 1;
	} else {
		inicio = (pagina - 1) * TAMANO_PAGINA;
	}

	/**
	//miro a ver el número total de campos que hay en la tabla con esa búsqueda
	**/
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, user, password);
	num_registres = conn.createStatement();
	//inmediatamente hacemos una consulta sencilla
	//creamos la consulta
	num_reg = num_registres.executeQuery("SELECT * FROM Carta");
	int num_total_registros = 0;
	while (num_reg.next()) {
		num_total_registros++;
	}

	//calculo el total de páginas
	int total_paginas = (int) Math.ceil(((double) num_total_registros / TAMANO_PAGINA));

	//pongo el número de registros total, el tamaño de página y la página que se muestra
	out.print("Nombre de registres trobats:" + num_total_registros + "<br>");
	//out.print("Es mostren pàgines de " + TAMANO_PAGINA + " registres cadascuna<br>");
	//out.print("Mostrant la pàgina " + pagina + " de " + total_paginas + "<p><br>");

	//Eliminar el race amb ExecuteUpdate
	//si té el valor de elimina
	if (request.getParameter("elimina") != null) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, user, password);
			num_registres = conn.createStatement();
			num_registres.executeUpdate("DELETE FROM Carta WHERE NOM_carta=\"" + request.getParameter("elimina") + "\"");
		} catch (SQLException error) {
			out.print("Error de Conexión : " + error.toString());
		}
	}
	%>
	<!-- Botons per tornar a inici i crear nava carta -->
	<ul class="breadcrumb">
		<li><a href="index.jsp">Inici</a></li>
		<li><a href="insert_bd.jsp">Nova Carta</a></li>
	</ul>
	<br>
	<%
	//Mostrar els índices
	//out.print("<a href=VisualitzarCartes.jsp?pagina=2>"+2+"</a> ");
	if (total_paginas > 1) {
		for (int i = 1; i <= total_paginas; i++) {
			if (pagina == i)
		//si muestro el índice de la página actual, no coloco enlace
		out.print(pagina);
			else
		//si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
		out.print(" <a class=\"canviPag\" href=paginacio.jsp?pagina=" + i + ">" + i + "</a> ");
		}
	}
	out.print("<br><br>");

	//Seleccionar * from Carta --> Mostra les cartes
	try {

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos una consulta sencilla
		//creamos la consulta
		String sentence = "SELECT * from Carta limit " + inicio + "," + TAMANO_PAGINA;
		rs = statement.executeQuery(sentence);
		//leemos la consulta
		while (rs.next()) {
			//mostramos los resultados obtenidos
			//out.println(rs.getString("ID_carta"));
			//String nom=request.getParameter("nom");
	%>

	<table border="1px solid black">
		<tr>
			<th colspan="2"><img
				src="<%out.print(rs.getString("PIC_carta"));%>" width="200"
				height="300"></th>
		</tr>
		<tr>
			<td colspan="2">Nom: <%out.print(rs.getString("NOM_carta"));%></td>
		</tr>
		<tr>
			<td colspan="2">Nom_perso: <%out.print(rs.getString("RACE_carta"));%></td>
		</tr>
		<tr>
			<td colspan="2">PV: <%out.print(rs.getString("PV_carta"));%>
				<hr size="5" color="red" align="left"
					width="<%out.print(Integer.parseInt(rs.getString("PV_carta")) * 2);%>" /></td>
		</tr>
		<tr>
			<td colspan="2">PM: <%out.print(rs.getString("PM_carta"));%>
				<hr size="5" color="blue" align="left"
					width="<%out.print(Integer.parseInt(rs.getString("PM_carta")) * 2);%>"></td>
		</tr>

		<tr>
			<td>FUE: <%out.print(rs.getString("FUE_carta"));%></td>
			<td>DES: <%out.print(rs.getString("DES_carta"));%></td>
		</tr>
		<tr>
			<td>CON: <%out.print(rs.getString("CON_carta"));%></td>
			<td>INT: <%out.print(rs.getString("INT_carta"));%></td>
		</tr>
		<tr>
			<td>SAB: <%out.print(rs.getString("SAB_carta"));%></td>
			<td>CAR: <%out.print(rs.getString("PV_carta"));%></td>
		</tr>
		<tr>
			<!-- Botón per editar el race -->
			<td class="breadcrumb2"><a href="insert_bd.jsp">Editar</a></td>
			<!-- Botón per eliminar un race concret -->
			<td class="breadcrumb2"><a
				href="paginacio.jsp?pagina=<%=pagina%>&elimina=<%=rs.getString("NOM_carta")%>">Eliminar</a></td>
		</tr>

	</table>

	<%
}
//cerramos la conexión
rs.close();
} catch (SQLException error) {
out.print("Error de Conexión : " + error.toString());
}
%>
</body>
</html>