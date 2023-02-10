import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerNotifierProvider =
    NotifierProvider.autoDispose<DashboardControllerNotifier, int>(
        DashboardControllerNotifier.new);

class DashboardControllerNotifier extends AutoDisposeNotifier<int> {
  @override
  int build() {
    state = 0;
    return state;
  }

  void setPosition(int value) {
    state = value;
  }
}
