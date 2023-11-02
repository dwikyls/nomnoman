import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomnoman/pages/home_parts/home_card.dart';
import 'package:nomnoman/pages/login_page.dart';
import 'package:nomnoman/providers/auth_provider.dart';
import 'package:nomnoman/providers/drive_provider.dart';
import 'package:nomnoman/utils/show_toast.dart';
import 'package:nomnoman/widgets/app_text.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isInit = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<DriveProvider>(context, listen: false)
          .fetchAndSetDriveFiles()
          .then((value) {
        //
      }).catchError((error) {
        print(error);
        Provider.of<AuthProvider>(context, listen: false).logOutGoogle().then(
            (value) => Navigator.of(context)
                .pushReplacementNamed(LoginPage.routeName));
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final files = Provider.of<DriveProvider>(context).files;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: AppText(
          "Instagram",
          fontSize: 18,
        ),
        actions: [
          IconButton.outlined(
              onPressed: () {},
              icon: Icon(
                Icons.heart_broken_outlined,
                color: Theme.of(context).iconTheme.color,
              )),
          IconButton.outlined(
              onPressed: () {},
              icon: Icon(Icons.messenger_outline_rounded,
                  color: Theme.of(context).iconTheme.color)),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                      .map((e) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 11),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CircleAvatar(
                                  child: Placeholder(),
                                  radius: 40,
                                ),
                                AppText(
                                  "Dwiky",
                                  fontSize: 14,
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              Column(
                  children: files != null
                      ? files.files
                          .take(5)
                          .map((file) => HomeCard(file.id))
                          .toList()
                      : []),
            ],
          ),
        ),
      ),
    );
  }
}
