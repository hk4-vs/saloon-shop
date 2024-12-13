
import 'package:barber/resources/themes/themes.dart';
import 'package:barber/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';

import 'data/models/hive_models/user_hive_model.dart';
import 'utils/routes/routes.dart';
import 'view-model/auth_view_model.dart';

import 'package:hive/hive.dart';

import 'views/user-register/resend_timer_provider.dart';
// import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  // Hive.registerAdapter(HiveLoginResponseAdapter());
  Hive.registerAdapter<HiveUser>(HiveUserAdapter());
  Hive.registerAdapter(HiveLoginResponseAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CountdownProvider(60)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme(),
        // home: IntroView(),
        home: const LoginView(),
        onGenerateRoute: Routes.genrateRoute,
      ),
    );
  }
}
