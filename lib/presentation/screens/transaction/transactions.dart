import 'package:auto_route/annotations.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/date_picker.dart';
import 'package:finappassistant/presentation/components/dropdown_button.dart';
import 'package:finappassistant/presentation/components/overview.dart';
import 'package:finappassistant/presentation/components/pagination.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/presentation/screens/transaction/home.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class TransactionsPage extends HookWidget {
  TransactionsPage({super.key});

  final List<String> menu = ["Name", "Phone"];
  final searchField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(1);
    var sortBy = useState(menu.first);
    var startDate = useState(DateTime.now());
    var endDate = useState(DateTime.now());
    var skip = useState(0);
    var take = useState(10);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Transactions", 
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width < 600 ? width * 0.4: 120,
                    // height: 65,
                    child: MyDropDownButton(
                      items: menu, 
                      bgColor: "#315399",
                      fgColor: "#ffffff",
                      fontSize: 14,
                      borderColor: "#ffffff",
                      suffixIcon: Icons.filter_alt,
                      defaultValue: sortBy
                    )
                  ),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: width < 600 ? width * 0.5: 300,
                    height: 55,
                    child: MyTextField(
                      height: 65,
                      width: width < 600 ? width * 0.5: 300,
                      suffixIcon: Icon(
                        Icons.search,
                        color: getColorFromHex("#315399"),
                      ),
                      fontSize: 12,
                      hintText: "Search",
                      textEditingController: searchField,
                      type: TextFieldType.text,
                      fillColor: "#ffffff",
                      topRightBorderRadius: 20,
                      topLeftBorderRadius: 20,
                      bottomRightBorderRadius: 20,
                      bottomLeftBorderRadius: 20,
                    )
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DatePicker(
                    width: width, 
                    label: "Start date",
                    date: startDate,
                    bgColor: "#315399",
                    fgColor: "#ffffff",
                  ),
                  const SizedBox(width: 40,),
                  DatePicker(
                    width: width, 
                    label: "End date",
                    date: endDate,
                    bgColor: "#315399",
                    fgColor: "#ffffff",
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const Overview(type: OverviewType.inline),
              const SizedBox(height: 10,),
              Container(
                width: width,
                color: getColorFromHex("#ffffff"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    MyText(text: "Recent Transactions", size: 20),
                    const SizedBox(height: 20,),
                    FutureBuilder(
                      future: getModels(),
                      builder: (BuildContext context, snapshot) {
                        if(snapshot.data != null) {
                          return Column(
                            children: [
                              getTransactions(context, snapshot.data!, skip.value, take.value),
                               MyPagination(
                                export: true,
                                pages: getPages(snapshot.data!.length),
                                start: startDate.value,
                                end: endDate.value,
                                back: () {
                                  skip.value = skip.value - 10;
                                }, 
                                next: () {
                                  skip.value = skip.value + 10;
                                },
                                select: (int page) {
                                  skip.value = (page - 1) * 10;
                                },
                              ),
                            ]    
                          );
                        }else {
                          return Container(
                            width: width,
                            height: height * 0.5,
                            child: const Center(
                              child: CircularProgressIndicator()
                            )
                          );
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}
