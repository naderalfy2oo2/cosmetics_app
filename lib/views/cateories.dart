import 'package:flutter/material.dart';
import 'package:cosmetics/service/api_category.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final api = ApiServices();

  List<CategoryData> category = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  Future<void> getCategories() async {
    try {
      category = await api.getCategories();
    } catch (e) {
      print(e);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: ListView.separated(
        itemCount: category.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = category[index];

          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: item.image.isNotEmpty
                  ? Image.network(
                      item.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.broken_image),
                    )
                  : const Icon(Icons.image_not_supported),
            ),
            title: Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
