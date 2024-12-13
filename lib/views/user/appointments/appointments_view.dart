import 'package:flutter/material.dart';

import 'widgets/appointment_card_widget.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Appointments"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  for (int i = 0; i < 6; i++)
                    Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: const AppointmentCardWidget())
                ],
              )),
        ),
      ),
    );
  }
}
