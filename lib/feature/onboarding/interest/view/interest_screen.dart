import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/constants/gaps.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/feature/Auth/constants/form_button.dart';
import 'package:project/feature/onboarding/interest/repo/interest_repo.dart';

import 'package:project/feature/onboarding/interest/viewmodel/interest_screen_vm.dart';
import 'package:project/feature/onboarding/interest_circle_button.dart';
import 'package:project/feature/onboarding/tutorial/tutorial_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterestScreen extends ConsumerStatefulWidget {
  const InterestScreen({super.key});

  static const routeURL = "/interest";
  static const routeName = "interest";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InterestScreenState();
}

class _InterestScreenState extends ConsumerState<InterestScreen> {
  final List<String> _interest = [
    "Daily Life",
    "Comedy",
    "Entertainment",
    "Animals",
    "Food",
    "Beauty & Style",
    "Drama",
    "Learning",
    "Talent",
    "Sports",
    "Auto",
    "Family",
    "Fitness & Health",
    "DIY & Life Hacks",
    "Arts & Crafts",
    "Dance",
    "Outdoors",
    "Oddly Satisfying",
    "Home & Garden",
    "Daily Life",
    "Comedy",
    "Entertainment",
    "Animals",
    "Food",
    "Beauty & Style",
    "Drama",
    "Learning",
    "Talent",
    "Sports",
    "Auto",
    "Family",
    "Fitness & Health",
    "DIY & Life Hacks",
    "Arts & Crafts",
    "Dance",
    "Outdoors",
    "Oddly Satisfying",
    "Home & Garden",
  ];

  @override
  void initState() {
    super.initState();

    print("aaa");
    // _resetStoredValue();
    // ref.read(interestProvider.notifier).resetStoredValue;
    initializeStoredValues();
  }

  Future<void> initializeStoredValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final oldCounts = prefs.getInt(InterestRepository.clickCount);

    ref.read(interestProvider.notifier).setclickCount(oldCounts ?? 0);
  }

  Future<void> _resetStoredValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print("bbb");
    await prefs.setInt(
      InterestRepository.clickCount,
      0,
    ); // 'your_key'를 0으로 초기화

    final a = prefs.getInt(InterestRepository.clickCount);
    print({a});
    ref.read(interestProvider.notifier).resetClickCount();
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(ref.watch(interestProvider).clickCount);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text(
                "Choose your interest",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Gaps.v20,
              Text(
                "Get better video recommendations",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Gaps.v20,
              Wrap(
                runSpacing: 15,
                spacing: 15,
                children: [
                  for (var interest in _interest)
                    InterestsCircle(
                      text: interest,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: Sizes.size96 + Sizes.size18,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size20,
          horizontal: Sizes.size80,
        ),
        child: GestureDetector(
          onTap: _onNextTap,
          child: FormButton(
            disabled: ref.watch(interestProvider).clickCount < 3,
            text: "Next",
          ),
        ),
      ),
    );
  }
}
