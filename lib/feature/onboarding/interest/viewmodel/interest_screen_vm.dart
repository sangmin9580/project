import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/onboarding/interest/model/interest_model.dart';
import 'package:project/feature/onboarding/interest/repo/interest_repo.dart';

class InterestViewModel extends Notifier<InterestModel> {
  final InterestRepository _interestRepository;

  InterestViewModel(this._interestRepository);

  void setclickCount(int value) {
    _interestRepository.setclickCount(value);
    state = InterestModel(clickCount: value);
  }

  void incrementClickCount() {
    final currentCount = state.clickCount + 1;
    setclickCount(currentCount);
  }

  void decreseClickCount() {
    final currentCount = state.clickCount - 1;
    setclickCount(currentCount);
  }

  Future<void> resetStoredValue() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setInt(InterestRepository.clickCount, 0);
    // ref.read(interestProvider.notifier).resetClickCount();
  }

  void resetClickCount() {
    state = InterestModel(clickCount: 0);
  }

  @override
  InterestModel build() {
    // build method는 우리의 초기화면이 갖게 될 초기 데이터!
    return InterestModel(
      clickCount: _interestRepository.getclickCount(),
    );
  }
}

final interestProvider = NotifierProvider<InterestViewModel, InterestModel>(
  () => throw UnimplementedError(),
);
