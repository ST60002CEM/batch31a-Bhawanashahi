import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:online_pet_shop/core/common/provider/is_network_provider.dart';
import 'package:online_pet_shop/core/common/snackbar/my_snackbar.dart';
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart';
import 'package:online_pet_shop/feature/auth/presentation/auth_viewmodel/auth_viewmodel.dart';

import '../../../../config/router/app_route.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _gap = const SizedBox(height: 8);

  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'Zoro');
  final _lnameController = TextEditingController(text: 'Roronoa');
  final _phoneController = TextEditingController(text: '9812345678');
  final _emailController = TextEditingController(text: 'zoro@gmail.com');
  final _passwordController = TextEditingController(text: 'zoro123');

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(connectivityStatusProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isConnected == ConnectivityStatus.isDisconnected) {
        showSnackBar(
            message: 'No Internet Connection',
            context: context,
            color: Colors.red);
      } else if (isConnected == ConnectivityStatus.isConnected) {
        showSnackBar(message: 'You are online', context: context);
      }

      if (ref.watch(authViewModelProvider).showMessage!) {
        showSnackBar(
            message: 'Student Registerd Successfully', context: context);
        ref.read(authViewModelProvider.notifier).resetMessage();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: 300, // Adjust width according to your needs
                      height: 300, // Adjust height according to your needs
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _fnameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _lnameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    }),
                  ),
                  // _gap,
                  // TextFormField(
                  //   controller: _phoneController,
                  //   decoration: const InputDecoration(
                  //     labelText: 'Phone No',
                  //   ),
                  //   validator: ((value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter phoneNo';
                  //     }
                  //     return null;
                  //   }),
                  // ),
                  _gap,
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
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
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          final entity = AuthEntity(
                            fname: _fnameController.text.trim(),
                            lname: _lnameController.text.trim(),
                            phone: _phoneController.text.trim(),
                            email:_ emailController.text.trim().toLowerCase(),
                            password: _passwordController.text,
                          );
                          ref
                              .read(authViewModelProvider.notifier)
                              .registerStudent(entity);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFd8812F)),
                      ),
                      child: const Text('Register',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Brand Bold',
                        ),),
                    ),

                  ),
                  SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Color(0xFFd8812F),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, AppRoute.loginRoute);
                            },
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
}
