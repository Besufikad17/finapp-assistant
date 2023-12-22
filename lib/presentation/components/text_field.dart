import 'package:finappassistant/presentation/components/alert.dart';
import 'package:finappassistant/presentation/components/button.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class MyTextField extends HookWidget {
  
  final double fontSize;
  final String fillColor;
  final String hintText;
  final TextFieldType type;
  final double width;
  final double height;
  final String? borderColor;
  final String? textColor;
  final double? topRightBorderRadius;
  final double? topLeftBorderRadius;
  final double? bottomRightBorderRadius;
  final double? bottomLeftBorderRadius;
  final double? focusedBorderWidth;
  final double? enabledBorderWidth;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Function(String)? regexChecker;
  final TextEditingController textEditingController;

  const MyTextField({
    super.key,
    required this.type,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.fillColor,
    required this.hintText,
    required this.textEditingController,
    this.prefixIcon,
    this.suffixIcon,
    this.topRightBorderRadius,
    this.topLeftBorderRadius,
    this.bottomRightBorderRadius,
    this.bottomLeftBorderRadius,
    this.regexChecker,
    this.enabledBorderWidth,
    this.focusedBorderWidth,
    this.borderColor,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    final isError = useState(false);

    return TextField(
      style: TextStyle(fontSize: fontSize, color: getColorFromHex(textColor ?? "#000000")),
      obscureText: type == TextFieldType.password,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: getColorFromHex(fillColor),
        hintText: hintText,
        hintStyle: TextStyle(color: getColorFromHex("#b7b7b7")),
        contentPadding: const EdgeInsets.all(16.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isError.value ? getColorFromHex("#FB4934") : getColorFromHex(borderColor ?? fillColor),
            width: focusedBorderWidth ?? 0
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(topRightBorderRadius ?? 0),
            topLeft: Radius.circular(topLeftBorderRadius ?? 0),
            bottomRight: Radius.circular(bottomRightBorderRadius ?? 0),
            bottomLeft:  Radius.circular(topLeftBorderRadius ?? 0)
          )
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: getColorFromHex(borderColor ?? fillColor), width: enabledBorderWidth ?? 0),
            borderRadius: BorderRadius.only(
            topRight: Radius.circular(topRightBorderRadius ?? 0),
            topLeft: Radius.circular(topLeftBorderRadius ?? 0),
            bottomRight: Radius.circular(bottomRightBorderRadius ?? 0),
            bottomLeft:  Radius.circular(topLeftBorderRadius ?? 0)
          )
        ),
      ),
    );
  }
}
class MyVerboseTextField extends HookWidget {
  const MyVerboseTextField({
    super.key, 
    this.label = "", 
    this.hintText = "",
    this.enabled = true,
    required this.type,
    required this.fontSize,
    required this.height,
    required this.width,
    this.suffixIcon,
    required this.fillColor,
    required this.fgColor,
    required this.borderRadius,
    this.focusColor,
    this.borderColor,
    required this.enabledBorderWidth,
    required this.focusedBorderWidth,
    this.regexChecker,
    required this.textEditingController
  });

  final String? label;
  final String hintText;
  final TextFieldType type;
  final double fontSize;
  final double width;
  final double height;
  final double borderRadius;
  final String? focusColor;
  final String? borderColor;
  final String? fgColor;
  final bool? enabled;
  final String fillColor;
  final Icon? suffixIcon;
  final double enabledBorderWidth;
  final double focusedBorderWidth;
  final Function(String)? regexChecker;
  final TextEditingController textEditingController; 

  @override
  Widget build(BuildContext context) {
    final isError = useState(false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: label!, 
          size: fontSize,
          isBold: true,
          color: fgColor,
        ) ,
        const SizedBox(height: 10,),
        SizedBox(
          width: width,
          height: height,
          child: TextField(  
            controller: textEditingController,
            keyboardType: type == TextFieldType.number ? TextInputType.number :
              type == TextFieldType.phonenNumber ? TextInputType.phone : 
              TextInputType.name,
            obscureText: type == TextFieldType.password,
            enabled: enabled,
            style: TextStyle(
              fontSize: fontSize,
              color: getColorFromHex("#000000")
            ),  
            decoration: InputDecoration(  
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: getColorFromHex(fillColor),
              hintStyle: TextStyle(color: getColorFromHex("#b7b7b7")),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor != null ? getColorFromHex(borderColor!) : Theme.of(context).colorScheme.onPrimary,
                  width: enabledBorderWidth
                ),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isError.value ? getColorFromHex("#FB4934") : getColorFromHex("#83A598"),
                  width: focusedBorderWidth
                ),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius))
              ),
              contentPadding: EdgeInsets.only(
                left: borderRadius
              ),
              hintText: hintText,
            ), 
            onChanged: (query) {
              if (query.isEmpty || !regexChecker!(query)) {
               isError.value = true;
              } else {
                isError.value = false;
              }
            },
          ),
        ),
      ]
    );
  }
}

void displayError(BuildContext context, String message) {
  showDialog(
    context: context, 
    builder: (BuildContext context) {
      return const MyAlert(
        type: AlertType.error,
        errorMessage: "Get the code first!!",
      );
    }
  );
}
class VerificationComponent extends StatelessWidget {
  const VerificationComponent({
    super.key,
    this.label = true,
    required this.precondition,
    required this.code,
    required this.isError,
    required this.input,
    required this.width
  });

  final bool label;
  final ValueNotifier<String> code;
  final ValueNotifier<bool> isError;
  final ValueNotifier<String> input;
  final bool precondition;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: width < 400 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        if(label) 
          MyText(text: "Verify now", size: 15, color: "#6a6a6a",),
        const SizedBox(height: 15,),
        Center(
          child: GestureDetector(
            onTap: () {
              code.value = "12345";
            },
            child: MyText(text: "Get code", size: 12, color: "#315399",),
          ),
        ),
        const SizedBox(height: 15,),
        Center(
          child: VerificationCode(
            textStyle: TextStyle(
              fontSize: 20.0, 
              color: getColorFromHex("#315399")
            ),
            keyboardType: TextInputType.number,
            underlineColor: isError.value ? getColorFromHex("#DC143C") : 
              getColorFromHex("#315399"), // If this is null it will use primaryColor: Colors.red from Theme
            underlineUnfocusedColor: isError.value ? getColorFromHex("#DC143C") : 
              getColorFromHex("#315399"),
            length: 5,
            cursorColor:  getColorFromHex("#000000"),
            onCompleted: (String value) {
              input.value = value;
            }, 
            onEditing: (bool value) {
            }
          )
        ),
        const SizedBox(height: 15,),
        MyButton(
          text: label ? "Verify" : "Update", 
          width: 350, 
          height: 38, 
          fontSize: 15,
          bgcolor: "#315399",
          borderColor: "#315399",
          borderRadius: 19, 
          onPressed: () {
            if(precondition) {
              if(code.value.isNotEmpty) {
                int count = 0;
                for(int i = 0; i < 5; i++) {
                  if(code.value[i] == input.value[i]) {
                    count++;
                  }
                }
                isError.value = count != 5;
              }else {
                displayError(context, "Get the code first!!");
              }
            }else {
              displayError(context, "Invalid input!!");
            }
          }
        )
      ],
    );
  }
}