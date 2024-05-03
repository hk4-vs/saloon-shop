import 'package:flutter/material.dart';

import 'intro1_view.dart';

class IntroView3 extends StatelessWidget {
  const IntroView3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.height * 0.5,
                    MediaQuery.of(context).size.height * 0.5),
                painter: BlobPainter(color: Colors.brown.shade100),
                child: Center(
                  child: Container(
                    width: 220,
                    height: 140,
                    margin: const EdgeInsets.only(bottom: 60),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(
                                "assets/images/intro/makeup-beautician1.jpg"))),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Where Beauty Knows no Gender Unleash Your Style at",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Effortlessly schedule your beauty session from the comfort of your fingertips.",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
