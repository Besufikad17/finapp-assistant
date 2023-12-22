import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/config/router/app_router.dart';
import 'package:finappassistant/presentation/components/actions.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/quick_access.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class TrashMainPage extends HookWidget {
  TrashMainPage({super.key});

  final List<Widget> access = [
    MyAction(
      title: "Agents", 
      logoUrl: "assets/images/agents-logo.jpg", 
      page: TrashDetailsRoute(type: TrashType.agents),
    ),
    MyAction(
      title: "Users", 
      logoUrl: "assets/images/users-logo.jpg", 
      page: TrashDetailsRoute(type: TrashType.users),
    ),
    MyAction(
      title: "Transactions", 
      logoUrl: "assets/images/transactions-logo.jpg", 
      page: TrashDetailsRoute(type: TrashType.transactions),
    )
  ];

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(4);

    return Scaffold(
      backgroundColor: getColorFromHex("#ffffff"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Trash", 
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          QuickAccess(access: access, topMargin: 10)
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}

@RoutePage()
class TrashDetailsPage extends HookWidget {
  TrashDetailsPage({super.key, required this.type});

  final TrashType type;

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(4);

    return Scaffold(
      backgroundColor: getColorFromHex("#ffffff"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Trash Details", 
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
        child: MyText(text: "No Trash :(", size: 15, color: "#6a6a6a",),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}
