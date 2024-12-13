import 'package:barber/resources/components/my_small_spacer_widget.dart';
import 'package:barber/resources/components/my_spacer_widget.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const MySpacerWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Text("user@email.com"),
                    ],
                  )
                ],
              ),
            ),
            const MySpacerWidget(),
            Divider(
              color: Colors.grey.shade400,
            ),
            const MySmallSpacerWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.person),
                title: const Text("Your Profile"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.calendar_month),
                title: const Text("Your Bookings"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.help_outline),
                title: const Text("Help Center"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.feedback_outlined),
                title: const Text("Feedback"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings_outlined),
                title: const Text("Settings"),
              ),
            ),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout),
                label: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
