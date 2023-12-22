import 'package:finappassistant/presentation/components/alert.dart';
import 'package:finappassistant/presentation/components/button.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';

class CurrencyComponent extends StatelessWidget {
  const CurrencyComponent({
    super.key,
    required this.imageUrl,
    required this.currency,
    required this.edit
  });

  final String imageUrl;
  final Currency currency;
  final Function(String, Currency) edit;

  void delete(BuildContext context) {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return MyAlert(
          type: AlertType.dialog,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: "Are you sure you want to \n delete this transaction?", 
                  size: 15,
                  isBold: true,
                ),
                const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      text: "Yes", 
                      width: 80, 
                      height: 20, 
                      fontSize: 15, 
                      fgcolor: "#DC143C",
                      bgcolor: "#ffffff",
                      borderColor: "#ffffff",
                      onPressed: (){}, 
                    ),
                    MyButton(
                      text: "No", 
                      width: 80, 
                      height: 20, 
                      fontSize: 15, 
                      fgcolor: "#315399",
                      bgcolor: "#ffffff",
                      borderColor: "#ffffff",
                      onPressed: (){}, 
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: 50,
      width: width < 600 ? width: 500,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                imageUrl,
                height: 40,
                width: 40,
              )
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            children: [
              SizedBox(
                width: width < 600 ? width - 80 : 430,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: currency.name.toUpperCase(), 
                      size: 15,
                      color: "#000000",
                    ),
                    GestureDetector(
                      onTap: () {
                        edit(imageUrl, currency);
                      },
                      child: MyText(
                        text: "edit", 
                        size: 12,
                        color: "#315399",
                        isBold: true,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width < 600 ? width - 80 : 430,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: getFullName(currency), 
                      size: 12,
                      color: "#a6a6a6",
                    ),
                    GestureDetector(
                      onTap: () {
                        delete(context);
                      },
                      child: MyText(
                        text: "delete", 
                        size: 12,
                        color: "#DC143C",
                      ),
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