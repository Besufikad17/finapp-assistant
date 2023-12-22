import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class MyAction extends StatelessWidget {
  const MyAction({
    super.key,
    required this.title,
    required this.logoUrl,
    required this.page
  });

  final String title;
  final String logoUrl; 
  final PageRouteInfo page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(page);
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: getColorFromHex("#ffffff")
          ), 
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Container(
          width: 148,
          height: 76,
          decoration: BoxDecoration(
             color: getColorFromHex("#ffffff"),
             borderRadius: const BorderRadius.all(Radius.circular(25)),
             boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(logoUrl, width: 40, height: 40,),
                MyText(text: title, size: 12, isBold: true,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}