import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 230,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Color(0xffECA4C5)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),

                        const SizedBox(height: 70),
                      ],
                    ),

                    Positioned(
                      top: 150,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Center(
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/profile.jpg',
                                height: 96,
                                width: 96,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Sara Samer Talaat',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/edit_info.svg'),
                  Text('  Edit Info'),
                  SizedBox(width: 254),
                  Spacer(),

                  Icon(Icons.play_arrow),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/order_history.svg'),
                  Text(' Order History'),

                  Spacer(),

                  Icon(Icons.play_arrow),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/wallet.svg'),
                  Text(' Wallet'),

                  SizedBox(width: 254),

                  Spacer(),
                  Icon(Icons.play_arrow),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/settings.svg'),
                  Text(' Settings'),
                  SizedBox(width: 254),

                  Spacer(),

                  Icon(Icons.play_arrow),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/voucher.svg'),
                  Text(' Vocher'),
                  SizedBox(width: 254),
                  Spacer(),

                  Icon(Icons.play_arrow),
                ],
              ),

              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/logout.svg'),
                  Text(
                    ' LogOut',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 254),
                  Spacer(),
                ],
              ),

              SizedBox(height: 200),

              Padding(
                padding: const EdgeInsets.all(8),
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
                        onTap: () {},
                        child: Icon(
                          Icons.grid_view_rounded,
                          size: 30,
                          color: Colors.grey,
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
