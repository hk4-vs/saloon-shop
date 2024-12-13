import 'package:flutter/material.dart';

import '../../../../resources/components/my_eleveted_button_widget.dart';
import '../../../../utils/routes/route_names.dart';
import '../../../../utils/utils.dart';

class AppointmentCardWidget extends StatelessWidget {
  const AppointmentCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/image3.jpg",
                          ),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: Utils.width(context) - 16 - 80 - 40 - 8,
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lovely Saloon",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      Text(
                        "Near Mahoba Bajar Kota Raipur",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today  |  04:00 PM",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                              Text(
                                "4.5",
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 40,
                    width: (Utils.width(context) / 2) - 40,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Cancel"))),
                SizedBox(
                  height: 40,
                  width: (Utils.width(context) / 2) - 40,
                  child: MyElevetedButtonWidget(
                      text: "Reschedule",
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            RouteNames.userDashboardView, (route) => false);
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
