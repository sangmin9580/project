import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/constants/gaps.dart';
import 'package:project/constants/sizes.dart';

class VideoIcons extends StatelessWidget {
  const VideoIcons({
    super.key,
    required this.icon,
    required this.text,
    this.size = 32,
    this.ontap,
    this.hasGap = true,
  });

  final IconData icon;
  final String text;
  final VoidCallback? ontap;
  final double size;
  final bool hasGap;

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = FaIcon(
      icon,
      size: size,
    );

    if (icon == FontAwesomeIcons.message && ontap != null) {
      iconWidget = GestureDetector(
        onTap: ontap,
        child: iconWidget,
      );
    }

    return Column(
      children: [
        iconWidget,
        Gaps.v5,
        Text(
          text,
          style: const TextStyle(
            fontSize: Sizes.size14,
          ),
        ),
        if (hasGap) Gaps.v32,
      ],
    );
  }
}
