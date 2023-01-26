
    <main>
        <h1>Checkout</h1>
        <?php if (empty($_SESSION['cart12']) || 
                  count($_SESSION['cart12']) == 0) : ?>
            <p>There are no items in your cart.</p>
        <?php else: ?>
            <form action="." method="post">
            <input type="hidden" name="action" value="checkout_sale">
            <table>
                <tr id="cart_header">
                    <th class="left">Item</th>
                    <th class="right">Item Cost</th>
                    <th class="right">Quantity</th>
                    <th class="right">Item Total</th>
                </tr>

            <?php foreach( $_SESSION['cart12'] as $key => $item ) :
                $cost  = number_format($item['cost'],  2);
                $total = number_format($item['total'], 2);
            ?>
                <tr>
                    <td>
                        <?php echo $item['name']; ?>
                    </td>
                    <td class="right">
                        $<?php echo $cost; ?>
                    </td>
                    <td class="right">
                        <input type="text" class="cart_qty"
                            name="newqty[<?php echo $key; ?>]"
                            value="<?php echo $item['qty']; ?>">
                    </td>
                    <td class="right">
                        $<?php echo $total; ?>
                    </td>
                </tr>
            <?php endforeach; ?>
                <tr id="cart_footer">
                    <td colspan="3"><b>Subtotal</b></td>
                    <td>$<?php echo get_subtotal(); ?></td>
                </tr>
                
            </table>
            <form action="index.php" method="post" id="add_product_form">
        <input type="hidden" name="action" value="add_product">

        <label>User Info:</label>
       
        <br>

        <label>Username:</label>
        <input type="text" name="uname" value="<?php echo $user ?>"/>
        <br>

        <label>Email Address:</label>
        <input type="text" name="name" value="<?php echo $name ?>"/>
        <br>

        <label>First Name:</label>
        <input type="text" name="price" value="<?php echo $list_price ?>"/>
        <br>
        
        <label>Last Name:</label>
        <input type="text" name="uname" value="<?php echo $user ?>"/>
        <br>

        <label>Shipping Address:</label>
        <input type="text" name="name" value="<?php echo $name ?>"/>
        <br>

        <label>Billing Address:</label>
        <input type="text" name="price" value="<?php echo $list_price ?>"/>
        <br>

        <label>&nbsp;</label>
        <input type="hidden" name="product_id" value="<?php echo $product_id ?>">
        <br>
    </form>

            <input type="submit" value="Checkout">
            </form>
        <?php endif; ?>
        <p><a href="../usermenu.php">Main Page</a></p>
        <p><a href="index.php">Back</a></p>
    </main>
