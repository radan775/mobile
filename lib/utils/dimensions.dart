import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewController = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 6.49;

  // height padding dan margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height25 = screenHeight / 33.76;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.75;

  // width padding dan margin
  static double widht10 = screenHeight / 84.4;
  static double widht15 = screenHeight / 56.27;
  static double widht20 = screenHeight / 42.2;
  static double widht30 = screenHeight / 28.13;
  static double widht45 = screenHeight / 18.75;

  // font size
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.4;

  static double radius15 = screenHeight / 56.26;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  static double iconSize16 = screenHeight / 52.75;
  static double iconSize24 = screenHeight / 35.16;

  // list view size 411.42
  static double listViewImgSize = screenWidth / 3.42;
  static double listViewTextContSize = screenWidth / 4.11;

  // popular food
  static double popularFoodImgSize = screenHeight / 2.41;

  //bottom height
  static double bottomHeightBar = screenHeight / 7.03;
}
