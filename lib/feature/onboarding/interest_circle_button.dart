import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/constants/sizes.dart';

import 'package:project/feature/onboarding/interest/viewmodel/interest_screen_vm.dart';

class InterestsCircle extends ConsumerStatefulWidget {
  const InterestsCircle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InterestsCircleState();
}

class _InterestsCircleState extends ConsumerState<InterestsCircle> {
  bool _isCliked = false;

  void _onInterestContainerClick() {
    setState(() {
      _isCliked = !_isCliked;
    });

    if (_isCliked) {
      ref.watch(interestProvider.notifier).incrementClickCount();
    } else {
      ref.watch(interestProvider.notifier).decreseClickCount();
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _resetStoredValue();
  // }

  // Future<void> _resetStoredValue() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt(InterestRepository.clickCount, 0); // 'your_key'를 0으로 초기화
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onInterestContainerClick,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size12,
            horizontal: Sizes.size14,
          ),
          decoration: BoxDecoration(
            color: _isCliked ? const Color(0xFFF8BBD0) : Colors.white,
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                color: Colors.grey.shade300,
                blurRadius: Sizes.size20,
              ),
            ],
            border: Border.all(
              width: 0.3,
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(
              Sizes.size32,
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: _isCliked ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
