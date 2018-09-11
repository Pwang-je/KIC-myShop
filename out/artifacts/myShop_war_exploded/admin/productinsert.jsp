<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품 추가</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body>
<%@include file="admin_top.jsp"%>

<form action="productproc.jsp?flag=insert" enctype="multipart/form-data" method="post">

    <table style="width: 90%;">
        <tr>
            <td colspan="2">* 상품 등록 *</td>
        </tr>

        <tr>
            <td>상품명</td>
            <td><input type="text" name="name"></td>
        </tr>

        <tr>
            <td>가격</td>
            <td><input type="text" name="price"></td>
        </tr>

        <tr>
            <td>설명</td>
            <td><input type="text" name="detail"></td>
        </tr>

        <tr>
            <td>재고량</td>
            <td><input type="text" name="stock"></td>
        </tr>

        <tr>
            <td>이미지</td>
            <td><input type="file" name="image"></td>
        </tr>

        <tr>
            <td colspan="2" style="text-align: center;">
                <br>
                <input type="submit" value="상품 등록">
                <input type="reset" value="상품 새로입력">
            </td>
        </tr>
    </table>

</form>

<%@include file="admin_bottom.jsp"%>
</body>
</html>
