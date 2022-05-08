<!--<%@ page import="java.util.*"%>-->
<!--<%@page import="java.util.Arrays"%>-->
<!--<%@ page import="java.sql.*"%>-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rpg Card Generator</title>
<style type="text/css">
body {
    background: purple;
}

.ini {
    margin: 50px;
}

h1 {
    color: white;
    width: 50%;
    padding: 5px 10px;
}

button {
    padding: 5px;
    border: 1px solid black;
    background-color: black;
    border-radius: 50%;
    width: 70px;
    height: 70px;
    transition: all 0.8s;
}

button a {
    color: purple;
    text-decoration: none;
    font-size: 18px;
}

button:hover {
    opacity: 0.8;
    transform: scale(0.8);
}

button:last-child {
    margin-left: 70px;
}

.img img {
    animation-name: rotates;
    animation-duration: 20s;
    animation-iteration-count: infinite;
}

@keyframes rotates {
    0% {
        transform: rotateY(0deg);
    }
    25% {
        transform: rotateY ( 360deg);
    }
    50% {
        transform: rotateX ( 0deg);
    }
    75% {
        transform: rotateX ( 360deg);
    }
    100% {
        transform: rotateY ( 0deg);
    }
}
</style>
</head>
<body>
	<div class="ini">
		<h1>Rpg Card Generator</h1>
		<button><a href=insert_bd.jsp>Crear</a></button>
		<button><a href=paginacio.jsp?pagina=0>Vista</a></button>
	</div>

	<div class="img">
		<%
		for (int i = 0; i <= 5; i++) {
			out.print("<img src=\"./img-races/" + i + ".png\" width=\"200\" height=\"300\"/>");
		}
		%>
	</div>
</body>
</html>