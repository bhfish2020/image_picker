import 'package:flutter/cupertino.dart';
import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  FontWeight? fontWeight;
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText({Key? key,
    this.fontWeight = FontWeight.w400,
    this.color = const Color(0xFF332d2b),// cannot call function here
    this.size=0,// all of the initialized values must be defined, AppColor.white will not work
    required this.text,
    this.overFlow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontSize: size==0?Dimensions.font20:size,
          fontWeight: fontWeight),


    );
  }
}