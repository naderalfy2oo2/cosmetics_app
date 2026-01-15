import 'package:cosmetics/components/app_Image.dart';
import 'package:cosmetics/views/api_login.dart';
import 'package:cosmetics/views/home.dart';
import 'package:cosmetics/widget/dropdown_Button.dart';
import 'package:flutter/material.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController Phone_Controller = TextEditingController();
  final TextEditingController Password_Controller = TextEditingController();
  List<String> Phone = ['+02', '+099', '+0123'];

  String currentPhone = '+02';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _fromKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset('assets/images/login.png'),
                  AppImage(image: "login.png"),

                  SizedBox(height: 25),
                  Text(
                    'Login Now',
                    style: TextStyle(
                      color: Color(0xff434C6D),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 14),

                  Text(
                    'Please enter the details below to continue',
                    style: TextStyle(color: Color(0xff8E8EA9)),
                  ),

                  SizedBox(height: 41),

                  Row(
                    children: [
                      DropdownButtonPhone(
                        phones: Phone,
                        initialValue: currentPhone,
                        onChanged: (value) {
                          currentPhone = value;
                        },
                      ),

                      SizedBox(width: 6),
                      Flexible(
                        child: SizedBox(
                          height: 46,
                          width: 285,
                          child: TextFormField(
                            controller: Phone_Controller,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffD9D9D9),
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter PhoneNumber';
                              }
                              if (value.length < 8) {
                                return 'inCorret PhoneNumber';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),

                  Center(
                    child: SizedBox(
                      width: 364,
                      height: 47,
                      child: TextFormField(
                        controller: Password_Controller,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Your Password',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(style: BorderStyle.solid),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.visibility_off),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Password';
                          }
                          if (value.length < 6) {
                            return 'Enter ShortPassword';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

<<<<<<< HEAD
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: TextButton(
=======
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.pinkAccent),
                    ),
                  ),
                ),

                SizedBox(height: 43),

                SizedBox(
                  width: 268,
                  height: 65,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xffD75D72),
                      ),
                    ),
                    onPressed: () {
                      Navigator. pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    },
                    child: Text('Login', style: TextStyle(color: Colors.white)),
                  ),
                ),

                SizedBox(height: 86),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account?'),

                    TextButton(
>>>>>>> 43d7b5a3f664d9f95ebdaaa980693fdd92657280
                      onPressed: () {},
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                    ),
                  ),

                  SizedBox(height: 43),

                  SizedBox(
                    width: 268,
                    height: 65,

                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                              if (!_fromKey.currentState!.validate()) return;
                              setState(() {
                                isLoading = true;
                              });

                              final result = await LoginApi.login(
                                countryCode: currentPhone,
                                phoneNumber: Phone_Controller.text.trim(),
                                password: Password_Controller.text.trim(),
                              );
                              setState(() {
                                isLoading = false;
                              });
                              if (result == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'numberPhone And Password Incorrect',
                                    ),
                                  ),
                                );
                                return;
                              }

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeView(),
                                ),
                                (route) => false,
                              );
                            },
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.pinkAccent,
                            )
                          : const Text('Login'),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an account?'),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register',
                          style: TextStyle(color: Color(0xffD75D72)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:cosmetics/views/home.dart';
// import 'package:flutter/material.dart';
// import 'package:cosmetics/views/api_login.dart';

// class Loginview extends StatefulWidget {
//   const Loginview({super.key});

//   @override
//   State<Loginview> createState() => _LoginviewState();
// }

// class _LoginviewState extends State<Loginview> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   List<String> phoneCodes = ['+02', '+099', '+0123'];
//   String currentPhone = '+02';

//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Center(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 40),

//                   Image.asset('assets/images/login.png'),

//                   const SizedBox(height: 25),
//                   const Text(
//                     'Login Now',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),

//                   const SizedBox(height: 10),
//                   const Text(
//                     'Please enter the details below to continue',
//                     style: TextStyle(color: Colors.grey),
//                   ),

//                   const SizedBox(height: 30),

//                   /// PHONE + COUNTRY CODE
//                   Row(
//                     children: [
//                       const SizedBox(width: 16),

//                       DropdownButton<String>(
//                         value: currentPhone,
//                         items: phoneCodes
//                             .map(
//                               (e) => DropdownMenuItem(value: e, child: Text(e)),
//                             )
//                             .toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             currentPhone = value!;
//                           });
//                         },
//                       ),

//                       const SizedBox(width: 10),

//                       Expanded(
//                         child: TextFormField(
//                           controller: phoneController,
//                           keyboardType: TextInputType.phone,
//                           decoration: const InputDecoration(
//                             labelText: 'Phone Number',
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'ادخل رقم الهاتف';
//                             }
//                             if (value.length < 8) {
//                               return 'رقم الهاتف غير صحيح';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),

//                       const SizedBox(width: 16),
//                     ],
//                   ),

//                   const SizedBox(height: 15),

//                   /// PASSWORD
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: TextFormField(
//                       controller: passwordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: 'Password',
//                         border: OutlineInputBorder(),
//                         suffixIcon: Icon(Icons.visibility_off),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'ادخل كلمة المرور';
//                         }
//                         if (value.length < 6) {
//                           return 'كلمة المرور قصيرة';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// LOGIN BUTTON
//                   SizedBox(
//                     width: 260,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: isLoading
//                           ? null
//                           : () async {
//                               if (!_formKey.currentState!.validate()) return;

//                               setState(() {
//                                 isLoading = true;
//                               });

//                               final result = await LoginApi.login(
//                                 countryCode: currentPhone,
//                                 phoneNumber: phoneController.text.trim(),
//                                 password: passwordController.text.trim(),
//                               );

//                               setState(() {
//                                 isLoading = false;
//                               });

//                               if (result == null) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text(
//                                       'رقم الهاتف أو كلمة المرور غير صحيحة',
//                                     ),
//                                   ),
//                                 );
//                                 return;
//                               }

//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => const HomeView(),
//                                 ),
//                               );
//                             },
//                       child: isLoading
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : const Text('Login'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
