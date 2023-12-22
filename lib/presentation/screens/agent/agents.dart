import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/dropdown_button.dart';
import 'package:finappassistant/presentation/components/pagination.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/presentation/screens/agent/home.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class AgentsPage extends HookWidget {
  AgentsPage({super.key});

  final List<String> menu = ["Name", "Phone"];
  final searchField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(3);
    var skip = useState(0);
    var take = useState(10);
    var sortBy = useState(menu.first);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: getColorFromHex("#ffffff"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Manage Agents", 
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
        child: Column(
          children: [
            Container(
              color: getColorFromHex("#315399"),
              child: Row(
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
                      borderColor: "#ffffff",
                      suffixIcon: Icons.filter_alt,
                      fontSize: 12,
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
                      enabledBorderWidth: 1,
                      focusedBorderWidth: 1,
                      textEditingController: searchField,
                      type: TextFieldType.text,
                      fillColor: "#ffffff",
                      borderColor: "#315399",
                      topRightBorderRadius: 20,
                      topLeftBorderRadius: 20,
                      bottomRightBorderRadius: 20,
                      bottomLeftBorderRadius: 20,
                    )
                  )
                ],
              ),
            ),
            Container(
              width: width,
              color: getColorFromHex("#ffffff"),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      MyText(text: "All agents", size: 20, isBold: true,),
                      const SizedBox(height: 15,),
                      FutureBuilder(
                        future: fetchAgents(), 
                        builder: (BuildContext context, snapshot) {
                          if(snapshot.data != null) {
                            return Column(
                              children: [
                                getAgentsList(context, snapshot.data!, skip.value, take.value),
                                const SizedBox(height: 20,),
                                MyPagination(
                                  pages: getPages(snapshot.data!.length),
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
                        }
                      ),
                    ],
                  )
                ]
              )
            ),
          ],
        )
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}