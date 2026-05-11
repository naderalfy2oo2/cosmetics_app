import 'package:cosmetics/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                          height: 230.h,
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
                              child: Image.network(
                                'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                height: 96.h,
                                width: 96.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
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
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: AppImage(image: 'edit_info.svg'),
                  ),
                  Text('  Edit Info'),
                  Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Icon(Icons.play_arrow),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: AppImage(image: 'order_history.svg'),
                  ),
                  Text(' Order History'),

                  Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Icon(Icons.play_arrow),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: AppImage(image: 'wallet.svg'),
                  ),
                  Text(' Wallet'),

                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Icon(Icons.play_arrow),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: AppImage(image: 'settings.svg'),
                  ),
                  Text(' Settings'),

                  Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Icon(Icons.play_arrow),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: AppImage(image: 'voucher.svg'),
                  ),
                  Text(' Vocher'),

                  Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Icon(Icons.play_arrow),
                  ),
                ],
              ),

              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: AppImage(image: 'logout.svg'),
                  ),
                  Text(
                    ' LogOut',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 254.w),
                  Spacer(),
                ],
              ),

              SizedBox(height: 200.h),
            ],
          ),
        ),
      ),
    );
  }
}
