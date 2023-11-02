import 'package:flutter/material.dart';
import 'package:nomnoman/pages/profile_parts/photo_list.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        hintText: "Cari",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                            child: Icon(
                              Icons.search,
                              color: Colors.black12,
                            )))),
                Wrap(
                  runSpacing: 1,
                  spacing: 1,
                  children: [
                    1,
                    2,
                    3,
                    4,
                    5,
                    6,
                    7,
                    8,
                    9,
                    10,
                    11,
                    12,
                    13,
                    14,
                    15,
                  ]
                      .map((e) => Container(
                            width: MediaQuery.of(context).size.width / 3.02,
                            height: MediaQuery.of(context).size.width / 3.02,
                            color: Colors.black12,
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
