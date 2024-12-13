import 'package:barber/resources/components/my_spacer_widget.dart';
import 'package:barber/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../resources/components/my_eleveted_button_widget.dart';
import '../../../utils/routes/route_names.dart';

class BookingConfirmationView extends StatelessWidget {
  const BookingConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: MyElevetedButtonWidget(
            text: "Done",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.userDashboardView, (route) => false);
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const MySpacerWidget(),
            const MySpacerWidget(),
            Center(
              child: Container(
                height: Utils.width(context) * 0.4,
                width: Utils.width(context) * 0.4,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/check.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            const Text(
              "Your Booking has been Confirmed",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
