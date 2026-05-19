import 'package:cosmetics/models/category_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../service/dio_helper.dart';
import '../widget/categories_widget.dart';

class CateoriesView extends StatefulWidget {
  const CateoriesView({super.key});

  @override
  State<CateoriesView> createState() => _CateoriesViewState();
}

class _CateoriesViewState extends State<CateoriesView> {
  bool isLoading = false;
  String? errorMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }

  List<resultCategories> cate = [];

  Future<void> getCategories() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      var response = await DioHelper.getData(
        url: 'https://cosmatics.growfet.com/api/Categories',
      );
      List data = response.data;
      setState(
        () => cate = data.map((e) => resultCategories.fromJson(e)).toList(),
      );
    } on DioException {
      setState(() => errorMessage = "فشل تحميل البيانات ");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                      final item = cate[index];

                      return CategoriesWidget(
                        image: item.imageUrl,
                        title: item.titleEn,
                      );
                    },
                    itemCount: cate.length,
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
