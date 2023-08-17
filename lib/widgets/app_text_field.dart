import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  bool isObscure;
  bool noSpaces;
  AppTextField({Key? key, required this.textController, required this.hintText, this.isObscure = false, this.noSpaces = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15*0.5),
        color: Colors.white,

      ),
      child: TextField(
        onTapOutside: (PointerDownEvent event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        inputFormatters: noSpaces?<TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
        ]:[],
        obscureText: isObscure?true:false,// ensures no autocorrect
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius15*0.5),
              borderSide: const BorderSide(
                  width: 0,
                  color: Colors.white
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius15*0.5),
              borderSide: const BorderSide(
                  width: 0,
                  color: Colors.white
              )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15*0.5),
          ),
        ),
      ),
    );
  }
}