<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>
        table {
            border: 1px solid red;
            border-collapse: collapse;
            width: 80%;
            margin: auto;
        }
        th, td {
            border: 1px solid red;
            padding: 8px;
            text-align: center;
        }
        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="c" items="${customers}">
        <tr>
            <td>${c.name} </td>
            <td>${c.dobFormatted} </td>
            <td>${c.address} </td>
            <td><img src = "${c.img}" width = "80"> </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>