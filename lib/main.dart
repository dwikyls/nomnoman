import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nomnoman/pages/container_page.dart';
import 'package:nomnoman/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nomnoman/pages/login_page.dart';
import 'package:nomnoman/pages/profile_page.dart';
import 'package:nomnoman/pages/search_page.dart';
import 'package:nomnoman/pages/splash_screen.dart';
import 'package:nomnoman/providers/drive_provider.dart';
import 'package:provider/provider.dart';
import 'package:nomnoman/providers/auth_provider.dart';
import 'firebase_options.dart';
import 'utils/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  await Jiffy.setLocale("id");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => AuthProvider()),
          ChangeNotifierProvider(create: (ctx) => DriveProvider()),
        ],
        child: MaterialApp(
          title: 'nomnoman',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            iconTheme: IconThemeData(color: Colors.blue),
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.yellow,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          home: SplashScreen(),
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            LoginPage.routeName: (context) => LoginPage(),
            HomePage.routeName: (context) => HomePage(),
            AnimationRoute.routeName: (context) => AnimationRoute(),
            ContainerPage.routeName: (context) => ContainerPage(),
            ProfilePage.routeName: (context) => ProfilePage(),
            SearchPage.routeName: (context) => SearchPage(),
          },
        ),
      ),
    );
  }
}
