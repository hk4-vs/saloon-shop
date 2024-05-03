import 'package:barber/resources/components/app_title_widget.dart';
import 'package:barber/resources/components/category_widget.dart';
import 'package:barber/resources/components/recommended_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Hi, Vishal",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          GestureDetector(
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).highlightColor),
                child: const Icon(Icons.notifications)),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
              ),
              bannerSlider(),
              const AppTitleWidget(title: "Categories"),
              const CategoriesWidget(),
              const SizedBox(
                height: 20,
              ),
              const AppTitleWidget(title: "Recommended"),
              const SizedBox(
                height: 10,
              ),
              const RecommendedCartWidget(),
              const SizedBox(
                height: 20,
              ),
              const AppTitleWidget(title: "Near You"),
              const SizedBox(
                height: 10,
              ),
              const RecommendedCartWidget(),
              const SizedBox(
                height: 20,
              ),
              const AppTitleWidget(title: "Populer"),
              const SizedBox(
                height: 10,
              ),
              const RecommendedCartWidget(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
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
