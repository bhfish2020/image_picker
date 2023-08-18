import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




import '../../provider/navigation_provider.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../sample/first_page.dart';
import '../sample/second_page.dart';
import '../sample/third_page.dart';
import 'app_bar.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);


  int _selectedIndex = 0;

  //late PersistentTabController _controller;

  List pages = [
    MyHomePage(),
    ImagePickerButton(),
    Image1(),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageModel navigation = ref.watch(navigationProvider);
    return Scaffold(

      backgroundColor: (_selectedIndex == 0)
          ? AppColors.lightBackgroundColor
          : (_selectedIndex == 2) ? AppColors.lightBackgroundColor : Colors
          .white,
      appBar: variableAppBar(context, ref, false),
      body: pages[navigation.index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          ref.read(navigationProvider.notifier).selectPage(index);
        },
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: Dimensions.font16,
        unselectedFontSize: Dimensions.font12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: navigation.index,
        // will change pages without currentIndex, but now the selected icons can change color and stuff like that
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: Dimensions.iconSize24 * 1.2,
              ),
              label: "First"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lightbulb,
                size: Dimensions.iconSize24 * 1.2,
              ),
              label: "Second"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.three_p_sharp,
              size: Dimensions.iconSize24 * 1.2,
            ),
            label: "Third",
          ),
        ],
      ),
    );
  }
}