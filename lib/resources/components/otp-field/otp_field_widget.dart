import 'package:flutter/material.dart';

import 'otp_field_formatter.dart';
import 'otp_field_widget_controller.dart';

class OtpInputFieldWidget extends StatefulWidget {
  final OtpInputController otpController;
  final Function(String) onComplete;

  const OtpInputFieldWidget({super.key, required this.otpController, required this.onComplete});

  @override
  OtpInputFieldWidgetState createState() => OtpInputFieldWidgetState();
}

class OtpInputFieldWidgetState extends State<OtpInputFieldWidget> {
  @override
  void initState() {
    super.initState();
    widget.otpController.initializeControllers();
  }

  @override
  void dispose() {
    widget.otpController.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> textControllers =
        widget.otpController.getControllers();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) => SizedBox(
          width: 50,
          child: TextField(
            controller: textControllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [SingleDigitInputFormatter()],
            // maxLength: 1,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < 5) {
                  FocusScope.of(context).nextFocus();
                } else {
                  // The OTP is complete
                  String otp = widget.otpController.getOtp();
                  widget.onComplete(otp);
                }
              }
            },
            onSubmitted: (value) {
              // The user pressed enter, handle the submission if needed
            },
          ),
        ),
      ),
    );
  }
}
