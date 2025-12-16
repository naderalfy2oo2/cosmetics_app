import 'package:cosmetics/views/api_caregory.dart';

import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final api = ApiServices();
  List<CategoryData> category = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }

  Future<void> getCategories() async {
    category = await api.getCategories();
    setState(() {});
  }

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
        body: Column(
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

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Image.network(
                        category[index].image,
                        width: 64,
                        height: 69,
                      ),
                      SizedBox(width: 5),
                      Text(category[index].name),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.play_arrow),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Divider(),
                ),
                itemCount: category.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
