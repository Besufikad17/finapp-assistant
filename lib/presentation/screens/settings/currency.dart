import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/presentation/components/alert.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/button.dart';
import 'package:finappassistant/presentation/components/currency.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/constants/strings.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class CurrencySettingsPage extends HookWidget {
  CurrencySettingsPage({
    super.key,  
  });

  final TextEditingController currencyName = TextEditingController();
  final TextEditingController currencySymbol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(4);
    var imgUrl = useState("");
    var type = useState(FormType.add);

    void edit(String imageUrl, Currency currency) {
      currencyName.text = currency.name.toUpperCase();
      currencySymbol.text = getSymbolFromName(currency);
      imgUrl.value = imageUrl;
      type.value = FormType.update;
    }

    return Scaffold(
      backgroundColor: getColorFromHex("#ffffff"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Currency", 
          bgColor: "#315399",
          fgColor: "#ffffff",
          height: 100,
          actions: [
            IconButton(
              onPressed: (){}, 
              highlightColor: getColorFromHex("#254682"),
              icon: Icon(color: getColorFromHex("#ffffff"), Icons.notifications)
            )
          ],
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                MyText(text: "Add Currency", size: 20, color: "#6a6a6a",),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyVerboseTextField(
                        type: TextFieldType.text, 
                        fontSize: 15, 
                        height: 38, 
                        width: 150, 
                        label: "Currency name",
                        hintText: "US dollar",
                        fillColor: "#ffffff", 
                        fgColor: "#000000", 
                        borderColor: "#315399",
                        borderRadius: 19, 
                        enabledBorderWidth: 1, 
                        focusedBorderWidth: 1, 
                        textEditingController: currencyName
                      ),
                      const SizedBox(width: 15,),
                      MyVerboseTextField(
                        type: TextFieldType.text, 
                        fontSize: 15, 
                        height: 38, 
                        width: 150, 
                        label: "Short symbol",
                        hintText: "\$",
                        fillColor: "#ffffff", 
                        fgColor: "#000000", 
                        borderColor: "#315399",
                        borderRadius: 19, 
                        enabledBorderWidth: 1, 
                        focusedBorderWidth: 1, 
                        textEditingController: currencySymbol
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(text: "Country flag image", size: 15, isBold: true,),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: 350,
                        child: Row(
                          children: [
                            MyButton(
                              text: "Upload image", 
                              width: 150, 
                              height: 38,
                              borderRadius: 19,
                              fontSize: 15,
                              bgcolor: "#ffffff",
                              borderColor: "#315399",
                              fgcolor: "#315399",
                              onPressed: () {}
                            ),
                            const SizedBox(width: 15,),
                            MyText(text: imgUrl.value, size: 12, color: "#000000",),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                      MyButton(
                        text: type.value == FormType.add ? "Add" : "Update", 
                        width: 320, 
                        height: 38,
                        fontSize: 15,
                        bgcolor: "#315399",
                        borderColor: "#315399",
                        borderRadius: 19, 
                        onPressed: (){
                          if(currencyName.text.isEmpty || currencySymbol.text.isEmpty || imgUrl.value.isEmpty) {
                            showDialog(
                              context: context, 
                              builder: (BuildContext context) {
                                return const MyAlert(
                                  type: AlertType.error,
                                  errorMessage: "Invalid input!!",
                                );
                              }
                            );
                          } else {
                            showDialog(
                              context: context, 
                              builder: (BuildContext context) {
                                return const MyAlert(
                                  type: AlertType.success,
                                );
                              }
                            );
                          }
                        }
                      ),
                      const SizedBox(height: 20,),
                      MyText(text: "Avaliable currencies", size: 20, color:"#000000", isBold: true),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                Column(
                  children:  Currency.values.map((currency){
                    return CurrencyComponent(
                      imageUrl: currencies[currency.name]!,
                      currency: currency,
                      edit: edit,
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}