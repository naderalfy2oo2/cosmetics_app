// import 'package:cosmetics/constants/app_image.dart';
// import 'package:cosmetics/widget/cartViews_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CartView extends StatefulWidget {
//   const CartView({super.key});

//   @override
//   State<CartView> createState() => _CartViewState();
// }

// class _CartViewState extends State<CartView> {
//   // final List<Map<String, dynamic>> items = [
//   //   {
//   //     "image": "notecosmetics.png",
//   //     "title": "Note Cosmetics",
//   //     "description": "Ultra rich mascara for lashes",
//   //     "price": "350 EGP",
//   //   },

//   //   {
//   //     "image": "bronzer.png",
//   //     "title": "ARTDECO",
//   //     "description": "Bronzer - 02 ",
//   //     "price": "490 EGP",
//   //   },

//   //   {
//   //     "image": "lespick.jpg",
//   //     "title": "Fendi",
//   //     "description": "Lipstick - shade 9",
//   //     "price": "260 EGP",
//   //   },

//   //   {
//   //     "image": "perfum.jpg",
//   //     "title": "Channel ",
//   //     "description": "L’eau de perfum N5",
//   //     "price": "15.000 EGP",
//   //   },
//   // ];

//    @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(backgroundColor: Color(0xffD9D9D9)),

//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   SizedBox(width: 124.w),
//                   Center(
//                     child: Text(
//                       'My Cart',

//                       style: TextStyle(
//                         color: Color(0xff434C6D),
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 98.w),

//                   IconButton(
//                     onPressed: () {},
//                     icon: AppImage(
//                       image: 'cart.png',
//                       width: 24.w,
//                       height: 24.h,
//                     ),
//                   ),
//                 ],
//               ),

//               Align(
//                 alignment: AlignmentGeometry.topLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Text(
//                     'You have 4 products in your cart',
//                     style: TextStyle(
//                       color: Color(0xff434C6D8C).withValues(alpha: 0.55),
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 34.h),

//               ListView.separated(
//                  itemCount: items.length,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   final item = items[index];
//                   return CartviewsWidget(
//                     image: item['image'],

//                     title: item['title'],
//                     description: item['description'],
//                     price: item['price'],
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return Divider(
//                     thickness: 1,
//                     color: Color(0xffB3B3C180).withValues(alpha: 0.5),
//                   );
//                 },

//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//??????

// import 'package:cosmetics/constants/app_image.dart';
// import 'package:cosmetics/models/cart_model.dart';
// import 'package:cosmetics/widget/cartViews_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../service/api_category.dart';

// class CartView extends StatefulWidget {
//   const CartView({super.key});

//   @override
//   State<CartView> createState() => _CartViewState();
// }

// class _CartViewState extends State<CartView> {
//   List<CartItem> items = [];

//   bool loading = true;

//   @override
//   void initState() {
//     super.initState();
//     loadCart();
//   }

//   Future loadCart() async {
//     loading = true;

//     setState(() {});

//     items = await CartService.getCart();

//     loading = false;

//     setState(() {});
//   }

//   void showMessage(String msg, Color color) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: color));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(backgroundColor: Color(0xffD9D9D9)),

//         body: loading
//             ? Center(child: CircularProgressIndicator())
//             : SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(width: 124.w),

//                         Text(
//                           "My Cart",
//                           style: TextStyle(
//                             color: Color(0xff434C6D),
//                             fontSize: 24,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),

//                         Spacer(),

//                         IconButton(
//                           onPressed: () {},
//                           icon: AppImage(
//                             image: "cart.png",
//                             width: 24.w,
//                             height: 24.h,
//                           ),
//                         ),
//                       ],
//                     ),

//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Padding(
//                         padding: EdgeInsets.all(16),
//                         child: Text(
//                           "You have ${items.length} products in your cart",
//                         ),
//                       ),
//                     ),

//                     ListView.separated(
//                       shrinkWrap: true,

//                       physics: NeverScrollableScrollPhysics(),

//                       itemCount: items.length,

//                       itemBuilder: (context, index) {
//                         final item = items[index];

//                         return CartviewsWidget(
//                           image: item.image,

//                           title: item.name,

//                           description: item.name,

//                           price: "${item.price}",

//                           quantity: item.quantity,

//                           onDelete: () async {
//                             await CartService.delete(item.productId);

//                             showMessage("Deleted", Colors.red);

//                             loadCart();
//                           },

//                           onPlus: () async {
//                             await CartService.update(
//                               item.productId,
//                               item.quantity + 1,
//                             );

//                             loadCart();
//                           },

//                           onMinus: () async {
//                             if (item.quantity > 1) {
//                               await CartService.update(
//                                 item.productId,
//                                 item.quantity - 1,
//                               );

//                               loadCart();
//                             }
//                           },
//                         );
//                       },

//                       separatorBuilder: (_, __) => Divider(),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import '../service/api_category.dart';
import '../widget/cartViews_widget.dart';

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
      appBar: AppBar(title: Text("My Cart")),

      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,

              itemBuilder: (context, index) {
                final item = items[index];

                // return CartViewWidget(
                //   image: item.image,
                //   title: item.name,
                //   description: item.name,
                //   price: "${item.price}",
                //   quantity: "${item.quantity}",

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

                    await CartService.update(item.productId, item.quantity + 1);
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
    );
  }
}
