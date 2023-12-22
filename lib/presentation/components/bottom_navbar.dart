import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/config/router/app_router.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentPageIndex
  });

  final ValueNotifier<int> currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: getColorFromHex("#315399"),
      indicatorColor: getColorFromHex("#ffffff"),
      indicatorShape: const CircleBorder(),
      height: 60,
      onDestinationSelected: (int index) {
        currentPageIndex.value = index;
        if(currentPageIndex.value == 0) {
          context.router.push(HomeRoute());
        }else if(currentPageIndex.value == 1) {
            context.router.push(TransactionHomeRoute());
        }else if(currentPageIndex.value == 2) {
            context.router.push(CreateTransactionRoute());
        }else if(currentPageIndex.value == 3) {
            context.router.push(AgentHomeRoute());
        }else {
            context.router.push(const SettingsRoute());
        }
      },
      selectedIndex: currentPageIndex.value,
      destinations: [
        NavigationDestination(
          icon: Icon(
            Icons.home, 
            color: currentPageIndex.value == 0 ? 
              getColorFromHex("#315399") : getColorFromHex("#ffffff"),
            size: 32,
          ), 
          label: "Home" // 
        ),
        NavigationDestination(
          icon: Icon(
            Icons.currency_exchange, 
            color: currentPageIndex.value == 1 ? 
              getColorFromHex("#315399") : getColorFromHex("#ffffff"),
            size: 32,
          ), 
          label: "Transactions" // Transactions
        ),
        NavigationDestination(
          icon: Icon(
            Icons.add_rounded, 
            color: currentPageIndex.value == 2 ? 
              getColorFromHex("#315399") : getColorFromHex("#ffffff"),
            size: 48,
          ), 
          label: ""
        ),
        NavigationDestination(
          icon: Icon(
            Icons.person, 
            color: currentPageIndex.value == 3 ? 
              getColorFromHex("#315399") : getColorFromHex("#ffffff"),
            size: 32,
          ), 
          label: "Agents" // 
        ),
        NavigationDestination(
          icon: Icon(
            Icons.settings, 
            color: currentPageIndex.value == 4 ? 
              getColorFromHex("#315399") : getColorFromHex("#ffffff"),
            size: 32,
          ), 
          label: "Settings" // 
        )
      ],
    );
  }
}