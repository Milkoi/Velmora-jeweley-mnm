<?php
/*
Plugin Name: Test2K Coupon
Description: Thêm mã giảm giá TEST2K để test PayOS.
*/

// Tạo mã giảm giá ảo tên là TEST2K
add_filter( 'woocommerce_get_shop_coupon_data', 'virtual_test2k_coupon', 10, 2 );
function virtual_test2k_coupon( $false, $data ) {
    if ( strcasecmp( $data, 'TEST2K' ) === 0 ) {
        $coupon = array(
            'id' => 999999999,
            'amount' => 0,
            'discount_type' => 'fixed_cart',
            'description' => 'Mã giảm giá test PayOS (Còn 2000đ)',
        );
        return $coupon;
    }
    return $false;
}

// Tính toán lại giỏ hàng còn đúng 2000đ nếu có nhập mã TEST2K
add_action( 'woocommerce_cart_calculate_fees', 'apply_test2k_discount', 999 );
function apply_test2k_discount( $cart ) {
    if ( is_admin() && ! defined( 'DOING_AJAX' ) ) {
        return;
    }

    if ( $cart->has_discount( 'test2k' ) ) {
        $total = $cart->get_subtotal() + $cart->get_shipping_total();
        if ( $total > 2000 ) {
            $discount = $total - 2000;
            $cart->add_fee( 'Mã giảm giá đặc biệt (TEST2K)', -$discount, false );
        }
    }
}
