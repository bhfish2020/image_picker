import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = StateNotifierProvider<NavigationNotifier, PageModel>(
        (ref) => NavigationNotifier());

enum NavigationBarEvent { MAIN_OVERVIEW, INCOME, CASH, MASTER }

class NavigationNotifier extends StateNotifier<PageModel> {
  NavigationNotifier() : super(defaultPage);

  static const defaultPage = PageModel(NavigationBarEvent.MAIN_OVERVIEW, 0);

  void selectPage(int i) {
    switch (i) {
      case 0:
        state = PageModel(NavigationBarEvent.MAIN_OVERVIEW, i);
        break;
      case 1:
        state = PageModel(NavigationBarEvent.INCOME, i);
        break;
      case 2:
        state = PageModel(NavigationBarEvent.CASH, i);
        break;
      case 3:
        state = PageModel(NavigationBarEvent.MASTER, i);
        break;
    }
  }
}

class PageModel {
  const PageModel(this.page, this.index);
  final NavigationBarEvent page;
  final index;
}