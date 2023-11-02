import 'package:flutter/material.dart';
import 'package:nomnoman/pages/container_page.dart';
import 'package:nomnoman/pages/login_page.dart';
import 'package:nomnoman/utils/api.dart';
import 'package:nomnoman/widgets/app_text.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () async {
      return await getAccessToken();
    }).then((token) {
      Navigator.of(context)
          .pushReplacementNamed(AnimationRoute.routeName, arguments: token);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppText(
          "NOMNOMAN",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AnimationRoute extends StatefulWidget {
  static const routeName = '/animation-route';
  const AnimationRoute({Key? key}) : super(key: key);

  @override
  State<AnimationRoute> createState() => _AnimationRouteState();
}

class _AnimationRouteState extends State<AnimationRoute>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final token = ModalRoute.of(context)?.settings.arguments as String?;

    return Container(
      color: Colors.transparent,
      child: FadeTransition(
        opacity: _animation,
        child: token != null ? ContainerPage() : LoginPage(),
      ),
    );
  }
}
