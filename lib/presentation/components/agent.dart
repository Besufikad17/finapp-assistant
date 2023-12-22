import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/constants/strings.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class AgentComponent extends StatelessWidget {
  const AgentComponent({
    super.key,
    required this.imgUrl,
    required this.fullName,
    required this.location,
    required this.balance,
    required this.currency,
    this.onlyBottom = true
  });

  final String imgUrl;
  final String fullName;
  final String location;
  final String balance;
  final String currency;
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                defaultProfilePicture,
                height: 40,
                width: 40,
              )
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            children: [
              SizedBox(
                width: width < 600 ? width - 60 : 430,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: fullName, 
                      size: 15,
                      color: "#000000",
                    ),
                    MyText(
                      text: "$currency ${(double.parse(balance)/1000).toStringAsFixed(2)}k", 
                      size: 15,
                      color: "#000000",
                      isBold: true,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width < 600 ? width - 60 : 430,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: fullName, 
                      size: 12,
                      color: "#a6a6a6",
                    ),
                    MyText(
                      text: "wallet", 
                      size: 12,
                      color: "#315399",
                    )
                  ],
                ),
              ),
            ],
          )
        ]
      ),
    );
  }
}