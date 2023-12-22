import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/transaction_form.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class AddTransactionPage extends HookWidget {
  AddTransactionPage({super.key});

  final senderPhoneNumber = TextEditingController();
  final senderFirstName = TextEditingController();
  final senderLastName = TextEditingController();
  final senderEmail = TextEditingController();

  final receiverPhoneNumber = TextEditingController();
  final receiverFirstName = TextEditingController();
  final receiverLastName = TextEditingController();
  final receiverEmail = TextEditingController();

  final bankName = TextEditingController();
  final accountNumber = TextEditingController();
  final amount = TextEditingController();
  final agent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(2);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Add Transaction", 
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
        child: MyTransactionForm(
          width: width, 
          height: height, 
          type: FormType.add,
          senderFirstName: senderFirstName,
          senderLastName: senderLastName,
          senderEmail: senderEmail,
          senderPhoneNumber: senderPhoneNumber,
          receiverFirstName: receiverFirstName,
          receiverLastName: receiverLastName,
          receiverEmail: receiverEmail,
          receiverPhoneNumber: receiverPhoneNumber,
          bankName: bankName,
          accountNumber: accountNumber,
          amount: amount,
          agent: agent,
        )
      ),
      bottomNavigationBar:  BottomNavBar(currentPageIndex: currentPageIndex)
    );
  }
}