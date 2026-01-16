
import 'package:cosmetics/components/app_Image.dart';
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

                    // Image.asset(
                    //   'assets/images/splash.png',
                    //   height: 62,
                    //   width: 67,
                    // ),
                    AppImage(image: "splash.png"),

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
                            return 'Enter Name';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 33),

              
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
                                  return 'Enter PhoneNumber';
                                }
                                if (value.length < 8) {
                                  return 'Incorrect PhoneNumber';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                
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
                            return 'Enter Password';
                          }
                          if (value.length < 6) {
                            return 'Password is Weak';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                
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
                            return 'Confirm Password';
                          }
                          if (value != passwordController.text) {
                            return 'differrent Pasword';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

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
                                        'failed create email,try again',
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
