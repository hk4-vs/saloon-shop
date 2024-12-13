import 'package:barber/resources/components/my_spacer_widget.dart';
import 'package:flutter/material.dart';

import '../../../resources/components/my_eleveted_button_widget.dart';
import '../../../utils/routes/route_names.dart';

class BookingPreviewView extends StatelessWidget {
  const BookingPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking Preview")),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: MyElevetedButtonWidget(
            text: "Confirm Booking",
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.bookingConfirmationView);
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.amber.shade200,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  const Text(
                    'Booking Confirmation',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Service: ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Text(
                        "Haircut",
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Booking Date: ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Text(
                        "12-12-2022",
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Booking Time: ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Text(
                        "04:00 PM",
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Saloon Name: ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Text(
                        "Lovely Saloon",
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Stylist: ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Text(
                        "John Doe",
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Address: ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Text(
                        "123 Main St, New York, NY 10001",
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const MySpacerWidget(),
          ],
        ),
      ),
    );
  }
}
