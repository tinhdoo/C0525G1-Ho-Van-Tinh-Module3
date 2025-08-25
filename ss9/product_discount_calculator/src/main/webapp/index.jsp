<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="/calculate" method="post">
    <p>Nhập mô tả của sản phẩm: <input name="describe" type="text"></p>
    <p>Nhập giá niêm yết của sản phẩm: <input name="price" type="text"></p>
    <p>Nhập tỷ lệ chiết khấu: <input name="rate" type="text"></p>
    <button name="result">Calculate Discount</button>
</form>
</body>
</html>