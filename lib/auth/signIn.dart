// import 'package:cosmetics/core/app_Image.dart';
// import 'package:cosmetics/views/api_register.dart';
// import 'package:cosmetics/auth/verify_code.dart';
// import 'package:flutter/material.dart';

// class SignInView extends StatefulWidget {
//   const SignInView({super.key});

//   @override
//   State<SignInView> createState() => _SignInViewState();
// }

// class _SignInViewState extends State<SignInView> {
//   final List<String> phoneCodes = ['+02', '+099', '+0123'];
//   String? currentPhone = '+02';

//   bool isLoading = false;

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
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 24),

//                     // Image.asset(
//                     //   'assets/images/splash.png',
//                     //   height: 62,
//                     //   width: 67,
//                     // ),
//                     AppImage(image: "splash.png"),

//                     const SizedBox(height: 40),

//                     const Text(
//                       'Create Account',
//                       style: TextStyle(
//                         color: Color(0xff434C6D),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),

//                     const SizedBox(height: 72),

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
//                             return 'Enter Name';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),

//                     const SizedBox(height: 33),

//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 22),
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: const Color(0xff8E8EA9),
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: DropdownButton<String>(
//                               value: currentPhone,
//                               underline: const SizedBox(),
//                               items: phoneCodes.map((item) {
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

//                         const SizedBox(width: 6),

//                         Expanded(
//                           child: SizedBox(
//                             height: 47,
//                             child: TextFormField(
//                               controller: phoneController,
//                               keyboardType: TextInputType.phone,
//                               decoration: const InputDecoration(
//                                 labelText: 'Phone Number',
//                                 border: OutlineInputBorder(),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Enter PhoneNumber';
//                                 }
//                                 if (value.length < 8) {
//                                   return 'Incorrect PhoneNumber';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 16),

//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         controller: passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           suffixIcon: IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.visibility),
//                           ),
//                           labelText: 'Create your password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Enter Password';
//                           }
//                           if (value.length < 6) {
//                             return 'Password is Weak';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),

//                     const SizedBox(height: 16),

//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         controller: confirmPasswordController,
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                           labelText: 'Confirm Password',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Confirm Password';
//                           }
//                           if (value != passwordController.text) {
//                             return 'differrent Pasword';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),

//                     const SizedBox(height: 24),

//                     SizedBox(
//                       width: 260,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: isLoading
//                             ? null
//                             : () async {
//                                 if (!_formKey.currentState!.validate()) {
//                                   return;
//                                 }

//                                 setState(() {
//                                   isLoading = true;
//                                 });

//                                 final success = await RegisterApi.register(
//                                   name: nameController.text.trim(),
//                                   countryCode: currentPhone ?? '+02',
//                                   phone: phoneController.text.trim(),
//                                   password: passwordController.text.trim(),
//                                 );

//                                 if (!mounted) return;

//                                 setState(() {
//                                   isLoading = false;
//                                 });

//                                 if (!success) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                       content: Text(
//                                         'failed create email,try again',
//                                       ),
//                                     ),
//                                   );
//                                   return;
//                                 }

//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) => const VerifyCodeView(),
//                                   ),
//                                 );
//                               },
//                         child: isLoading
//                             ? const CircularProgressIndicator(
//                                 color: Colors.white,
//                               )
//                             : const Text('Next'),
//                       ),
//                     ),

//                     const SizedBox(height: 24),
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

import 'package:cosmetics/widget/elvatedButton_widget.dart';
import 'package:cosmetics/widget/text_form.dart';
import 'package:cosmetics/widget/text_widget.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  int? _dropdownValue = 02;

  void dropdownCallback(int? selectedValue) {
    if (selectedValue is int) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  bool isobscuretext = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Center(
                child: Image.asset(
                  "assets/images/splash.png",
                  width: 67,
                  height: 62,
                ),
              ),

              SizedBox(height: 40),

              Text(
                "Create Account",
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 50),
              TextFormWidget(labeltext: 'Your Name', hinttext: 'Sara Samer'),

              SizedBox(height: 38),

              TextFormWidget(
                labeltext: 'Email',
                hinttext: 'amramer522@gmail.com',
              ),

              SizedBox(height: 33),

              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff434C6D).withValues(alpha: .40),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<int>(
                      padding: EdgeInsets.all(10),

                      borderRadius: BorderRadius.circular(10),

                      items: [
                        DropdownMenuItem(child: Text("ِ+02"), value: 02),
                        DropdownMenuItem(child: Text("+099"), value: 099),
                        DropdownMenuItem(child: Text("+0123"), value: 0123),
                      ],
                      value: _dropdownValue,
                      onChanged: dropdownCallback,
                    ),
                  ),
                  SizedBox(width: 5),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          hintStyle: TextStyle(
                            color: Color(0xff8E8EA9),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff8E8EA9),

                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
              TextWidget(hintText: 'Create your password'),

              SizedBox(height: 16),
              TextWidget(hintText: 'Confirm password'),

              SizedBox(height: 16),

              ElvatedbuttonWidget(title: 'Next'),
            ],
          ),
        ),
      ),
    );
  }
}
