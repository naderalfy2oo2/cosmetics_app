import 'package:cosmetics/models/productModel.dart';
import 'package:cosmetics/models/sliderModel.dart';
import 'package:cosmetics/views/cateories.dart';
import 'package:cosmetics/core/dio_helper.dart';
import 'package:cosmetics/views/profile.dart';
import 'package:cosmetics/views/shopping_cart.dart';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

List<SliderModel>? list;

class _HomeViewState extends State<HomeView> {
  Future<void> getData() async {
    final resp = await DioHelper.getData(path: "/api/Sliders");
    print(resp.data);
    list = (resp.data as List<dynamic>)
        .map((e) => SliderModel.fromJson(e))
        .toList();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    comeData();
  }

  List<ListProduct>? listData;
  Future<void> comeData() async {
    final response = await DioHelper.getData(path: "/api/Products");
    print(response.data);
    listData = (response.data as List<dynamic>)
        .map((e) => ListProduct.fromJson(e))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (list == null) {
      return const Center(child: CircularProgressIndicator());
    }
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
          // child: list == null
          //     ? CircularProgressIndicator()
          //     : Column(
          child: Column(
            children: [
              Stack(
                children: [
                  // Container(
                  //   width: double.infinity,
                  //   height: 300,

                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: NetworkImage(list![0].imageUrl),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: Image.network(
                      list![0].imageUrl,
                      fit: BoxFit.cover,

                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade200,
                          child: Center(
                            child: Icon(Icons.broken_image, size: 50),
                          ),
                        );
                      },
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
                itemCount: listData?.length ?? 0,

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
                  final product = listData![index];

                  return Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          product.imageUrl,

                          height: 169,
                          width: 161,

                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade200,
                              child: Center(
                                child: Icon(Icons.broken_image, size: 50),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        product.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Text(
                        "${product.price}",
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
                      'image':
                          'https://static.sayidaty.net/styles/900_scale/public/2021-10/4934.jpeg.webp',
                      'name': 'IDYLL Perfume',
                      'price': 1000,
                    },
                    {
                      'image':
                          'https://zynah.me/cdn/shop/products/InfinitySweetAlmondHandCream-ZYNAHEgypt.jpg?v=1665422408',
                      'name': 'Hand Cream',
                      'price': 120,
                    },
                    {
                      'image':
                          'https://sdcdn.io/mc/mc_sku_S65QY5_3000x3000_0S.png?options=BackgroundColor=F9F9F9&width=650px&height=750px',
                      'name': 'Pink Lipstick',
                      'price': 70,
                    },

                    {
                      'image':
                          'https://zynah.me/cdn/shop/files/HyaluCollagenCleansingFoam-ZYNAH.png?v=1722264580',
                      'name': 'Cleansing Foam',
                      'price': 48,
                    },
                  ];

                  return Column(
                    children: [
                      Expanded(
                        child: Image.network(
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
