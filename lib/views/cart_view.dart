import 'package:cosmetics/constants/app_image.dart';
import 'package:cosmetics/helper_methods.dart';
import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import '../service/api_category.dart';
import '../widget/cartViews_widget.dart';
import 'check_out.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<CartItem> items = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadCart();
  }

  // ================= LOAD CART =================

  Future loadCart() async {
    loading = true;
    setState(() {});

    final result = await CartService.getCart();

    if (result == null) {
      items = [];
    } else {
      items = result;
    }

    loading = false;
    setState(() {});
  }

  // ================= SNACKBAR =================

  void showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD9D9D9),
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Color(0xff434C6D),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              goTo(page: const CheckOutView());
            },
            icon: AppImage(image: 'cart.png'),
          ),
        ],
      ),

      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: AlignmentGeometry.topLeft,
                      child: Text(
                        'You have 4 products in your cart',
                        style: TextStyle(
                          color: Color(0xff434C6D8C).withValues(alpha: 0.55),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items.length,

                    itemBuilder: (context, index) {
                      final item = items[index];

                      return CartviewsWidget(
                        image: item.image,

                        title: item.name,

                        description: item.name,

                        price: "${item.price}",

                        quantity: item.quantity,

                        // ================= DELETE =================
                        onDelete: () async {
                          await CartService.delete(item.productId);

                          showMessage("Item Deleted", Colors.red);

                          loadCart();
                        },

                        // ================= PLUS =================
                        onPlus: () async {
                          setState(() {
                            items[index] = CartItem(
                              productId: item.productId,
                              name: item.name,
                              image: item.image,
                              price: item.price,
                              quantity: item.quantity + 1,
                            );
                          });

                          showMessage("Quantity Increased", Colors.green);

                          await CartService.update(
                            item.productId,
                            item.quantity + 1,
                          );
                        },

                        // ================= MINUS =================
                        onMinus: () async {
                          if (item.quantity > 1) {
                            setState(() {
                              items[index] = CartItem(
                                productId: item.productId,
                                name: item.name,
                                image: item.image,
                                price: item.price,
                                quantity: item.quantity - 1,
                              );
                            });

                            showMessage("Quantity Decreased", Colors.orange);

                            await CartService.update(
                              item.productId,
                              item.quantity - 1,
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
