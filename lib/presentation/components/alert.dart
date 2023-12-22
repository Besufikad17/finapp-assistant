import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class MyAlert extends StatelessWidget {
  const MyAlert({
    super.key, 
    required this.type, 
    this.body,
    this.errorMessage
  });

  final AlertType type;
  final Widget? body;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 262,
        height: 185,
        decoration: BoxDecoration(
          color: getColorFromHex("#ffffff"),
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: switch(type) {
          AlertType.success => _getBody(Icons.done, "Success", "Done", "#315399"),
          AlertType.error => _getBody(Icons.cancel, "Error", errorMessage!, "#FF004D"),
          AlertType.dialog => body,
          _ => Container()
        },
      ),
    );
  }

  Widget _getBody(IconData icon, String title, String message, String color) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(
            icon,
            color: getColorFromHex(color),
            size: 50,
          ),
          const SizedBox(height: 10,),
          MyText(text: title, size: 32, color: color,),
          const SizedBox(height: 10,),
          MyText(text: message, size: 16, color: color,),
        ],
      ),
    );
  }
}