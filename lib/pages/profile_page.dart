import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nomnoman/pages/login_page.dart';
import 'package:nomnoman/pages/profile_parts/photo_list.dart';
import 'package:nomnoman/providers/auth_provider.dart';
import 'package:nomnoman/widgets/app_text.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _selectedTabIndex = 0;
  var _tabList = [
    PhotoList(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AuthProvider>(context).account;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: AppText(
          "dwikyls",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton.outlined(
            icon: Icon(
              Icons.add_box_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              //
            },
          ),
          IconButton.outlined(
            icon: Icon(Icons.menu, color: Theme.of(context).iconTheme.color),
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              minVerticalPadding: 0,
                              leading: Icon(Icons.settings),
                              title: AppText("Pengaturan dan privasi"),
                              onTap: () {
                                //
                              },
                            ),
                            ListTile(
                              minVerticalPadding: 0,
                              leading: Icon(Icons.logout),
                              title: AppText("Logout"),
                              onTap: () {
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .logOutGoogle()
                                    .then((value) => Navigator.of(context)
                                        .pushReplacementNamed(
                                            LoginPage.routeName));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: account != null
                          ? CachedNetworkImage(imageUrl: account.photoUrl ?? '')
                          : Placeholder(),
                      radius: 50,
                    ),
                    Spacer(),
                    Column(
                      children: [
                        AppText("30", fontWeight: FontWeight.bold),
                        AppText("Postingan"),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        AppText("1.1 M", fontWeight: FontWeight.bold),
                        AppText("Pengikut"),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        AppText("1", fontWeight: FontWeight.bold),
                        AppText("Mengikuti"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                margin: EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "${account?.displayName}",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    AppText(
                      "ya gitu aja gitu",
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: AppText("Edit Profile"),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        child: AppText("Bagikan Profile"),
                        onPressed: () {},
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ElevatedButton(
                        child: Icon(Icons.group_add_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                margin: EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "Sorotan cerita",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    AppText(
                      "Simpan cerita favorite di profile Anda",
                    ),
                  ],
                ),
              ),
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
                                  radius: 30,
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
              DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: TabBar(
                      indicatorWeight: 5,
                      labelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      onTap: (value) {
                        setState(() {
                          _selectedTabIndex = value;
                        });
                      },
                      tabs: [
                        Tab(
                          child: Icon(
                            Icons.photo_library_outlined,
                            color: Colors.black,
                          ),
                        ),
                        Tab(
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                        ),
                        Tab(
                          child: Icon(
                            Icons.photo_camera_front_outlined,
                            color: Colors.black,
                          ),
                        )
                      ])),
              _tabList[_selectedTabIndex],
            ],
          ),
        ),
      ),
    );
  }
}
