import 'package:cosmetics/views/check_out.dart';
import 'package:cosmetics/widget/build_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckOutView()),
                );
              },
              child: Image.asset('assets/images/cart.png'),
            ),
          ],
          title: Text(
            'My Cart',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xff434C6D),
            ),
          ),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),

                Text(
                  'You have 4 products in your cart',
                  style: TextStyle(color: Color(0xff434C6D)),
                ),

                SizedBox(height: 20),

                buildCartItem(
                  image: 'assets/images/mascra.png',
                  title: "Note Cosmetics",
                  subtitle: "Ultra rich mascara for lashes",
                  price: "350 EGP",
                ),

                buildCartItem(
                  image: 'assets/images/branzor.png',
                  title: "ARTDECO",
                  subtitle: "Bronzer - 02",
                  price: "420 EGP",
                ),

                buildCartItem(
                  image: 'assets/images/per1.jpg',
                  title: "Fendi",
                  subtitle: "Lipstick - shade 9",
                  price: "260 EGP",
                ),

                buildCartItem(
                  image: 'assets/images/home4.jpg',
                  title: "Channel",
                  subtitle: "L’eau de perfum N5",
                  price: "15,000 EGP",
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffF7F7F7),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(Icons.home_filled, size: 30),
                        ),

                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.grid_view_rounded,
                            size: 30,
                            color: Colors.pinkAccent,
                          ),
                        ),

                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),

                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
