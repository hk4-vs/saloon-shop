import 'dart:developer';

import 'package:barber/data/models/user_register_model.dart';
import 'package:barber/view-model/auth_view_model.dart';
import 'package:barber/views/user-register/resend_timer_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

import '../../resources/components/otp-field/otp_field_widget.dart';
import '../../resources/components/otp-field/otp_field_widget_controller.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key, required this.userRegistrationModel});
  final UserRegistrationModel userRegistrationModel;

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  OtpInputController otpController = OtpInputController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: [
                  Expanded(
                      child: Image.asset("assets/animations/enter-otp.png")),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "OTP Verification",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'We sent the OTP to ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: '${widget.userRegistrationModel.email}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OtpInputFieldWidget(
                    otpController: otpController,
                    onComplete: (value) {},
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  Consumer<CountdownProvider>(builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Do not recieve the OTP? '),
                        (value.countdown > 0)
                            ? Text(
                                '00:${value.countdown}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              )
                            : TextButton(
                                onPressed: () {
                                  Provider.of<CountdownProvider>(context,
                                          listen: false)
                                      .setCountdown(60);
                                  // Provider.of<AuthViewModel>(context,
                                  //         listen: false)
                                  //     .registerApi(widget.userRegistrationModel,
                                  //         context);
                                },
                                child: Text(
                                  "Resend",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ))
                      ],
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        widget.userRegistrationModel.otp =
                            otpController.getOtp();
                        log("subitted log: ${widget.userRegistrationModel.toJson()}");
                        provider.otpVerification(
                            widget.userRegistrationModel.toJson(), context);
                      },
                      child: provider.loading
                          ? CircularProgressIndicator()
                          : Text("Submit"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
