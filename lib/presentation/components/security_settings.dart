import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class SecuritySettingComponent extends StatelessWidget {
  const SecuritySettingComponent({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.page,
    required this.isObscure
  });

  final IconData icon;
  final String title;
  final String subTitle;
  final PageRouteInfo page;
  final bool isObscure;

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
                      color: getColorFromHex("#315399"),
                      size: 40,
                    ),
                    const SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(text: title, size: 15, color: "#315399", isBold: true,),
                        MyText(text: subTitle, size: 12, color: "#315399", isObscure: isObscure,)
                      ],
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: getColorFromHex("#315399"),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}