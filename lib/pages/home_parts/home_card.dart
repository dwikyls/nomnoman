import 'package:flutter/material.dart';
import 'package:nomnoman/providers/drive_provider.dart';
import 'package:nomnoman/widgets/app_text.dart';
import 'package:provider/provider.dart';

class HomeCard extends StatelessWidget {
  final String fileId;
  const HomeCard(this.fileId, {super.key});

  @override
  Widget build(BuildContext context) {
    final file = Provider.of<DriveProvider>(context).findFileById(fileId);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Placeholder()),
            title: AppText(
              file.name,
              fontWeight: FontWeight.bold,
            ),
            subtitle: AppText(file.kind),
            trailing: IconButton(
                onPressed: () {
                  //
                },
                icon: Icon(Icons.more_vert)),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width,
            child: Placeholder(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton.outlined(
                        icon: Icon(Icons.heart_broken),
                        onPressed: () {
                          //
                        },
                      ),
                      IconButton.outlined(
                        icon: Icon(Icons.comment_rounded),
                        onPressed: () {
                          //
                        },
                      ),
                      IconButton.outlined(
                        icon: Icon(Icons.airplanemode_on),
                        onPressed: () {
                          //
                        },
                      ),
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        //
                      },
                      icon: Icon(Icons.bookmark_add_outlined)),
                ),
                AppText("500 Suka"),
                AppText("lorem ipsum dolor sit amet"),
                ListTile(
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  leading: CircleAvatar(child: Placeholder()),
                  title: AppText(
                    "Tambahkan komentar...",
                    color: Colors.grey,
                  ),
                ),
                AppText(
                  "1 hari yang lalu",
                  color: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
