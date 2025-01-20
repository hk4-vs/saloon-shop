import 'package:barber/services/splash_view_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      splashViewService.isAlradyLogin(context);
    });
    super.initState();
  }

  final splashViewService = SplashViewService();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => splashViewService,
      child: Consumer<SplashViewService>(
        builder: (context, value, child) => Scaffold(
          body: Container(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Image.asset("assets/images/app-logo.png"),
            ),
          ),
        ),
      ),
    );
  }
}
