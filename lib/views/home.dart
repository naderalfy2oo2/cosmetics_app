import 'package:cosmetics/views/category.dart';
import 'package:cosmetics/views/profile.dart';
import 'package:cosmetics/views/shopping_cart.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'search',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/home.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "50% OFF DISCOUNT\nCUPON CODE : 125865",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff693C30),
                                ),
                              ),
                            ),

                            SizedBox(width: 60),

                            Image.asset('assets/images/discount.png'),
                          ],
                        ),

                        SizedBox(height: 60),

                        Row(
                          children: [
                            Image.asset('assets/images/discount.png'),

                            SizedBox(width: 150),
                            Expanded(
                              child: Text(
                                'Hurry up!\nSkin care only !',
                                style: TextStyle(
                                  color: Color(0xff434C6D),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  '  Top rated products',
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> products = [
                    {
                      'image': 'assets/images/home1.jpg',
                      'name': 'Face tint / lip tint',
                      'price': 99,
                    },
                    {
                      'image': 'assets/images/home2.jpg',
                      'name': 'Athe Red lipstick',
                      'price': 129,
                    },
                    {
                      'image': 'assets/images/home3.jpg',
                      'name': 'Mascara for lashes',
                      'price': 79,
                    },

                    {
                      'image': 'assets/images/home4.jpg',
                      'name': 'Mascara for lashes',
                      'price': 79,
                    },
                  ];

                  return Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          products[index]['image'],
                          height: 169,
                          width: 161,
                        ),
                      ),
                      Text(
                        products[index]['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Text(
                        "${products[index]['price']} EGP",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ],
                  );
                },
              ),

              SizedBox(height: 20),

              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  '  Most ordered Products',
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> products = [
                    {
                      'image': 'assets/images/pervin.jpg',
                      'name': 'IDYLL Perfume',
                      'price': 1000,
                    },
                    {
                      'image': 'assets/images/hand cream.jpg',
                      'name': 'Hand Cream',
                      'price': 120,
                    },
                    {
                      'image': 'assets/images/pen.jpg',
                      'name': 'Pink Lipstick',
                      'price': 70,
                    },

                    {
                      'image': 'assets/images/cream.jpg',
                      'name': 'Cleansing Foam',
                      'price': 48,
                    },
                  ];

                  return Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          products[index]['image'],
                          height: 169,
                          width: 161,
                        ),
                      ),
                      Text(
                        products[index]['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Text(
                        "${products[index]['price']} EGP",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ],
                  );
                },
              ),

              // BottomNavigationBar(

              //   selectedItemColor: Colors.pinkAccent,
              //   unselectedItemColor: Colors.blueAccent,

              //   items: [

              //     BottomNavigationBarItem(
              //       icon: IconButton(
              //         onPressed: () {},
              //         icon: Icon(Icons.home_filled),
              //       ),
              //       label: 'home',
              //     ),

              //     BottomNavigationBarItem(
              //       icon: IconButton(
              //         onPressed: () {},
              //         icon: Icon(Icons.category_rounded),
              //       ),
              //       label: 'Categories',
              //     ),

              //     BottomNavigationBarItem(
              //       icon: IconButton(
              //         onPressed: () {},
              //         icon: Icon(Icons.shopping_cart),
              //       ),
              //       label: 'shoping_cart',
              //     ),

              //     BottomNavigationBarItem(
              //       icon: IconButton(
              //         onPressed: () {},
              //         icon: Icon(Icons.person),
              //       ),
              //       label: 'person',
              //     ),
              //   ],
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
                        child: Icon(
                          Icons.home_filled,
                          size: 30,
                          color: Colors.pinkAccent,
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryView(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.grid_view_rounded,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShoppingCartView(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileView(),
                            ),
                          );
                        },
                        child: Icon(Icons.person, size: 30, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
