import 'dart:developer';

import 'package:barber/data/models/user_register_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../resources/components/custom_input_fields.dart';
import '../../utils/utils.dart';
import '../../view-model/auth_view_model.dart';

class UserRegisterView extends StatefulWidget {
  const UserRegisterView({super.key});

  @override
  State<UserRegisterView> createState() => _UserRegisterViewState();
}

class _UserRegisterViewState extends State<UserRegisterView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode cPasswordFocusNode = FocusNode();
  FocusNode userNameFocusNode = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthViewModel>(
      create: (_) => AuthViewModel(),
      child: Consumer<AuthViewModel>(builder: (context, provider, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SafeArea(
              child: SingleChildScrollView(
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
                                            "assets/images/image3.jpg"))),
                              )),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Text(
                            "Register",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Center(
                          child: Text(
                              "Enter your details to continue to the app, don't worry you can change them later",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black26)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        CustomInputFieldWidget(
                          fieldName: "Username",
                          hindText: "username",
                          focusNode: userNameFocusNode,
                          controller: userNameController,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Please enter username";
                            } else if (p0.length < 5) {
                              return "Please enter valid username";
                            }
                            return null;
                          },
                          onFieldSubmitted: (p0) => Utils.changeFocusNext(
                              context, userNameFocusNode, emailFocusNode),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                          onFieldSubmitted: (value) => Utils.changeFocusNext(
                              context, passwordFocusNode, cPasswordFocusNode),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Please enter your password";
                            } else if (p0.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        CustomInputFieldWidget(
                          fieldName: "Confirm Password",
                          hindText: "********",
                          focusNode: cPasswordFocusNode,
                          controller: cPasswordController,
                          validator: (p0) {
                            if (passwordController.text !=
                                cPasswordController.text) {
                              return "Confirm Password does not match";
                            }
                            if (cPasswordController.text.isEmpty) {
                              return "Please enter your confirm password";
                            }
                            return null;
                          },
                          onFieldSubmitted: (p0) =>
                              log("register Button Clicked"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //  Login form is ending here
                        const SizedBox(
                          height: 6,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              UserRegistrationModel data =
                                  UserRegistrationModel(
                                email: emailController.text.trim().toString(),
                                password:
                                    passwordController.text.trim().toString(),
                                name: userNameController.text.trim().toString(),
                              );
                              provider.registerApi(data, context);

                              log("Register Button Clicked");
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
                          child: provider.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text("Register",
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

                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ",
                                style: Theme.of(context).textTheme.bodyMedium),
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Login",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .primaryColor)))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
