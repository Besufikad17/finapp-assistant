import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/button.dart';
import 'package:finappassistant/presentation/components/date_picker.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class ExportTransactionPage extends HookWidget {
  const ExportTransactionPage({
    super.key,
    this.start,
    this.end
  });

  final DateTime? start;
  final DateTime? end;

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(1);
    var startDate = useState(start ?? null);
    var endDate = useState(end ?? null);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Export Transactions", 
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
      body: Container(
        color: getColorFromHex("#ffffff"),
        width: width,
        height: height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: "Please select start and end \n date to export transactions", 
                size: 20,
                color: "#a6a6a6",
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DatePicker(
                    width: width, 
                    label: "Start date",
                    date: startDate,
                    bgColor: "#ffffff",
                    fgColor: "#315399",
                  ),
                  const SizedBox(width: 40,),
                  DatePicker(
                    width: width, 
                    label: "End date",
                    date: endDate,
                    bgColor: "#ffffff",
                    fgColor: "#315399",
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              MyButton(
                text: "Export", 
                width: 340, 
                height: 38,
                borderRadius: 10,
                bgcolor: "#315399", 
                borderColor: "#315399",
                onPressed: () {}
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}