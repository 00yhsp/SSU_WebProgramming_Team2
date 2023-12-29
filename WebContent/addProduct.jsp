<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
    <script type="text/javascript" src="./resources/js/validation.js"></script>
    <title>Insert title here</title>
</head>
<body>
    <fmt:setLocale value='<%=request.getParameter("language") %>'/>
    <fmt:bundle basename="bundle.message">
    <jsp:include page="menu.jsp"/>
    <div class="jumbotron">
        <div class="container text-center">
            <h1 class="display-3"><fmt:message key="title"/></h1>
        </div>
    </div>
    <div class="container w-75 mt-5">
        <div class="text-end mb-3">
		    <a href="?language=ko" class="mr-2">Korean</a>|<a href="?language=en" class="ml-2">English</a>
		</div>

        <form name="newProduct" action="./processAddProduct.jsp" method="post" enctype="multipart/form-data">
            <div class="form-group row mt-3">
                <label for="productId" class="col-sm-2 col-form-label"><fmt:message key="productId"/></label>
                <div class="col-sm-10">
                    <input type="text" id="productId" name="productId" class="form-control">
                </div>
            </div>
            <div class="form-group row mt-3">
                <label for="name" class="col-sm-2 col-form-label"><fmt:message key="pname"/></label>
                <div class="col-sm-10">
                    <input type="text" id="name" name="name" class="form-control">
                </div>
            </div>
            <div class="form-group row mt-3">
                <label for="unitPrice" class="col-sm-2 col-form-label"><fmt:message key="unitPrice"/></label>
                <div class="col-sm-10">
                    <input type="text" id="unitPrice" name="unitPrice" class="form-control">
                </div>
            </div>
            <div class="form-group row mt-3">
                <label for="description" class="col-sm-2 col-form-label"><fmt:message key="description"/></label>
                <div class="col-sm-10">
                    <textarea id="description" name="description" class="form-control" rows="3"></textarea>
                </div>
            </div>
            <div class="form-group row mt-3">
                <label for="phone" class="col-sm-2 col-form-label"><fmt:message key="phone"/></label>
                <div class="col-sm-10">
                    <input type="text" id="phone" name="phone" class="form-control">
                </div>
            </div>
            <div class="form-group row mt-3 d-none">
                <label for="password" class="col-sm-2 col-form-label"><fmt:message key="password"/></label>
                <div class="col-sm-10">
                    <input type="text" id="password" name="password" class="form-control" value="<%= session.getAttribute("userID") %>">
                </div>
            </div>
            <div class="form-group row mt-3">
                <label class="col-sm-2"><fmt:message key="category"/></label>
                <div class="col-sm-10">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="category" id="categoryElectronics" value="Electronics">
                        <label class="form-check-label" for="categoryElectronics"><fmt:message key="category_electronics"/></label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="category" id="categoryClothes" value="Clothes">
                        <label class="form-check-label" for="categoryClothes"><fmt:message key="category_clothes"/></label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="category" id="categoryFurnitures" value="Furnitures">
                        <label class="form-check-label" for="categoryFurnitures"><fmt:message key="category_furnitures"/></label>
                    </div>
                </div>
            </div>
            <div class="form-group row mt-3">
                <label for="productImage" class="col-sm-2 col-form-label"><fmt:message key="productImage"/></label>
                <div class="col-sm-10">
                    <input type="file" id="productImage" name="productImage" class="form-control-file">
                </div>
            </div>
            <div class="form-group row mt-3">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="<fmt:message key="button"/>">
                </div>
            </div>
        </form>
    </div>
    </fmt:bundle>
    <script src="./resources/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="./color_mode.jsp"/>
</body>
</html>