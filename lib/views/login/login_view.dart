import 'dart:developer';

import 'package:barber/resources/components/custom_input_fields.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../utils/routes/route_names.dart';
import '../../utils/utils.dart';
import '../../view-model/auth_view_model.dart';
import 'package:email_validator/email_validator.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (context, provider, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: CircleAvatar(
                          backgroundColor:
                              const Color(0xffCC04E6).withOpacity(0.1),
                          radius: 50.0,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/splash_image.jpg"))),
                          )),
                    ),

                    Expanded(child: Container()),
                    Center(
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Center(
                      child: Text("login to continue using the app",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black26)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //  Login form is Starting here
                    CustomInputFieldWidget(
                      fieldName: "Email",
                      hindText: "user@email.com",
                      focusNode: emailFocusNode,
                      controller: emailController,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Please enter your email";
                        } else if (EmailValidator.validate(p0) == false) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      onFieldSubmitted: (p0) => Utils.changeFocusNext(
                          context, emailFocusNode, passwordFocusNode),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomInputFieldWidget(
                      fieldName: "Password",
                      hindText: "********",
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          Map data = {
                            "email": emailController.text.trim(),
                            "password": passwordController.text.trim()
                          };
                          provider.loginApi(data, context);

                          log("Login Button Clicked");
                        }
                      },
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Please enter your password";
                        } else if (passwordController.text.length < 6) {
                          return "Please enter valid password";
                        }
                        return null;
                      },
                    ),

                    //  Login form is ending here
                    const SizedBox(
                      height: 6,
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () => Navigator.pushNamed(
                              context, RouteNames.forgetPassword),
                          child: Text(
                            "Forgot Password?",
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w800),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //  Login Button
                    provider.loading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Map data = {
                                  "email": emailController.text.trim(),
                                  "password": passwordController.text.trim()
                                };
                                provider.loginApi(data, context);

                                log("Login Button Clicked");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize:
                                  Size(MediaQuery.of(context).size.width, 60.0),
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            child: Text("Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                          ),

                    const SizedBox(
                      height: 20,
                    ),

                    OutlinedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.of(context).size.width, 60.0),
                        side: BorderSide(
                            width: 1.5, color: Theme.of(context).primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      child: Text("Login as Guest",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Theme.of(context).primaryColor)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Expanded(flex: 3, child: Container()),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ",
                            style: Theme.of(context).textTheme.bodyMedium),
                        TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, RouteNames.userRegisterView),
                            child: Text("Register",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor)))
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("If you want to add your shop? ",
                            style: Theme.of(context).textTheme.bodyMedium),
                        TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, RouteNames.shopRegisterView),
                            child: Text("Register as Shop",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor)))
                      ],
                    )
                  ]),
            ),
          ),
        ),
      );
    });
  }

  void loginFunction(AuthViewModel provider, BuildContext context) {
    if (formKey.currentState!.validate()) {
      Map data = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim()
      };
      provider.loginApi(data, context);

      log("Login Button Clicked");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
