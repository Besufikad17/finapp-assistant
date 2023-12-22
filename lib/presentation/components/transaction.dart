import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class TransactionComponent extends StatelessWidget {
  const TransactionComponent({
    super.key,
    required this.fullName,
    required this.type,
    required this.amount,
    required this.date,
    required this.status,
    this.onlyBottom = true
  });

  final String fullName;
  final TransactionType type;
  final String amount;
  final String date;
  final TransactionStatus status;
  final bool onlyBottom;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: 50,
      width: width < 600 ? width: 500,
      decoration: BoxDecoration(
        border: onlyBottom ?
        Border(
          bottom:  BorderSide(
            color: getColorFromHex("#B4B4B4"),
            width: 1,
            style: BorderStyle.solid
          )
        ) : Border(
          bottom:  BorderSide(
            color: getColorFromHex("#B4B4B4"),
            width: 1,
            style: BorderStyle.solid
          ),
          top:  BorderSide(
            color: getColorFromHex("#B4B4B4"),
            width: 1,
            style: BorderStyle.solid
          )
        )
      ),
      child: SizedBox(
        width: width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                type == TransactionType.received ? 
                  Icons.add : Icons.minimize, 
                color:  type == TransactionType.received ? 
                  getColorFromHex("#315399") : 
                  getColorFromHex("#FF004D"),
                size: 28,
              ),
            ),
            const SizedBox(width: 1,),
            Column(
              children: [
                SizedBox(
                  width: width < 600 ? width - 60 : 450,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MyText(
                        text: fullName, 
                        size: 15,
                        color: "#000000",
                      ),
                      MyText(
                        text: amount, 
                        size: 15,
                        color: "#000000",
                        isBold: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: width < 600 ? width - 60 : 450,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MyText(
                        text: date, 
                        size: 12,
                        color: "#6a6a6a",
                      ),
                      MyText(
                        text: status.name.toUpperCase(), 
                        size: 12,
                        color: status == TransactionStatus.completed ? "#315399" :
                          status == TransactionStatus.pending ? "#E9B824":
                          "#FF004D",
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
