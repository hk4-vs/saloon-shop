import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Column(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Image(
                  image: AssetImage(
                    "assets/icons/hair-cut.png",
                  ),
                  height: 60,
                  width: 60,
                ),
              ),
              Text(
                "Hair Cut",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Image(
                  image: AssetImage(
                    "assets/icons/beard-trimming.png",
                  ),
                  height: 60,
                  width: 60,
                ),
              ),
              Text(
                "Beard",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Image(
                  image: AssetImage(
                    "assets/icons/facial-treatment.png",
                  ),
                  height: 60,
                  width: 60,
                ),
              ),
              Text(
                "Facial",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Image(
                  image: AssetImage(
                    "assets/icons/makeup.png",
                  ),
                  height: 60,
                  width: 60,
                ),
              ),
              Text(
                "Makeup",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Image(
                  image: AssetImage(
                    "assets/icons/waxing.png",
                  ),
                  height: 60,
                  width: 60,
                ),
              ),
              Text(
                "Waxing",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Image(
                  image: AssetImage(
                    "assets/icons/nail-polish.png",
                  ),
                  height: 60,
                  width: 60,
                ),
              ),
              Text(
                "Nail Polish",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Image(
                  image: AssetImage(
                    "assets/icons/henna.png",
                  ),
                  height: 60,
                  width: 60,
                ),
              ),
              Text(
                "Menhadee",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
