// import 'package:cosmetics/views/home.dart';
// import 'package:flutter/material.dart';

// import '../views/cateories.dart';
// import '../views/profile.dart';
// import '../views/shopping_cart.dart' show ShoppingCartView;

// class NavigationBottomView extends StatefulWidget {
//   @override
//   _NavigationBottomViewState createState() => _NavigationBottomViewState();
// }

// class _NavigationBottomViewState extends State<NavigationBottomView> {
//   int _currentIndex = 0;

//   final List<Widget> _children = [
//     HomeView(),
//     ShoppingCartView(),
//     CategoryView(),
//     ProfileView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _children[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: onTabTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HomeView'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'CategoryView',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_basket),
//             label: 'ShoppingView',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PesonView'),
//         ],
//       ),
//     );
//   }

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }
