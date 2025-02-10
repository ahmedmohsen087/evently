import 'dart:developer';

import 'package:evently/core/services%20/validations.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/constants/app_assets.dart';
import '../../core/routes/app_routes.dart';
import '../../core/services /snack_bar_service.dart';
import '../../core/utiles/firebase_functions.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = 'signIn';

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'hamada0871@gmail.com');
  final passwordController = TextEditingController(text: 'Hamada@123');

  // final nameController = TextEditingController();
  //final rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                  image: AssetImage(
                    AppAssets.splashLogo,
                  ),
                  height: mediaQuery.size.height * 0.2),
              CustomFormField(
                controller: emailController,
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (!Validations.validateEmail(value)) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              CustomFormField(
                controller: passwordController,
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                isPasswordField: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.forgetPassword);
                    },
                    child: Text('Forgot Password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      log("Create Account");
                      FirebaseFunctions.login(
                        emailController.text,
                        passwordController.text,
                      ).then(
                        (value) {
                          EasyLoading.dismiss();
                          if (value == true) {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.homeLayout);
                            SnackBarService.showSuccessMessage(
                              "Success Login To Your Account",
                            );
                          } else {
                            SnackBarService.showErrorMessage(
                              "User Already Exists",
                            );
                          }
                        },
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Login',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t Have Account ? ',
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.register);
                    },
                    child: Text('Create Account',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    color: AppColors.primaryColor,
                    width: mediaQuery.size.width * 0.35,
                  ),
                  Text(
                    ' Or ',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 1,
                    color: AppColors.primaryColor,
                    width: mediaQuery.size.width * 0.35,
                  ),
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                            AppAssets.googleLogo,
                          ),
                          height: 25,
                          width: 25,
                        ),
                        Text('Login With Google',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
