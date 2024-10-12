     
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>De Lua Store</title>
        <base href="${pageContext.request.contextPath}/">
        <!-- import CSS Bootstrap-->


        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/productdetail.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/header.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="header.jsp" flush="true" />

                <div class="product-container container ">
                    <div class="row">
                        <div class="product-img-container col-md-6">
                            <div class="main-img col-md-12 justify-content-center row">
                                <img src="assets/images/products/${listVariant[index].imagePath}"
                                     alt="Product Image">

                            </div>
                            <div class="img-choice-container justify-content-center col-md-12 row">
                                <c:forEach var="i" begin="0" end="${maxIndex}">
                                    <div class="img-choice col-md-3">
                                        <c:set var="variant" value="${listVariant[i]}" />
                                        <a href="./Product?action=detail&id=${variant.variantId}&index=${i}">
                                            <img src="assets/images/products/${variant.imagePath}" alt="">
                                        </a>
                                    </div>
                                </c:forEach>


                            </div>



                        </div>
                        <c:set var="variant" value="${listVariant[index]}" />
                        <div class="product-detail-container col-md-6">
                            <div class="product-title col-md-12">
                                <h1>
                                    ${variant.product.brand.brandName} 
                                    ${variant.product.productName}
                                    ${variant.color}
                                </h1>
                            </div>
                            <div class="rating-container col-md-12">
                                <!-- forEach -->

                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="rating-count">(10 reviews)</span>
                            </div>
                            <div class="product-description col-md-12">
                                <p>

                                </p>
                            </div>
                            <div class="product-color col-md-12">
                                <form action="./Cart" method="POST">
                                    <input name="action" type="hidden" value="addToCart">
                                    <c:set var="no" value="${1}"/>
                                    <label for="options">Select Variant:</label>
                                    <select id="options" name="id" class="form-control mx-2">
                                        <c:forEach var="variant" items="${listVariant}">
                                            <option value="${variant.variantId}">
                                               Color: ${variant.color} - RAM: ${variant.ram}GB, Storage: ${variant.storage}GB, Display: ${variant.display} inch- Price ${variant.price}$
                                            </option>
                                        </c:forEach>
                                    </select>

                                    <button  type="submit" class="btn btn-primary">Add to Cart</button>

                                </form>
                                <div class="container">
                                    <div class="header">
                                        <div class="category">Category: ${listVariant[index].product.category.categoryName} </div>
                                        <div class="share">
                                            Share:
                                            <a href="#"><img src="facebook-icon.png" alt="Facebook"></a>
                                            <a href="#"><img src="twitter-icon.png" alt="Twitter"></a>
                                            <a href="#"><img src="instagram-icon.png" alt="Instagram"></a>
                                            <a href="#"><img src="pinterest-icon.png" alt="Pinterest"></a>
                                        </div>
                                    </div>
                                    <div class="accordion">
                                        <div class="accordion-item">
                                            <input type="checkbox" id="section1">
                                            <label class="accordion-button" for="section1">Description</label>
                                            <div class="accordion-content">
                                                <p>${listVariant[index].product.description}</p>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <input type="checkbox" id="section2">
                                            <label class="accordion-button" for="section2">Technical detail</label>
                                            <div class="accordion-content">
                                                <p>There are ${listVariant.size()} options:</p>
                                                <hr>
                                                <c:forEach var="variant" items="${listVariant}">
                                                    <p>Ram: ${variant.ram} GB </p>
                                                    <p>Storage: ${variant.ram} GB</p>
                                                    <p>Display: ${variant.display} inch</p>
                                                    <hr>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <input type="checkbox" id="section3">
                                            <label class="accordion-button" for="section3">Shipping & Returns</label>
                                            <div class="accordion-content">
                                                <p><strong>Shipping Information:</strong></p>
                                                <ul>
                                                    <li>Processing Time: 1-2 business days</li>
                                                    <li>Standard Shipping: 5-7 business days</li>
                                                    <li>Expedited Shipping: 2-3 business days</li>
                                                    <li>Overnight Shipping: 1 business day</li>
                                                    <li>Free standard shipping on orders over $100</li>
                                                    <li>Tracking info provided after shipping</li>
                                                </ul>

                                                <p><strong>Returns Policy:</strong></p>
                                                <ul>
                                                    <li>Return within 30 days</li>
                                                    <li>Items must be in original condition</li>
                                                    <li>Non-returnable items: gift cards, downloadable software, some health items</li>
                                                    <li>Contact customer service to initiate a return</li>
                                                    <li>Refunds processed within 5-7 business days after inspection</li>
                                                    <li>Exchanges for defective or damaged items only</li>
                                                </ul>

                                                <p>For questions, contact support@delaustore.com or call +8438 9275 513  </p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>




                        </div>

                    </div>

                </div>

            </div>
        </div>


        <jsp:include page="/footer.jsp" flush="true" />


        <!--import JS Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://c dn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>

    </body>

</html>