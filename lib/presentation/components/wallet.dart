import 'package:finappassistant/domain/models/account.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/constants/strings.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({
    super.key,
    required this.currencyName,
    required this.totalBalance,
    required this.accounts  
  });

  final String currencyName;
  final String totalBalance;
  final Map<Account, double> accounts; 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        color: getColorFromHex("#315399"),
        // color: const Color(0xff7c94b6),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          image: const AssetImage(
            "assets/images/card-bg.jpg"
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        child: Image.asset(
                          currencies[currencyName]!,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      MyText(text: currencyName.toUpperCase(), size: 12, color: "#ffffff", isBold: true,)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.wallet),
                            const SizedBox(width: 5,),
                            MyText(text: "Total", size: 12, color: "#ffffff",),
                          ],
                        ),
                        MyText(text: totalBalance, size: 16, color: "#ffffff", isBold: true,),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30,),
            _getBalances(context, accounts)
          ],
        ), 
      ),
    );
  }

  Widget _getBalances(BuildContext context, Map<Account, double> balances) {
    List<Widget> elems = [];
    balances.forEach((key, value) {
      String bname = key.bankName!.toUpperCase().length > 4 ? key.bankName!.toUpperCase() : 
        key.bankName!.toUpperCase().substring(0, 3);
      elems.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: SizedBox(
            width: 300,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(text: "$bname:${key.accountNumber!.substring(0, 12)}", size: 12, color: "#ffffff",),
                MyText(
                  text: "${getSymbolFromName(Currency.values.byName(currencyName))} : ${formatNumber(value)}", 
                  size: 12, color: "#ffffff",)
              ],
            ),
          ),
        )
      );
    });
    return Column(children: elems,);
  }
}