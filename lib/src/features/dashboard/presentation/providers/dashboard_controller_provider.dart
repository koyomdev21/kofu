import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerNotifierProvider =
    NotifierProvider<DashboardControllerNotifier, int>(
        DashboardControllerNotifier.new);

class DashboardControllerNotifier extends Notifier<int> {
  @override
  int build() {
    state = 0;
    return state;
  }

  void setPosition(int value) {
    state = value;
  }
}
