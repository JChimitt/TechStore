<?php include '../view/header.php'; ?>
<?php
require('../model/database.php');
require('../model/product_db.php');
require('../model/category_db.php');
// Start session management with a persistent cookie
function final_sale($currentUser) {
   $user = get_user($currentUser);
   return $user;

}
$lifetime = 60 * 60 * 24 * 14;    // 2 weeks in seconds
session_set_cookie_params($lifetime, '/');
session_start();

// Create a cart array if needed
if (empty($_SESSION['cart12'])) { $_SESSION['cart12'] = array(); }

// Create a table of products
//$product_id = filter_input(INPUT_GET, 'product_id', 
            //FILTER_VALIDATE_INT);  
$products = get_all_products();
   

// Include cart functions
require_once('cart.php');

// Get the action to perform
$action = filter_input(INPUT_POST, 'action');
if ($action === NULL) {
    $action = filter_input(INPUT_GET, 'action');
    if ($action === NULL) {
        $action = 'show_add_item';
    }
}

// Add or update cart as needed
switch($action) {
    case 'add':
        $product_key = filter_input(INPUT_POST, 'productkey');
        $item_qty = filter_input(INPUT_POST, 'itemqty');
        add_item($product_key, $item_qty);
        include('cart_view.php');
        break;
    case 'update':
        $new_qty_list = filter_input(INPUT_POST, 'newqty', FILTER_DEFAULT, 
                                     FILTER_REQUIRE_ARRAY);
        foreach($new_qty_list as $key => $qty) {
            if ($_SESSION['cart12'][$key]['qty'] != $qty) {
                update_item($key, $qty);
            }
        }
        include('cart_view.php');
        break;
    case 'show_cart':
        include('cart_view.php');
        break;
    case 'show_add_item':
        include('add_item_view.php');
        break;
    case 'empty_cart':
        unset($_SESSION['cart12']);
        include('cart_view.php');
        break;
    case 'checkout':
        include('checkout.php');
        final_sale($currentUser);
        break;
    case 'checkout_sale':
        
}
?>
<?php include '../view/footer.php'; ?>
