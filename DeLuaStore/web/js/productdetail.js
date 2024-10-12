/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    // Ensure the correct label is active on load
    $('input[type="radio"]:checked').parent().addClass('active');

    // Toggle active class when a radio button is selected
    $('input[type="radio"]').change(function () {
        $('input[type="radio"]').parent().removeClass('active');
        if ($(this).is(':checked')) {
            $(this).parent().addClass('active');
        }
    });
});


