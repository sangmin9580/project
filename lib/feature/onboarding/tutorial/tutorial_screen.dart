import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project/constants/gaps.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/feature/Auth/constants/form_button.dart';
import 'package:project/navigation/main_navigation.dart';

enum Direction { right, left }

class TutorialScreen extends ConsumerStatefulWidget {
  const TutorialScreen({super.key});
  static const routeURL = '/tutorial';
  static const routeName = 'tutorial';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends ConsumerState<TutorialScreen> {
  bool isShowFirst = true;
  Direction _direction = Direction.right;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx < 0) {
      _direction = Direction.left;
    } else {
      _direction = Direction.right;
    }
  }

  void _onNextTap() {
    context.go(MainNavigationScreen.routeURL);
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      isShowFirst = false;
      setState(() {});
    } else {
      isShowFirst = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => _onPanUpdate(details),
      onPanEnd: (details) => _onPanEnd(details),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size40,
          ),
          child: AnimatedCrossFade(
            firstChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v40,
                Text(
                  "First",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Gaps.v20,
                Text(
                  "Videos are personalized for you based on what you watch, like, and share.",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v40,
                Text(
                  "second",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Gaps.v20,
                Text(
                  "Videos are personalized for you based on what you watch, like, and share.",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            crossFadeState: isShowFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(
              milliseconds: 300,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: isShowFirst ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: _onNextTap,
                    child: const FormButton(
                      disabled: false,
                      text: "Start watching",
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
