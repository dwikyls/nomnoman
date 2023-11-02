import 'package:flutter/material.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 1,
      spacing: 1,
      children: [1, 2, 3, 4, 5, 5, 6, 7, 8, 9]
          .map((e) => Container(
                width: MediaQuery.of(context).size.width / 3.02,
                height: MediaQuery.of(context).size.width / 3.02,
                color: Colors.black12,
              ))
          .toList(),
    );
  }
}
