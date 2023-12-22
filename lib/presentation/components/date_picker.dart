import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DatePicker extends HookWidget {
  const DatePicker({
    super.key,
    required this.width,
    required this.label,
    required this.date,
    required this.bgColor,
    required this.fgColor
  });

  final double width;
  final String label;
  final ValueNotifier<DateTime?> date;
  final String bgColor;
  final String fgColor;

  @override
  Widget build(BuildContext context) {
    var dateLabel = useState(date.value ?? label);

    return GestureDetector(
      onTap: () async {
        var pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101)
        );
        date.value = pickedDate!;
        dateLabel.value = date.value.toString().split(" ")[0];
      },
      child: SizedBox(
        width: width < 600 ? width * 0.4: 140,
        child: Container(
          decoration: BoxDecoration(
            color: getColorFromHex(bgColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: getColorFromHex(fgColor)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: getColorFromHex(fgColor),
                ),
                const SizedBox(width: 10,),
                MyText(
                  text: dateLabel.value.toString().split(" ")[0], 
                  size: 14,
                  color: fgColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}