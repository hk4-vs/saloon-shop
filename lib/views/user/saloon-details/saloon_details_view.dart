import 'package:barber/utils/utils.dart';
import 'package:barber/view-model/user/saloon_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../resources/components/my_eleveted_button_widget.dart';
import '../../../resources/components/my_small_spacer_widget.dart';
import '../../../resources/components/my_spacer_widget.dart';
import '../../../utils/routes/route_names.dart';

class SaloonDetailsView extends StatelessWidget {
  const SaloonDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SaloonDetailsViewModel(),
        child: Consumer<SaloonDetailsViewModel>(
          builder: (context, provider, child) => Scaffold(
            appBar: AppBar(
              title: const Text("Saloon Details"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Saloon Name",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Text("Address"),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.amber,
                                ),
                                Text("4.5")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const MySpacerWidget(),
                    Text(
                      "Saloon Description",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    const MySpacerWidget(),
                    Text(
                      "Schedule",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      width: Utils.width(context),
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.dates.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () => provider.selectedDate =
                                    provider.dates[index],
                                child: Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: (provider.selectedDate ==
                                                  provider.dates[index])
                                              ? Theme.of(context).primaryColor
                                              : Colors.grey.shade200,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${provider.dates[index].day}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          Utils.weekDay(provider.dates[index]),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                    ),
                    const MySpacerWidget(),
                    Text(
                      "Choose Times",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const MySmallSpacerWidget(),
                    Container(
                      width: Utils.width(context),
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade200),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => provider.selectedChoseTime = "Morning",
                            child: Container(
                              width: (Utils.width(context) - 40) / 3,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: provider.selectedChoseTime == "Morning"
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey.shade200),
                              child: const Center(child: Text("Morning")),
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                provider.selectedChoseTime = "Afternoon",
                            child: Container(
                              width: (Utils.width(context) - 40) / 3,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color:
                                      provider.selectedChoseTime == "Afternoon"
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey.shade200),
                              child: const Center(child: Text("Afternoon")),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => provider.selectedChoseTime = "Evening",
                            child: Container(
                              width: (Utils.width(context) - 40) / 3,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: provider.selectedChoseTime == "Evening"
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey.shade200),
                              child: const Center(child: Text("Evening")),
                            ),
                          )
                        ],
                      ),
                    ),
                    const MySmallSpacerWidget(),
                    Text(
                      "Selected Schedule",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const MySmallSpacerWidget(),
                    SizedBox(
                      width: Utils.width(context),
                      height: 60,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.selectedChoseTimeList.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => provider.selectedTime =
                              provider.selectedChoseTimeList[index],
                          child: Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: provider.selectedTime ==
                                        provider.selectedChoseTimeList[index]
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey.shade200),
                            child: Center(
                                child: Text(
                                    "${provider.selectedChoseTimeList[index]}")),
                          ),
                        ),
                      ),
                    ),
                    const MySpacerWidget(),
                    const MySpacerWidget(),
                    MyElevetedButtonWidget(
                        text: "Book Now",
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteNames.bookingPreviewView);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ScheduleSingleDateWidget extends StatelessWidget {
  const ScheduleSingleDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.amber,
      ),
      child: Center(
        child: Text(
          "15",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
