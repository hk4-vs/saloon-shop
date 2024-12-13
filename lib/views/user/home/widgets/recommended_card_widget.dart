import 'package:barber/utils/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'saloon_card_widget.dart';

class RecommendedCartWidget extends StatelessWidget {
  const RecommendedCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int int) {
            return GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteNames.saloonDetailsView),
                child: const SaloonCardWidget());
          }),
    );
  }
}
