//document.addEventListener('DOMContentLoaded', function() {
//    const productContainers = document.querySelectorAll('.product');
//
//    productContainers.forEach(function(container) {
//        const decrementButton = container.querySelector('.btn-decrement');
//        const incrementButton = container.querySelector('.btn-increment');
//        const quantityInput = container.querySelector('.quantity');
//
//        decrementButton.addEventListener('click', function(e) {
//            e.preventDefault(); // Ngăn chặn hành vi mặc định của button trong form
//            let currentValue = parseInt(quantityInput.value);
//            if (currentValue > 1) {
//                quantityInput.value = currentValue - 1;
//                updateTotal(container); // Cập nhật tổng tiền khi thay đổi số lượng
//            }
//        });
//
//        incrementButton.addEventListener('click', function(e) {
//            e.preventDefault(); // Ngăn chặn hành vi mặc định của button trong form
//            let currentValue = parseInt(quantityInput.value);
//            quantityInput.value = currentValue + 1;
//            updateTotal(container); // Cập nhật tổng tiền khi thay đổi số lượng
//        });
//    });
//
//    // Hàm cập nhật tổng tiền của từng sản phẩm
//    function updateTotal(container) {
//        const price = parseFloat(container.querySelector('.price').textContent.trim());
//        const discountedPrice = parseFloat(container.querySelector('.discounted-price').textContent.trim());
//        const quantity = parseInt(container.querySelector('.quantity').value);
//        const total = quantity * discountedPrice;
//        container.querySelector('.total').textContent = total.toFixed(2);
//    }
//});
