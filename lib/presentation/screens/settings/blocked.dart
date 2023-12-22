import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class BlockedTransactionsPage extends HookWidget {
  const BlockedTransactionsPage({super.key});

 @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(4);

    return Scaffold(
      backgroundColor: getColorFromHex("#ffffff"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Blocked Transactions", 
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
        child: MyText(text: "No Transactions :(", size: 15, color: "#6a6a6a",),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}