import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  const ShimmerWidget(
      {Key? key, required this.height, required this.width, this.radius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeShimmer(
      height: ScreenUtil().setHeight(height),
      width: ScreenUtil().setWidth(width),
      radius: radius,
      highlightColor: Color(0xffF9F9FB),
      baseColor: Color(0xffE6E8EB),
    );
  }
}
