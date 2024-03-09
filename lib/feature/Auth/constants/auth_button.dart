import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
        ),
        alignment: Alignment.center,
        height: Sizes.size52,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black54,
            width: 0.3,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: FaIcon(
                icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
