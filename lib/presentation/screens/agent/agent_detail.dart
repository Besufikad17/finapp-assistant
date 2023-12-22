import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finappassistant/config/router/app_router.dart';
import 'package:finappassistant/domain/models/account.dart';
import 'package:finappassistant/domain/models/agent.dart';
import 'package:finappassistant/domain/models/wallet.dart';
import 'package:finappassistant/presentation/components/actions.dart';
import 'package:finappassistant/presentation/components/alert.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/button.dart';
import 'package:finappassistant/presentation/components/quick_access.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/wallet.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/constants/strings.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class AgentDetailPage extends HookWidget {
  AgentDetailPage({
    super.key,
    this.agentId = 0
  });

  final int agentId;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(2);
    var pageIndex = useState(0);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: getColorFromHex("#fafafa"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Agent Details", 
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
      body: FutureBuilder(
        future: fetchAgents(),
        builder: (BuildContext context, snapshot) {
          if(snapshot.data != null) {
            Agent agent = snapshot.data!.elementAt(agentId);
            final List<Widget> access = [
              MyAction(
                title:  "View Transaction",
                logoUrl: "assets/images/doc-search-logo2.jpg",
                page: TransactionsRoute(),
              ),
              MyAction(
                title: "Update Agent Wallet", 
                logoUrl: "assets/images/wallet-logo.jpg", 
                page: UpdateAgentWalletRoute(agent: agent)
              ),
            ];

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: width < 500 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                    children: [
                      MyText(text: "Personal Information", size: 15, color: "#6A6A6A",),
                      const SizedBox(height: 15,),
                      SizedBox(
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(60)),
                              child: Image.network(
                                defaultProfilePicture,
                                height: 120,
                                width: 120,
                              )
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: "${agent.fname} ${agent.lname}", 
                                  size: 20,
                                  color: "#000000",
                                  isBold: true,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.mail,
                                      color: getColorFromHex("#315399"),
                                    ),
                                    MyText(text: agent.email!, size: 12, color: "#6A6A6A",)
                                  ],
                                ),
                                const SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: getColorFromHex("#315399"),
                                    ),
                                    MyText(text: agent.phoneNumber!, size: 12, color: "#6A6A6A",)
                                  ],
                                ),
                                const SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: getColorFromHex("#315399"),
                                    ),
                                    MyText(text: agent.address!.city!, size: 12, color: "#6A6A6A",)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                      MyText(text: "Wallet Information", size: 15, color: "#6A6A6A",),
                      const SizedBox(height: 30,),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Column(
                                children: [
                                  CarouselSlider.builder(
                                    itemCount: agent.wallets!.length,
                                    carouselController: buttonCarouselController,
                                    options: CarouselOptions(
                                      height: 170,
                                      aspectRatio: 16/9,
                                      viewportFraction: 0.8,
                                      initialPage: pageIndex.value,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: false,
                                      autoPlayInterval: const Duration(seconds: 3),
                                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.3,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (index, reason) {
                                        pageIndex.value = index;
                                      }
                                    ),
                                    itemBuilder: (BuildContext context, int index, int realIndex) { 
                                      return MyWallet(
                                        currencyName: agent.wallets![index].currency!.name,
                                        totalBalance: formatNumber(_getTotalBalance(agent.wallets!, agent.wallets![index].currency!)),
                                        accounts: _getBalance(agent.wallets!, agent.wallets![index].currency!),
                                      );
                                    }
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: agent.wallets!.map((entry) {
                                      return GestureDetector(
                                        onTap: () {
                                          pageIndex.value = agent.wallets!.indexOf(entry);
                                          buttonCarouselController.animateToPage(pageIndex.value);
                                        },
                                        child: Container(
                                          width: 12.0,
                                          height: 12.0,
                                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (Colors.black).withOpacity(
                                              pageIndex.value == agent.wallets!.indexOf(entry) ? 0.9 : 0.4)),
                                        ),
                                      );
                                    }
                                    ).toList(),
                                  )
                                ]  
                              )
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Center(
                        child: Container(
                          width: 300,
                          color: getColorFromHex("#ededed"),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.currency_exchange,
                                      color: getColorFromHex("#315399"),
                                    ),
                                    const SizedBox(width: 5,),
                                    MyText(text: "Total Transactions", size: 12, color: "#000000", isBold: true,)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MyText(text: "\$200k", size: 12, color: "#315399", isBold: true,),
                                    MyText(text: "ETB 1.5M", size: 12, color: "#315399", isBold: true,),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      QuickAccess(access: access, topMargin: 10, hideTitle: true,),
                      const SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyButton(
                            text: "Delete", 
                            width: 109, 
                            height: 30,
                            fontSize: 15,
                            bgcolor: "#DC143C",
                            fgcolor: "#ffffff",
                            borderColor: "#DC143C",
                            borderRadius: 10, 
                            onPressed: () {
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
                          ),
                          MyButton(
                            text: "Update", 
                            width: 109, 
                            height: 30, 
                            fontSize: 15,
                            bgcolor: "#315399",
                            fgcolor: "#ffffff",
                            borderColor: "#315399",
                            borderRadius: 10, 
                            onPressed: () {
                              context.router.push(UpdateAgentRoute(agent: agent));
                            }
                          )
                        ],
                      )
                    ]
                  ),
                ),
              ),
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
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }

  double _getTotalBalance(List<Wallet> wallets, Currency currency) {
    double sum = 0;
    for(int i = 0; i < wallets.length; i++) {
      if(wallets[i].currency == currency) {
        sum = sum + wallets[i].balance!;
      }
    }
    return sum;
  }

  Map<Account, double> _getBalance(List<Wallet> wallets, Currency currency) {
    Map<Account, double> map = {};
    for(int i = 0; i < wallets.length; i++) {
      if(wallets[i].currency == currency) {
        map[wallets[i].account!] = wallets[i].balance!; 
      }
    }
    return map;
  }
}