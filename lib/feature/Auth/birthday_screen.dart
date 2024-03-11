import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project/constants/gaps.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/feature/Auth/constants/form_button.dart';
import 'package:project/feature/onboarding/interest/%08view/interest_screen.dart';

class BirthdayScreen extends ConsumerStatefulWidget {
  const BirthdayScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BirthdayScreenState();
}

/**
 *Textfield에 초기값을 넣어주고 싶음. 오늘날의 시간을 기본값으로
 그러면 Datetime.now()를 texteditingValue값으로 넣어줘야함
 컨트롤러 생성하고, 초기 데이터값을 가져오는 함수를 만들어야함. 
 *시간이 변하는데로 value값이 변하게 로직생성
 */

class _BirthdayScreenState extends ConsumerState<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }

  void _setTextFieldDate(DateTime date) {
    final String textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _onNextTap() {
    context.pushReplacementNamed(InterestScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
          vertical: Sizes.size20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "When's your birthday?",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Gaps.v10,
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
            Gaps.v60,
            TextField(
              controller: _birthdayController,
              enabled: false,
            ),
            Gaps.v32,
            GestureDetector(
              onTap: _onNextTap,
              child: const FormButton(
                disabled: false,
                text: "Next",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.4,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: _setTextFieldDate,
          initialDateTime: DateTime.now(),
          maximumDate: DateTime.now(),
        ),
      ),
    );
  }
}
