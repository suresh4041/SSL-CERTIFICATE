<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>GreenBus</h2>
	<table>
		<tr>
			<td>Enter Source:&nbsp;</td>
			<td><form:select path="placeMap">
					<form:option value="" label="...." />
					<form:options items="${placeMap}" />
				</form:select></td>
		</tr>
	</table>
</body>
</html>