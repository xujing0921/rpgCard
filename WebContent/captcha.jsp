<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recaptcha</title>
<script src="https://www.google.com/recaptcha/api.js"></script>
</head>
<body>
	<form action="loginServlet.jsp" method="post">
		<table>
			<tbody>
				<tr>
					<td>usuari:</td>
					<td><input type="text" name="usuari"></td>
				</tr>
				<tr>
					<td>password:</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div class="g-recaptcha"
							data-sitekey="6LcA-9MfAAAAAL0T_m_pBy-NlwQRW98pkKgH-8bb"></div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Login"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>