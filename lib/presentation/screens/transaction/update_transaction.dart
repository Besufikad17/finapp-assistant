import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/domain/models/transaction.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/transaction_form.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class UpdateTransactionPage extends HookWidget {
  UpdateTransactionPage({super.key, required this.transaction});

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

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(2);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    senderFirstName.value = TextEditingValue(text: transaction.sender!.fname!);
    senderLastName.value = TextEditingValue(text: transaction.sender!.lname!);
    senderEmail.value = TextEditingValue(text: transaction.sender!.email!);
    senderPhoneNumber.value = TextEditingValue(text: transaction.sender!.phoneNumber!);

    receiverFirstName.value = TextEditingValue(text: transaction.receiver!.fname!);
    receiverLastName.value = TextEditingValue(text: transaction.receiver!.lname!);
    receiverEmail.value = TextEditingValue(text: transaction.receiver!.email!);
    receiverPhoneNumber.value = TextEditingValue(text: transaction.receiver!.phoneNumber!);

    bankName.value = TextEditingValue(text: transaction.agent!.account!.bankName!);
    accountNumber.value = TextEditingValue(text: transaction.agent!.account!.accountNumber!);
    amount.value = TextEditingValue(text: transaction.amount!.toString());
    agent.value = TextEditingValue(text: "${transaction.agent!.fname} ${transaction.agent!.lname}");

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Update Transaction", 
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
          type: FormType.update,
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
          currencyType: transaction.currency,
          statusType: transaction.status,
        )
      ),
      bottomNavigationBar:  BottomNavBar(currentPageIndex: currentPageIndex)
    );
  }
}