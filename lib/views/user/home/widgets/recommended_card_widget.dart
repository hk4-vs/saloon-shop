import 'package:barber/utils/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/shops_model.dart';
import '../../../../view-model/home_view_model.dart';
import 'saloon_card_widget.dart';

class RecommendedCartWidget extends StatelessWidget {
  const RecommendedCartWidget({
    super.key,
    // required this.shopsList,
  });
  // final List<ShopsModel> shopsList ;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewViewModel>(context, listen: false);
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: provider.shopList.length,
          itemBuilder: (BuildContext context, int int) {
            return GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteNames.saloonDetailsView),
                child: SaloonCardWidget(
                  shopModel: provider.shopList[int],
                ));
          }),
    );
  }
}
