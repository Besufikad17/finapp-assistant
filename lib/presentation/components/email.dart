import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class EmailComponent extends StatelessWidget {
  const EmailComponent({
    super.key,
    required this.isVerified,
    required this.email
  });

  final bool isVerified;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 38,
      decoration: BoxDecoration(
        border: Border.all(
          color: getColorFromHex("#6a6a6a")
        ),
        borderRadius: const BorderRadius.all(Radius.circular(19))
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyText(text: email, size: 15, color: "#000000",),
          Container(
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: getColorFromHex(isVerified ? "#315399" : "#E9B824")
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: MyText(
              text: isVerified ? "Verified" : "Not verified", 
              size: 15,
              color: isVerified ? "#315399" : "#E9B824",
            ),
          )
        ],
      ),
    );
  }
}