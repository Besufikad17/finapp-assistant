import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/domain/models/agent.dart';
import 'package:finappassistant/presentation/components/agent_form.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/button.dart';
import 'package:finappassistant/presentation/components/dropdown_button.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class UpdateAgentPage extends HookWidget {
  UpdateAgentPage({super.key, required this.agent});

  final Agent agent;  

  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(2);

    phoneNumber.value = TextEditingValue(text: agent.phoneNumber!);
    firstName.value = TextEditingValue(text: agent.fname!);
    lastName.value = TextEditingValue(text: agent.lname!);
    email.value = TextEditingValue(text: agent.email!);

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
        child: MyAgentForm(
          phoneNumber: phoneNumber,
          firstName: firstName,
          lastName: lastName,
          email: email,
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}

@RoutePage()
class UpdateAgentWalletPage extends HookWidget {
  UpdateAgentWalletPage({super.key, this.agent});

  final Agent? agent;
  final TextEditingController amount  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var defaultAgent = useState("");
    var defaultCurrency = useState("");
    var defaultAccount = useState("");
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: getColorFromHex("#ffffff"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Update Agent Wallet", 
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
        child: FutureBuilder(
          future: fetchAgents(),
          builder: (BuildContext context, snapshot) {
            if(snapshot.data != null) {
              List<String> agents = snapshot.data!.map((agent) => "${agent.fname} ${agent.lname}").toList();
              List<String> currency = Currency.values.map((e) => e.name.toUpperCase()).toList();
              List<String> accounts = agent != null ? agent!.wallets!.map((wallet) => wallet.account!.bankName!).toList() : 
                Banks.values.map((bank) => bank.name.toUpperCase()).toList();

              defaultAgent.value = agent != null ? "${agent!.fname} ${agent!.lname}" : agents.first;
              defaultAccount.value = accounts.first;
              defaultCurrency.value = currency.first;              

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 350, 
                      child: MyDropDownButton(
                        items: agents,
                        fontSize: 14,
                        defaultValue: defaultAgent,
                        suffixIcon: Icons.person,
                        label: "Select Agent", 
                        bgColor: "#ffffff",
                        fgColor: "#000000",
                        borderColor: "#315399",
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: 350, 
                      child: MyDropDownButton(
                        items: currency,
                        fontSize: 14,
                        defaultValue: defaultCurrency,
                        suffixIcon: Icons.currency_exchange,
                        label: "Select Currency", 
                        bgColor: "#ffffff",
                        fgColor: "#000000",
                        borderColor: "#315399",
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: 350, 
                      child: MyDropDownButton(
                        items: accounts,
                        fontSize: 14,
                        suffixIcon: Icons.money_sharp,
                        defaultValue: defaultAccount,
                        label: "Select Bank Account", 
                        bgColor: "#ffffff",
                        fgColor: "#000000",
                        borderColor: "#315399",
                      ),
                    ),
                    const SizedBox(height: 15,),
                    MyVerboseTextField(
                      type: TextFieldType.number, 
                      label: "Amount",
                      hintText: "Enter amount",
                      fontSize: 14, 
                      height: 38, 
                      width: 350, 
                      fillColor: "#ffffff", 
                      borderColor: "#315399",
                      fgColor: "#000000", 
                      borderRadius: 19, 
                      enabledBorderWidth: 1, 
                      focusedBorderWidth: 1, 
                      textEditingController: amount
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                          text: "Cash In", 
                          width: 109, 
                          height: 38,
                          fontSize: 15,
                          bgcolor: "#315399",
                          fgcolor: "#ffffff",
                          borderColor: "#315399",
                          borderRadius: 10, 
                          onPressed: () {},
                        ),
                        MyButton(
                          text: "Cash Out", 
                          width: 109, 
                          height: 38, 
                          fontSize: 15,
                          bgcolor: "#315399",
                          fgcolor: "#ffffff",
                          borderColor: "#315399",
                          borderRadius: 10, 
                          onPressed: () {}
                        )
                      ],
                    )
                  ],
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
      ),
    );
  }
}