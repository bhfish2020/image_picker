import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../provider/navigation_provider.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

AppBar variableAppBar(BuildContext context, WidgetRef ref, bool isPopped) {
  final PageModel navigation = ref.watch(navigationProvider);
  var _selectedIndexSwitch = navigation.index;
  return AppBar(
    leading: GestureDetector(
      onTap: (){
        if(isPopped){
          context.pop();
          //TODO: make button go places
        }

      },
      child: isPopped?AppIcon(
        icon:Icons.arrow_back_ios,
        iconSize: Dimensions.iconSize24 * 1.5,
        backgroundColor: Colors.transparent,
        iconColor: AppColors.textColor,
      ):null,
    ),
    actions: [
      GestureDetector(
        onTap: () {
          print("tapped");
        },
        child: Visibility(
          visible: !isPopped,
          child: AppIcon(
            icon: Icons.person,
            iconSize: Dimensions.iconSize24*1.4,
            backgroundColor: Colors.transparent,
            iconColor: AppColors.textColor,
          ),

        ),
      ),
      SizedBox(
        width: Dimensions.width10,
      )
    ],

    shadowColor: Colors.transparent,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: BigText(
      text: "Sprint App",
      color: AppColors.mainColor,
      size: Dimensions.font20,
      fontWeight: FontWeight.w800,
    ),
  );
}
