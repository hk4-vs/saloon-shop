import 'package:flutter/material.dart';

import 'widgets/favourites_card_widget.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favourites"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              for (int i = 0; i < 10; i++)
                Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const FavouriteCardWidget())
            ],
          ),
        ),
      ),
    );
  }
}
