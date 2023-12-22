import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({
    super.key,
    this.elevation = 0,
    required this.title,
    required this.height,
    this.bgColor, 
    this.fgColor,
    this.child,
    this.isCentered = true,
    this.automaticallyImplyLeading = true,
    this.actions = const[]
  });

  final double elevation;
  final double height;
  final String title;
  final String? bgColor;
  final String? fgColor;
  final Widget? child;
  final List<Widget> actions;
  final bool isCentered;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      actions: actions,
      toolbarHeight: height, 
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: MyText(
        text: title, size: 16, isBold: true, 
        color: fgColor,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      flexibleSpace: Container(
        color:  bgColor != null ? getColorFromHex(bgColor!) : 
          Theme.of(context).colorScheme.primary,
        child: Center(
          child: child ?? Container(),
        ) 
      ),
    );
  }
}