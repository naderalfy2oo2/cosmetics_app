import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/categories_widget.dart';

class CateoriesView extends StatefulWidget {
  const CateoriesView({super.key});

  @override
  State<CateoriesView> createState() => _CateoriesViewState();
}

class _CateoriesViewState extends State<CateoriesView> {
  final List<Map<String, dynamic>> items = [
    {"image": "bundles.jpg", "title": "Bundles"},

    {"image": "per.jpg", "title": "Perfumes"},

    {"image": "mekup.jpg", "title": "Makeup"},

    {"image": "skin_cure.jpg", "title": "skin_cure"},

    {"image": "gifts.jpg", "title": "gifts"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffD9D9D9)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),

            Center(
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Padding(
              padding: const EdgeInsets.all(13),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(22),
                  ),

                  labelText: 'Search',
                  labelStyle: TextStyle(
                    color: Color(0xff8E8EA9),

                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),

                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  suffixStyle: TextStyle(color: Color(0xff8E8EA9)),
                ),
              ),
            ),

            SizedBox(height: 32.h),

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = items[index];

                return CategoriesWidget(
                  image: item['image'],
                  title: item['title'],
                );
              },
              itemCount: items.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 1,
                  color: Color(0xffB3B3C180).withValues(alpha: 0.5),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
