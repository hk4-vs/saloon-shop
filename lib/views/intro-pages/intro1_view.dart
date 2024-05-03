import 'package:flutter/material.dart';

class IntroView1 extends StatelessWidget {
  const IntroView1({super.key});

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
                painter: BlobPainter(),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.only(bottom: 60),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/intro/makeup-beautician.jpg"))),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Seamless Style, Booked with Ease Your Salon Seat Awaits Online!",
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
              "Reserve your spot and step into a world where style meets simplicity. Your journey to glamour begins with a click.",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}

class BlobPainter extends CustomPainter {
  final Color? color;
  BlobPainter({this.color = Colors.white});
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..color = color! // Specify the color of the blob
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.5, 0)
      ..quadraticBezierTo(
          size.width * 0.75, 0, size.width, size.height * 0.25 + 20)
      ..quadraticBezierTo(size.width, size.height * 0.5, size.width * 0.75,
          size.height * 0.75 - 10)
      ..quadraticBezierTo(
          size.width * 0.5, size.height, size.width * 0.25, size.height * 0.75)
      ..quadraticBezierTo(0, size.height * 0.5, 0, size.height * 0.25)
      ..quadraticBezierTo(0, 0, size.width * 0.25, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BlobPainter oldDelegate) => false;
}
