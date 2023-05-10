import 'package:flutter_riverpod/flutter_riverpod.dart';


class BottomBarStateNotifier extends StateNotifier<int> {
  BottomBarStateNotifier() : super(0);

  set value(index) {
    super.state = index;
  }
}