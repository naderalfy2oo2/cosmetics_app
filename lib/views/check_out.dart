import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delievery to',
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
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

                    const SizedBox(width: 16),

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
                            'Mansoura, 14 Porsaid St',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      ),
                    ),

                    SvgPicture.asset('assets/icons/arrowright2.svg'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Payment Method',
                style: TextStyle(fontSize: 14, color: Color(0xff434C6D)),
              ),

              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/meza.svg'),
                    SizedBox(width: 7),
                    Text(
                      '**** **** **** 0256',
                      style: TextStyle(fontSize: 15, color: Color(0xff434C6D)),
                    ),
                    Spacer(),

                    SvgPicture.asset('assets/icons/arrowright2.svg'),
                  ],
                ),
              ),

              SizedBox(height: 12),

              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/voucher.svg'),

                    SizedBox(width: 7),

                    Text('Add vaucher'),

                    Spacer(),
                    ElevatedButton(
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
                  ],
                ),
              ),
              SizedBox(height: 32),

              LayoutBuilder(
                builder: (context, constraints) {
                  return Dash(
                    direction: Axis.horizontal,
                    length: constraints.maxWidth,
                    dashLength: 6,
                  );
                },
              ),
              SizedBox(height: 32),

              Text('- REVIEW PAYMENT'),
              SizedBox(height: 20),

              Text('PAYMENT SUMMARY', style: TextStyle(fontSize: 20)),

              Row(children: [Text('Subtotal'), Spacer(), Text('16.100 EGP')]),

              Row(
                children: [
                  Text('SHOPING FEES'),
                  Spacer(),
                  Text('TO BE CALCULATED'),
                ],
              ),

              Divider(),

              Row(
                children: [Text('TOTAL + VAT'), Spacer(), Text('16.100 EGP')],
              ),

              Center(
                child: SizedBox(
                  width: 268,
                  height: 65,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xffD75D72),
                      ),
                    ),
                    onPressed: () {},
                    label: Text('ORDER', style: TextStyle(color: Colors.white)),
                    icon: SvgPicture.asset('assets/icons/order.svg'),
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
