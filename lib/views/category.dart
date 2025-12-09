import 'package:cosmetics/views/shopping_cart.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Categories',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xff434C6D),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: Padding(padding: const EdgeInsets.all(8.0)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
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

              SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXL3tZdf1FNxqe9UAZm5-gfRJttAwN_xXTkQ&s',
                        height: 69,
                        width: 64,
                      ),

                      Text('Bundles'),
                      Spacer(),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.play_arrow),
                      ),
                    ],
                  ),
                ),
              ),

              Divider(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(
                      'https://perfume-egypt.com/cdn/shop/files/rn-image-picker_lib_temp_666b7330-e11f-4988-ab28-bde928dfaeef_533x.jpg?v=1725650241',
                      height: 69,
                      width: 64,
                    ),
                    SizedBox(width: 12),

                    Text('perfumes'),
                    Spacer(),

                    IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
                  ],
                ),
              ),

              Divider(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(
                      'https://glam.ph/cdn/shop/articles/shutterstock_1408306232.jpg?v=1730275754',
                      height: 69,
                      width: 64,
                    ),
                    SizedBox(width: 12),

                    Text('perfumes'),
                    Spacer(),

                    IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
                  ],
                ),
              ),

              Divider(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxp_1tiI2IPRFHDL9QahTt5cBhtM1hy-Q3eg&s',
                      height: 69,
                      width: 64,
                    ),
                    SizedBox(width: 12),

                    Text('Skin care'),

                    Spacer(),

                    IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
                  ],
                ),
              ),

              Divider(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc_ZdCK10zkP5bxbFMndRF-E33pCYY6ABgiw&s',
                      height: 69,
                      width: 64,
                    ),
                    SizedBox(width: 12),

                    Text('Gifts'),

                    Spacer(),

                    IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
                  ],
                ),
              ),

              Divider(),

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
                        child: Icon(Icons.home_filled, size: 30),
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
                          color: Colors.pinkAccent,
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
                        onTap: () {},
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
