import 'package:cosmetics/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: Color.fromARGB(232, 188, 241, 244),

    //     appBar: AppBar(
    //       backgroundColor: Color(0xffD9D9D9),
    //       centerTitle: true,
    //       elevation: 100,
    //       surfaceTintColor: Colors.transparent,
    //       title: const Text(
    //         'CheckOut',
    //         style: TextStyle(color: Color(0xff434C6D)),
    //       ),
    //       leading: IconButton(
    //         onPressed: () {},
    //         icon: const Icon(Icons.arrow_back_ios, color: Color(0xff434C6D)),
    //       ),

    //       titleTextStyle: TextStyle(color: Color(0xff29D3DA1C)),
    //     ),

    //     body: SingleChildScrollView(
    //       padding: const EdgeInsets.all(16),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const Text(
    //             'Delievery to',
    //             style: TextStyle(
    //               color: Color(0xff434C6D),
    //               fontSize: 18,
    //               fontWeight: FontWeight.w600,
    //             ),
    //           ),
    //           SizedBox(height: 12.h),

    //           Container(
    //             width: double.infinity,
    //             height: 140.h,
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.circular(16),
    //             ),
    //             child: Row(
    //               children: [
    //                 Flexible(
    //                   child: GoogleMap(
    //                     initialCameraPosition: CameraPosition(
    //                       target: LatLng(31.0409, 31.3785),
    //                       zoom: 19,
    //                     ),
    //                   ),
    //                 ),

    //                 SizedBox(width: 16.w),

    //                 Expanded(
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: const [
    //                       Text(
    //                         'Home',
    //                         style: TextStyle(
    //                           color: Color(0xff434C6D),
    //                           fontSize: 18,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                       SizedBox(height: 6),
    //                       Text(
    //                         'Mansoura, 14 Porsaid St',
    //                         style: TextStyle(
    //                           color: Colors.grey,
    //                           fontSize: 15,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),

    //                 AppImage(image: 'arrow.svg'),
    //               ],
    //             ),
    //           ),

    //           SizedBox(height: 20.h),

    //           Text(
    //             'Payment Method',
    //             style: TextStyle(fontSize: 14, color: Color(0xff434C6D)),
    //           ),

    //           Container(
    //             width: double.infinity,
    //             height: 100.h,
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             child: Row(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(14),
    //                   child: AppImage(
    //                     image: 'meza.svg',
    //                     width: 30.w,
    //                     height: 20.h,
    //                   ),
    //                 ),
    //                 SizedBox(width: 7),
    //                 Text(
    //                   '**** **** **** 0256',
    //                   style: TextStyle(
    //                     fontSize: 15,
    //                     color: Color(0xff434C6D),
    //                   ),
    //                 ),
    //                 Spacer(),

    //                 AppImage(image: 'arrow.svg'),
    //               ],
    //             ),
    //           ),

    //           SizedBox(height: 12.h),

    //           Container(
    //             width: double.infinity,
    //             height: 100.h,
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             child: Row(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(12),
    //                   child: AppImage(
    //                     image: "voucher.svg",
    //                     width: 24.w,
    //                     height: 24.h,
    //                   ),
    //                 ),

    //                 SizedBox(width: 7.w),

    //                 Text('Add vaucher'),

    //                 Spacer(),
    //                 Padding(
    //                   padding: const EdgeInsets.all(12),
    //                   child: ElevatedButton(
    //                     style: ButtonStyle(
    //                       backgroundColor: WidgetStatePropertyAll(
    //                         Colors.pinkAccent,
    //                       ),
    //                     ),
    //                     onPressed: () {},
    //                     child: Text(
    //                       'Apply',
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           SizedBox(height: 32.h),

    //           LayoutBuilder(
    //             builder: (context, constraints) {
    //               return Dash(
    //                 direction: Axis.horizontal,
    //                 length: constraints.maxWidth,
    //                 dashLength: 6,
    //                 dashColor: Color(0xff434C6D4F).withValues(alpha: 0.31),
    //               );
    //             },
    //           ),
    //           SizedBox(height: 32.h),

    //           Text('- REVIEW PAYMENT'),
    //           SizedBox(height: 20.h),

    //           Text('PAYMENT SUMMARY', style: TextStyle(fontSize: 20)),

    //           Row(children: [Text('Subtotal'), Spacer(), Text('16.100 EGP')]),

    //           Row(
    //             children: [
    //               Text('SHOPING FEES'),
    //               Spacer(),
    //               Text('TO BE CALCULATED'),
    //             ],
    //           ),

    //           Divider(color: Color(0xff73B9BB)),

    //           Row(
    //             children: [Text('TOTAL + VAT'), Spacer(), Text('16.100 EGP')],
    //           ),

    //           Center(
    //             child: SizedBox(
    //               width: 268.w,
    //               height: 65.h,
    //               child: ElevatedButton.icon(
    //                 style: ButtonStyle(
    //                   backgroundColor: WidgetStatePropertyAll(
    //                     Color(0xffD75D72),
    //                   ),
    //                 ),
    //                 onPressed: () {},
    //                 label: Text(
    //                   'ORDER',
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //                 icon: AppImage(image: 'order.svg'),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD9D9D9),
        centerTitle: true,
        elevation: 100,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'CheckOut',
          style: TextStyle(color: Color(0xff434C6D)),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xff434C6D)),
        ),

        titleTextStyle: TextStyle(color: Color(0xff29D3DA1C)),
      ),
      body: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: Container(
            color: Color.fromARGB(232, 188, 241, 244),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Delievery to',
                    style: TextStyle(
                      color: Color(0xff434C6D),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 140.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Color(0xff73B9BB),
                      ),
                      color: Color.fromARGB(232, 188, 241, 244),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(31.0409, 31.3785),
                              zoom: 19,
                            ),
                          ),
                        ),

                        SizedBox(width: 16.w),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: Color(0xff434C6D),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Mansoura,14 Porsaid St',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),

                        AppImage(image: 'arrow.svg'),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(27),
                      child: Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff434C6D),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 100.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Color(0xff73B9BB),
                      ),
                      color: Color.fromARGB(232, 188, 241, 244),

                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: AppImage(
                            image: 'meza.svg',
                            width: 30.w,
                            height: 20.h,
                          ),
                        ),
                        SizedBox(width: 7),
                        Text(
                          '**** **** **** 0256',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff434C6D),
                          ),
                        ),
                        Spacer(),

                        AppImage(image: 'arrow.svg'),
                      ],
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 100.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Color(0xff73B9BB),
                      ),
                      color: Color.fromARGB(232, 188, 241, 244),

                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: AppImage(
                            image: "voucher.svg",
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),

                        SizedBox(width: 7.w),

                        Text('Add vaucher'),

                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.pinkAccent,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Apply',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Dash(
                        direction: Axis.horizontal,
                        length: constraints.maxWidth,
                        dashLength: 6,
                        dashColor: Color(0xff434C6D4F).withValues(alpha: 0.31),
                      );
                    },
                  ),
                  SizedBox(height: 10.h),

                  Align(
                    alignment: AlignmentGeometry.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(35),
                      child: Text('- REVIEW PAYMENT'),
                    ),
                  ),

                  Align(
                    alignment: AlignmentGeometry.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(35),
                      child: Text(
                        'PAYMENT SUMMARY',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(35),
                    child: Row(
                      children: [
                        Text('Subtotal'),
                        Spacer(),
                        Text('16.100 EGP'),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(35),
                    child: Row(
                      children: [
                        Text('SHOPING FEES'),
                        Spacer(),
                        Text('TO BE CALCULATED'),
                      ],
                    ),
                  ),

                  Divider(color: Color(0xff73B9BB)),

                  Padding(
                    padding: const EdgeInsets.all(35),
                    child: Row(
                      children: [
                        Text('TOTAL + VAT'),
                        Spacer(),
                        Text('16.100 EGP'),
                      ],
                    ),
                  ),

                  SizedBox(height: 35),

                  Center(
                    child: SizedBox(
                      width: 268.w,
                      height: 65.h,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0xffD75D72),
                          ),
                        ),
                        onPressed: () {},
                        label: Text(
                          'ORDER',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: AppImage(image: 'order.svg'),
                      ),
                    ),
                  ),

                  SizedBox(height: 11),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
