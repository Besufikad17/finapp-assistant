import 'package:finappassistant/presentation/components/text.dart';
import 'package:flutter/material.dart';

class QuickAccess extends StatelessWidget {
  const QuickAccess({
    super.key, 
    required this.access,
    required this.topMargin,
    this.hideTitle = false
  });

  final List<Widget> access;
  final double topMargin;
  final bool hideTitle;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: width < 500 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        SizedBox(height: topMargin,),
        if(!hideTitle)  
          Padding(
            padding: const EdgeInsets.only(
              left: 36
            ),
            child: MyText(text: "Quick access", size: 22, isBold: true, color: "#315399",),
          ),
        const SizedBox(height: 10,),
        Column(
          children:  _getAccess(access).map((e) {
              return e;
            }).toList()
        ),
      ],
    );
  }

  List<Widget> _getAccess(List<Widget> children) {
    List<Widget> rows = [];
    for(int i = 0; i < children.length; i++) {
      if(i % 2 != 0) {
        rows.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                children[i - 1],
                const SizedBox(width: 15),
                children[i]
              ],
            ),
          )
        );
      } else {
        if(i == children.length - 1) {
          rows.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  children[i],
                  const SizedBox(width: 15),
                  Container(
                    width: 148,
                    height: 76,
                  )
                ],
              ),
            )
          );
        }
      }
    }
    return rows;
  }
}