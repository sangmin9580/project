import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    required this.text,
  });

  final bool disabled;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: disabled ? Colors.grey.shade200 : const Color(0xFFC2185B),
          border: Border.all(
            width: 0.1,
            color: Colors.grey.shade50,
          ),
        ),
        duration: const Duration(
          milliseconds: 300,
        ),
        child: Container(
          alignment: Alignment.center,
          height: Sizes.size60,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(
              milliseconds: 300,
            ),
            style: TextStyle(
              color: disabled ? Colors.grey.shade400 : Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}
