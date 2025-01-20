import 'package:barber/resources/components/app_title_widget.dart';
import 'package:barber/view-model/home_view_model.dart';
import 'package:barber/views/user/home/widgets/category_widget.dart';
import 'package:barber/views/user/home/widgets/recommended_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Provider.of<HomeViewViewModel>(context, listen: false).getShopList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              "Hi, Vinay",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            actions: [
              GestureDetector(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).highlightColor),
                    child: const Icon(Icons.notifications_outlined)),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          body: provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : provider.shopList.isEmpty
                  ? const Center(child: Text("No Shop Found"))
                  : const SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            // bannerSlider(),
                            AppTitleWidget(title: "Categories"),
                            CategoriesWidget(),
                            SizedBox(
                              height: 20,
                            ),
                            AppTitleWidget(title: "Recommended"),
                            SizedBox(
                              height: 10,
                            ),
                            RecommendedCartWidget(),
                            SizedBox(
                              height: 20,
                            ),
                            AppTitleWidget(title: "Near You"),
                            SizedBox(
                              height: 10,
                            ),
                            RecommendedCartWidget(),
                            SizedBox(
                              height: 20,
                            ),
                            AppTitleWidget(title: "Populer"),
                            SizedBox(
                              height: 10,
                            ),
                            RecommendedCartWidget(),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }

  AppBar homeAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: ListTile(
        title: Text(
          "Hi, Vishal",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        subtitle: Row(
          children: [
            const Icon(
              CupertinoIcons.location_solid,
              size: 14,
              color: Colors.redAccent,
            ),
            Text(
              "Near Mohba Bajar Raipur",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        trailing: GestureDetector(
          child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).highlightColor),
              child: const Icon(Icons.notifications)),
        ),
      ),
    );
  }

  List<String> imgList = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
  ];
  CarouselSlider bannerSlider() {
    return CarouselSlider(
        items: imgList
            .map((item) => Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                ))
            .toList(),
        options: CarouselOptions(
            autoPlay: true, enlargeCenterPage: true, aspectRatio: 2.0));
  }
}
