import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/avatar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/dropdown_button.dart';
import 'package:finappassistant/presentation/components/intro_section.dart';
import 'package:finappassistant/presentation/components/overview.dart';
import 'package:finappassistant/presentation/components/pagination.dart';
import 'package:finappassistant/presentation/components/quick_access.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/presentation/screens/transaction/home.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/constants/strings.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class HomePage extends HookWidget {
  HomePage({super.key});

  final _bsbController = BottomSheetBarController();

  @override
  Widget build(BuildContext context) {
   
    var currentPageIndex = useState(0);
    var isUp = useState(false);
    var skip = useState(0);
    var take = useState(10);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: MyAppBar(
            title: "", 
            height: 100, 
            bgColor: "#315399",
            automaticallyImplyLeading: false,
            isCentered: false,
            actions: [
              Container(
                margin: const EdgeInsets.all(16),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: getColorFromHex("#254682"),
                  borderRadius: const BorderRadius.all(Radius.circular(15))
                ),
                child: Center(
                  child: IconButton(
                    onPressed: (){}, 
                    highlightColor: getColorFromHex("#254682"),
                    icon: Icon(
                      color: getColorFromHex("#ffffff"), 
                      Icons.notifications,
                      size: 15,
                    )),
                ),
              )
            ],
            child: Introduction(
              imgUrl: defaultProfilePicture, 
              fullName: "Besufikad Micheal", 
              appBarHeight: 60,
            ),
          ),
        )
      ),
      body: BottomSheetBar(
        color: getColorFromHex("#ffffff"),
        height: 50,
        boxShadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5.0,
            blurRadius: 32.0,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5.0),
          topRight: Radius.circular(5.0),
        ),
        borderRadiusExpanded: const BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
        controller: _bsbController,
        expandedBuilder: (scrollController) {
          return Material(
            color: Colors.transparent,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Container(
                  width: width < 700 ? width : 600,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: "Recent agents", 
                            size: 20, 
                            color: "#315399",
                            isBold: true,
                          )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8
                        ),
                        child: _getAgents(agents),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: "Recent transactions", 
                            size: 20, 
                            color: "#315399",
                            isBold: true,
                          )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      FutureBuilder(
                        future: getModels(),
                        builder: (BuildContext context, snapshot) {
                          if(snapshot.data != null) {
                            return Column(
                              children: [
                                getTransactions(context, snapshot.data!, skip.value, take.value),
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
                            return const Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
        },
        collapsed: MyText(text: "Recents", size: 20, color: "#315399",),
        body:  SingleChildScrollView(
          child: Home(width: width, height: height)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(!isUp.value) {
            isUp.value = true;
            _bsbController.expand();
          }else {
            isUp.value = false;
            _bsbController.collapse();
          }
          // showAsBottomSheet(context, height, agents);
        },
        backgroundColor: getColorFromHex("#ffffff"),
        foregroundColor: getColorFromHex("#315399"),
        child: Icon(!isUp.value ? Icons.arrow_upward : Icons.arrow_downward),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex)
    );
  }

  Widget _getAgents(Map<String, List<String>> agents) {
    List<Widget> elems = [];
    agents.forEach((key, value) {
      elems.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Avatar(imgUrl: value[0], name: key),
        )
      );
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: elems,
      ),
    );
  }
}

class Home extends HookWidget {
  Home({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  final List<String> menu = ["Name", "Phone"];
  final searchField = TextEditingController();

  bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  @override
  Widget build(BuildContext context) {
    var sortBy = useState(menu.first);

    return Stack(
      children: [ 
        Column(
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
                    expandedFgColor: "#315399",
                    borderColor: "#ffffff",
                    fontSize: 11,
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
            const SizedBox(height: 85,),
            Container(
              width: width,
              height: isPortrait(context) ? (
                height < 700 ? height * 0.9 : height * 0.8
              ) : (
                width < 700 ? width * 0.9 : width * 0.8
              ),
              color: getColorFromHex("#f2f2f2"),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: QuickAccess(access: access, topMargin: 95,),
              )
            )
          ],
        ),
        Positioned(
          top: 85,
          left: (width / 2) - 150,
          child: const Overview(type: OverviewType.floating,)
        )
      ]
    );
  }
}  
