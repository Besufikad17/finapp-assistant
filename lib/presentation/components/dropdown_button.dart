import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyDropDownButton extends HookWidget {
  const MyDropDownButton({
    super.key,
    required this.items,
    required this.bgColor,
    required this.fgColor,
    required this.defaultValue,
    required this.suffixIcon,
    this.borderColor,
    this.expandedFgColor,
    this.hintColor,
    this.label,
    this.fontSize  
  });

  final List<String> items;
  final String bgColor;
  final String fgColor;
  final IconData suffixIcon;
  final String? hintColor;
  final ValueNotifier<String> defaultValue;
  final String? borderColor;
  final String? expandedFgColor;
  final String? label;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label != null)
          MyText(
            text: label!, 
            size: fontSize!,
            isBold: true,
          ),
        CustomDropdown<String>(
          hintText: 'Status',
          initialItem: defaultValue.value,
          closedFillColor: getColorFromHex(bgColor),
          expandedFillColor: getColorFromHex(bgColor),
          closedSuffixIcon: Icon(
            Icons.arrow_drop_down,
            color: getColorFromHex("#ffffff"),
          ),
          listItemBuilder: (BuildContext context, item) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyText(text: item.toUpperCase(), size: fontSize!, color: fgColor,),
              ],
            );
          },
          headerBuilder: (BuildContext context, selectedItem) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(suffixIcon, color: getColorFromHex(fgColor),),
                const SizedBox(width: 5,),
                MyText(text: selectedItem.toUpperCase(), size: fontSize!, color: fgColor,),
              ],
            );
          },
          hintBuilder: (BuildContext context, hint) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyText(text: hint, size: fontSize!, color: fgColor,),
              ],
            );
          },
          closedBorder: Border.all(
            color: getColorFromHex(borderColor ?? bgColor)
          ),
          expandedBorder:  Border.all(
            color: getColorFromHex(borderColor ?? bgColor)
          ),
          onChanged: (value) {
            defaultValue.value = value;
          },
          items: items,
        ),
      ],
    );
  }
}