import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class SettingComponent extends StatelessWidget {
  const SettingComponent({
    super.key, 
    required this.icon,
    required this.title,
    required this.color,
    required this.page
  });

  final IconData icon;
  final String title;
  final String color;
  final PageRouteInfo page;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: getColorFromHex("#ffffff"),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: GestureDetector(
        onTap: () {
          context.router.push(page);
        },
        child: SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: getColorFromHex(color),
                    ),
                    const SizedBox(width: 5,),
                    MyText(text: title, size: 15, color: color, isBold: true,)
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: getColorFromHex(color),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}