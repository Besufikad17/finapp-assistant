import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/config/router/app_router.dart';
import 'package:finappassistant/domain/models/agent.dart';
import 'package:finappassistant/presentation/components/agent.dart';
import 'package:finappassistant/presentation/components/actions.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/dropdown_button.dart';
import 'package:finappassistant/presentation/components/pagination.dart';
import 'package:finappassistant/presentation/components/quick_access.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/constants/strings.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class AgentHomePage extends HookWidget {
  AgentHomePage({super.key});

  final List<Widget> access = [
    MyAction(
      title: "Add Agent", 
      logoUrl: "assets/images/add-logo.jpg", 
      page: AddAgentRoute()
    ),
    MyAction(
      title:  "View Agents",
      logoUrl: "assets/images/doc-search-logo1.jpg",
      page: AgentsRoute(),
    ),
    MyAction(
      title: "Update Agent Wallet", 
      logoUrl: "assets/images/wallet-logo.jpg", 
      page: UpdateAgentWalletRoute()
    )
  ];

  final List<String> menu = ["Name", "Phone"];
  final searchField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(3);
    var skip = useState(0);
    var take = useState(10);
    var sortBy = useState(menu.first);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Agents Menu", 
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
            Container(
              width: width,
              color: getColorFromHex("#f2f2f2"),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QuickAccess(access: access, topMargin: 10, hideTitle: true,),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      color: getColorFromHex("#ffffff"),
                      borderRadius: const BorderRadius.all(Radius.circular(25))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyText(text: "Recent active agents", size: 20, isBold: true,),
                        const SizedBox(height: 15,),
                        FutureBuilder(
                          future: fetchAgents(), 
                          builder: (BuildContext context, snapshot) {
                            if(snapshot.data != null) {
                              return Column(
                                children: [
                                  getAgentsList(context, snapshot.data!, skip.value, take.value),
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
                              return const CircularProgressIndicator();
                            }
                          }
                        ),
                      ],
                    ),
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

Widget getAgentsList(BuildContext context, List<Agent> agents, int skip, int take) {
  List<Widget> elems = [];

  for(int i = skip; i < skip + take; i++) {
    elems.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: GestureDetector(
          onTap: () {
            context.router.push(AgentDetailRoute(agentId: i));
          },
          child: AgentComponent(
            onlyBottom: i != skip,
            imgUrl: defaultProfilePicture,
            fullName: "${agents[i].fname} ${agents[i].lname}",
            location: "${agents[i].address!.city}, ${agents[i].address!.country}",
            balance: agents[i].wallets![0].balance!.toString(),
            currency: getSymbolFromName(agents[i].wallets![0].currency!),
          ),
        ),
      )
    );
  }
  return Column(children: elems,);
}