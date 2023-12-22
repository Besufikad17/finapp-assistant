import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  final String imgUrl;
  final String fullName;
  final double appBarHeight;
  
  Introduction({
    super.key,
    required this.imgUrl,
    required this.fullName,
    required this.appBarHeight
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network(
              imgUrl,
              height: 40,
              width: 40,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft, 
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: MyText(text: "${getGreeting()},", size: 10, color: "#ffffff",)
                )
              ),
              SizedBox(height: appBarHeight * 0.11,),
              Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: MyText(text: "$fullName 👋", size: 14, color: "#ffffff",)
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}