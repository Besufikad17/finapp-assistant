import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  const Overview({
    super.key,
    required this.type
  });

  final OverviewType type;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: OverviewType.floating == type ? getColorFromHex("#ffffff") : 
            getColorFromHex("#315399")
        ), 
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Container(
        width: 300,
        height: 150,
        decoration: type == OverviewType.floating ?
          BoxDecoration(
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
          ) : BoxDecoration(
            color: getColorFromHex("#315399")
          ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    text: "Transaction Overview", 
                    size: 15,
                    isBold: true,
                    color: type == OverviewType.floating ? "#315399" : "#ffffff"
                  ),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(
                      Icons.refresh_rounded,
                      color: getColorFromHex(
                        type == OverviewType.floating ? "#315399" : "#ffffff"
                      ),
                    )
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: "Today", 
                        size: 12,
                        color: type == OverviewType.floating ? "#315399" : "#ffffff"
                      ),
                      const SizedBox(height: 5,),
                      MyText(
                        text: "+3.5k", 
                        size: 15, 
                        color: type == OverviewType.floating ? "#315399" : "#ffffff", 
                        isBold: true,
                      ),
                      const SizedBox(height: 5,),
                      MyText(
                        text: "- ETB 30.5K", 
                        size: 15, 
                        color: type == OverviewType.floating ? "#DC143C" : "#ffffff", 
                        isBold: true,
                      )
                    ],
                  ),
                  const SizedBox(width: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: "Total", 
                        size: 12, 
                        color: type == OverviewType.floating ? "#315399" : "#ffffff",
                      ),
                      const SizedBox(height: 5,),
                      MyText(
                        text: "+0.5k", 
                        size: 15, 
                        color: type == OverviewType.floating ? "#315399" : "#ffffff", 
                        isBold: true,
                      ),
                      const SizedBox(height: 5,),
                      MyText(
                        text: "- ETB 6.02M", 
                        size: 15, 
                        color: type == OverviewType.floating ? "#DC143C" : "#ffffff", 
                        isBold: true,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}