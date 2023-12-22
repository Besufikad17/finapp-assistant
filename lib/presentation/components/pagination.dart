import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/config/router/app_router.dart';
import 'package:finappassistant/presentation/components/rich_text.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyPagination extends HookWidget {
  const MyPagination({
    super.key,
    required this.back,
    required this.next,
    required this.select,
    required this.pages,
    this.export = false,
    this.start,
    this.end
  });

  final Function() back;
  final Function() next;
  final Function(int) select;
  final bool export;
  final DateTime? start;
  final DateTime? end;
  final List<int> pages;

  @override
  Widget build(BuildContext context) {
    var currentPage = useState(1);
    var j = useState(0);
    var k = useState(3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if(currentPage.value > 1) {
                  back();
                  currentPage.value = currentPage.value - 1;
                  if(j.value >= 1) {
                    j.value = j.value - 1;
                    k.value = k.value - 1;
                  }
                }
              }, 
              icon: Icon(
                Icons.arrow_back,
                color: getColorFromHex("#315399"),
              ),
            ),
            Row(
              children: pages.sublist(j.value, k.value).map((i) {
                return GestureDetector(
                  onTap: () {
                    currentPage.value = i;
                    select(i);
                  },
                  child: Container(
                    decoration: currentPage.value == i ? (
                      BoxDecoration(
                        border: Border.all(color: getColorFromHex("#315399")),
                        borderRadius: const BorderRadius.all(Radius.circular(5))
                      ) 
                    ) : null,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: MyText(text: "$i", size: 14),
                    ),
                  ),
                );
              }).toList(),
            ),
            IconButton(
              onPressed: () {
                if(currentPage.value < pages.last) {
                  next();
                  currentPage.value = currentPage.value + 1;
                  if(k.value <= pages.length - 1) {
                    j.value = j.value + 1;
                    k.value = k.value + 1;
                  }
                }
              }, 
              icon: Icon(
                Icons.arrow_forward,
                color: getColorFromHex("#315399"),
              ),
            )
          ],
        ),
        const SizedBox(height: 15,),
        if(export) 
          MyRichText(
            baseFontSize: 12, 
            children: [
              MyText(text: "Click ", size: 12),
              MyText(text: "here ", size: 12, color: "#315399", isBold: true,),
              MyText(text: "to export this transaction", size: 12)
            ], 
            recognizer: () {
              context.router.push(ExportTransactionRoute(start: start, end: end));
            }
          ),
        const SizedBox(height: 10,)
      ],
    );
  }
}