// import 'package:cosmetics/views/api_register.dart';
// import 'package:cosmetics/views/verify_code.dart';
// import 'package:flutter/material.dart';

// class SignInView extends StatefulWidget {
//   const SignInView({super.key});

//   @override
//   State<SignInView> createState() => _SignInViewState();
// }

// class _SignInViewState extends State<SignInView> {
//   List<String> Phone = ['+02', '+099', '+0123'];
//   String? currentPhone = '+02';

//   bool isLoading = false;
//   String? errorMessage;

//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/splash.png',
//                       height: 62,
//                       width: 67,
//                     ),
//                     SizedBox(height: 40),
//                     Text(
//                       'Create Account',
//                       style: TextStyle(
//                         color: Color(0xff434C6D),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),

//                     SizedBox(height: 72),

//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         controller: nameController,
//                         decoration: const InputDecoration(
//                           labelText: 'Your Name',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'ادخل الاسم';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),

//                     SizedBox(height: 33),

//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 22),
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               border: BoxBorder.all(
//                                 style: BorderStyle.solid,
//                                 color: Color(0xff8E8EA9),
//                               ),
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: DropdownButton<String>(
//                               value: currentPhone,
//                               items: Phone.map((item) {
//                                 return DropdownMenuItem<String>(
//                                   value: item,
//                                   child: Text(item),
//                                 );
//                               }).toList(),
//                               onChanged: (value) {
//                                 setState(() {
//                                   currentPhone = value;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),

//                         SizedBox(width: 6),

//                         Flexible(
//                           child: SizedBox(
//                             height: 47,
//                             width: 285,
//                             child: TextFormField(
//                               controller: phoneController,
//                               keyboardType: TextInputType.phone,
//                               decoration: const InputDecoration(
//                                 labelText: 'Phone Number',
//                                 border: OutlineInputBorder(),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'ادخل رقم الهاتف';
//                                 }
//                                 if (value.length < 8) {
//                                   return 'رقم الهاتف غير صحيح';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ),

//                         SizedBox(height: 16),

//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                               suffixIcon: IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.visibility),
//                               ),
//                               labelText: 'Create your password',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5),
//                                 borderSide: BorderSide(
//                                   style: BorderStyle.solid,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),

//                         SizedBox(height: 16),

//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child:
//                               /// CONFIRM PASSWORD
//                               TextFormField(
//                                 controller: confirmPasswordController,
//                                 obscureText: true,
//                                 decoration: const InputDecoration(
//                                   labelText: 'Confirm Password',
//                                   border: OutlineInputBorder(),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'أكد كلمة المرور';
//                                   }
//                                   if (value != passwordController.text) {
//                                     return 'كلمة المرور غير متطابقة';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                         ),

//                         /// NEXT BUTTON
//                         SizedBox(
//                           width: 260,
//                           height: 50,
//                           child: ElevatedButton(
//                             onPressed: isLoading
//                                 ? null
//                                 : () async {
//                                     /// 1️⃣ VALIDATION
//                                     if (!_formKey.currentState!.validate()) {
//                                       return;
//                                     }

//                                     setState(() {
//                                       isLoading = true;
//                                     });

//                                     /// 2️⃣ CALL REGISTER API
//                                     final success = await RegisterApi.register(
//                                       name: nameController.text.trim(),
//                                       countryCode: currentPhone ?? '+02',
//                                       phone: phoneController.text.trim(),
//                                       password: passwordController.text.trim(),
//                                     );

//                                     if (!mounted) return;

//                                     setState(() {
//                                       isLoading = false;
//                                     });

//                                     /// 3️⃣ FAILED
//                                     if (!success) {
//                                       if (!mounted) return;
//                                       ScaffoldMessenger.of(
//                                         context,
//                                       ).showSnackBar(
//                                         const SnackBar(
//                                           content: Text(
//                                             'فشل إنشاء الحساب، حاول مرة أخرى',
//                                           ),
//                                         ),
//                                       );
//                                       return;
//                                     }

//                                     /// 4️⃣ SUCCESS → VERIFY CODE
//                                     if (!mounted) return;
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (_) => const VerifyCodeView(),
//                                       ),
//                                     );
//                                   },
//                             child: isLoading
//                                 ? const CircularProgressIndicator(
//                                     color: Colors.white,
//                                   )
//                                 : const Text('Next'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cosmetics/views/api_register.dart';
import 'package:cosmetics/views/verify_code.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final List<String> phoneCodes = ['+02', '+099', '+0123'];
  String? currentPhone = '+02';

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),

                    Image.asset(
                      'assets/images/splash.png',
                      height: 62,
                      width: 67,
                    ),

                    const SizedBox(height: 40),

                    const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Color(0xff434C6D),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 72),

                    /// NAME
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Your Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل الاسم';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 33),

                    /// PHONE ROW
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff8E8EA9),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButton<String>(
                              value: currentPhone,
                              underline: const SizedBox(),
                              items: phoneCodes.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  currentPhone = value;
                                });
                              },
                            ),
                          ),
                        ),

                        const SizedBox(width: 6),

                        Expanded(
                          child: SizedBox(
                            height: 47,
                            child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل رقم الهاتف';
                                }
                                if (value.length < 8) {
                                  return 'رقم الهاتف غير صحيح';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// PASSWORD
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility),
                          ),
                          labelText: 'Create your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل كلمة المرور';
                          }
                          if (value.length < 6) {
                            return 'كلمة المرور ضعيفة';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// CONFIRM PASSWORD
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'أكد كلمة المرور';
                          }
                          if (value != passwordController.text) {
                            return 'كلمة المرور غير متطابقة';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// NEXT BUTTON
                    SizedBox(
                      width: 260,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }

                                setState(() {
                                  isLoading = true;
                                });

                                final success = await RegisterApi.register(
                                  name: nameController.text.trim(),
                                  countryCode: currentPhone ?? '+02',
                                  phone: phoneController.text.trim(),
                                  password: passwordController.text.trim(),
                                );

                                if (!mounted) return;

                                setState(() {
                                  isLoading = false;
                                });

                                if (!success) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'فشل إنشاء الحساب، حاول مرة أخرى',
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const VerifyCodeView(),
                                  ),
                                );
                              },
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text('Next'),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
