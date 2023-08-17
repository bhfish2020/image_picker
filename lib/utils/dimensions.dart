import 'dart:ui';

class Dimensions{
  static double screenWidth = window.physicalSize.width /window.devicePixelRatio;
  static double screenHeight = window.physicalSize.height /window.devicePixelRatio;


  //static double screenHeight = MediaQuery.of(context).size.height;
  //static double screenWidth = MediaQuery.of(context).size.width;


  static double pageView = screenHeight/8.2;
  static double pageViewContainer = screenHeight/4.21;
  static double pageViewTextContainer = screenHeight/7.72;

  static double height10 = screenHeight/92.6;
  static double height15 = screenHeight/61.7;
  static double height20 = screenHeight/46.3;
  static double height30 = screenHeight/30.9;
  static double height45 = screenHeight/20.58;


  static double width10 = screenHeight/42.8;
  static double width15 = screenHeight/28.53;
  static double width20 = screenHeight/21.4;
  static double width30 = screenHeight/14.26;
  static double width45 = screenHeight/9.51;


  static double font24 = screenHeight/38.58;
  static double font26 = screenHeight/35.62;
  static double font30 = screenHeight/30.9;
  static double font20 = screenHeight/46.3;
  static double font12 = screenHeight/77.16;
  static double font16 = screenHeight/57.88;

  static double radius15 = screenHeight/61.7;
  static double radius20 = screenHeight/46.3;
  static double radius30 = screenHeight/30.9;

  static double iconSize24 = screenHeight/38.6;
  static double iconSize16 = screenHeight/57.86;

  //list view size
  static double listViewImgSize = screenWidth/3.56;
  static double listViewTextContSize = screenWidth/4.28;

  //popular food
  static double popularFoodCont = screenHeight/2.657;

  //bottom height
  static double bottomHeightBar = screenHeight/7.72;

  //splash screen dimensions
  static double splashImg = screenHeight/7;

}