// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';
import '../auth_viewmodel/auth_viewmodel.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'B@gmail.com');
  final _passwordController = TextEditingController(text: 'bhawana12');

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authState.showMessage! && authState.error != null) {
        showSnackBar(message: 'Invalid Credentials', context: context);
        ref.read(authViewModelProvider.notifier).resetMessage();
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 400,
                    width: 400,
                    child: ClipOval(
                      child: Image(
                        width: 400,
                        height: 400,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/logos.png'),
                      ),
                    ),
                  ),
                  _gap,
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          key: const ValueKey('email'),
                          controller: _emailController,
                          obscureText: isObscure,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',

                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                        ),
                        _gap,
                        TextFormField(
                          key: const ValueKey('password'),
                          controller: _passwordController,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                            ),
                          ),
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          }),
                        ),
                        _gap,
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await ref
                                  .read(authViewModelProvider.notifier)
                                  .loginStudent(
                                context,
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFD8812F), // Set the background color to D8812F
                          ),
                          child: const SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Brand Bold',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          key: const ValueKey('registerButton'),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoute.contactRoute);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFD8812F), // Set the background color to D8812F
                          ),
                          child: const SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Brand Bold',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final _gap = const SizedBox(height: 8);
}