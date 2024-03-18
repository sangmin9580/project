import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/constants/sizes.dart';

class DiscoverScreen extends ConsumerStatefulWidget {
  const DiscoverScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  final List<String> tabs = [
    "Top",
    "Users",
    "Videos",
    "Sounds",
    "Live",
    "Hope",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Food tiktok"),
          bottom: TabBar(
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            labelPadding: const EdgeInsets.symmetric(
              vertical: Sizes.size10,
              horizontal: Sizes.size20,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size16,
            ),
            isScrollable: true,
            tabs: [
              for (var tab in tabs) Text(tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (var tab in tabs)
              Center(
                child: Text(tab),
              ),
          ],
        ),
      ),
    );
  }
}
