import 'package:auto_route/annotations.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/setting.dart';
import 'package:finappassistant/utils/constants/strings.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(4);

    return Scaffold(
      backgroundColor: getColorFromHex("#ededed"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Settings", 
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
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: _getSettings(context),
          ),
        )
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }

  Widget _getSettings(BuildContext context) {
    List<Widget> elems = [];
    int count  = 0;

    settings.forEach((key, value) {
      elems.add(
        Column(
          children: [
            SettingComponent(
              icon: value[0], 
              title: key,
              color: count == settings.length - 1 ? "#DC143C" : "#315399", 
              page: value[1]
            ),
            const SizedBox(height: 10,)
          ]
        )
      );
      count++;
    });
    return Column(children: elems,);
  }
}