import 'package:finappassistant/presentation/components/alert.dart';
import 'package:finappassistant/presentation/components/button.dart';
import 'package:finappassistant/presentation/components/dropdown_button.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyTransactionForm extends HookWidget {
  MyTransactionForm({
    super.key, 
    required this.width,
    required this.height,
    required this.type,
    required this.senderFirstName,
    required this.senderLastName,
    required this.senderEmail,
    required this.senderPhoneNumber,
    required this.receiverFirstName,
    required this.receiverLastName,
    required this.receiverEmail,
    required this.receiverPhoneNumber,
    required this.bankName,
    required this.accountNumber,
    required this.amount,
    required this.agent,
    this.currencyType,
    this.statusType
  });

  final double width;
  final double height;
  final FormType type;

  final TextEditingController senderPhoneNumber;
  final TextEditingController senderFirstName;
  final TextEditingController senderLastName;
  final TextEditingController senderEmail;

  final TextEditingController receiverPhoneNumber;
  final TextEditingController receiverFirstName;
  final TextEditingController receiverLastName;
  final TextEditingController receiverEmail;

  final TextEditingController bankName;
  final TextEditingController accountNumber;
  final TextEditingController amount;
  final TextEditingController agent;

  final Currency? currencyType;
  final TransactionStatus? statusType;

  final List<String> status = TransactionStatus.values.map((s) {
    return s.name;
  }).toList();

  final List<String> currency = Currency.values.map((s) {
    return s.name;
  }).toList();

  bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

   @override
  Widget build(BuildContext context) {
    final defaultStatus = useState(statusType != null ? statusType!.name : status.first);
    final defaultCurrency = useState(currencyType != null ? currencyType!.name : currency.first);
    final defaultAgent = useState(agent.text);

    return Container(
      width: width,
      color: getColorFromHex("#ffffff"),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(text: "Sender information", size: 20),
              const SizedBox(height: 15,),
              MyVerboseTextField(
                type: TextFieldType.phonenNumber, 
                label: "Phone number",
                fontSize: 14, 
                height: 38, 
                width: 350, 
                suffixIcon: Icon(
                  Icons.phone,
                  color: getColorFromHex("#315399"),
                  size: 14,
                ), 
                fillColor: "#ffffff", 
                fgColor: "#000000",
                borderColor: "#315399",
                hintText: "Enter sender's phone number",
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                textEditingController: senderPhoneNumber,
                regexChecker: isValidPhoneNumber,
              ),
              const SizedBox(height: 15,),
              MyVerboseTextField(
                type: TextFieldType.text, 
                label: "First name",
                fontSize: 14, 
                height: 38, 
                width: 350, 
                suffixIcon: Icon(
                  Icons.contacts_rounded,
                  color: getColorFromHex("#315399"),
                  size: 14,
                ), 
                fillColor: "#ffffff", 
                fgColor: "#000000",
                borderColor: "#315399",
                hintText: "Enter sender's first name",
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                textEditingController: senderFirstName,
                regexChecker: isValidName,
              ),
              const SizedBox(height: 15,),
              MyVerboseTextField(
                type: TextFieldType.text, 
                label: "Last name",
                fontSize: 14, 
                height: 38, 
                width: 350, 
                suffixIcon: Icon(
                  Icons.contacts_rounded,
                  color: getColorFromHex("#315399"), 
                  size: 14,
                ), 
                fillColor: "#ffffff", 
                fgColor: "#000000",
                borderColor: "#315399",
                hintText: "Enter sender's last name",
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                textEditingController: senderLastName,
                regexChecker: isValidName,
              ),
              const SizedBox(height: 15,),
              MyVerboseTextField(
                type: TextFieldType.text, 
                label: "Email",
                fontSize: 14, 
                height: 38, 
                width: 350, 
                suffixIcon: Icon(
                  Icons.email,
                  color: getColorFromHex("#315399"),
                  size: 14,  
                ), 
                fillColor: "#ffffff", 
                fgColor: "#000000",
                borderColor: "#315399",
                hintText: "Enter sender's email",
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                textEditingController: senderEmail,
                regexChecker: isValidEmail,
              ),
              const SizedBox(height: 30,),
              MyText(text: "Receiver information", size: 20),
              const SizedBox(height: 15,),
              MyVerboseTextField(
                type: TextFieldType.phonenNumber, 
                label: "Phone number",
                fontSize: 14, 
                height: 38, 
                width: 350, 
                suffixIcon: Icon(
                  Icons.phone,
                  color: getColorFromHex("#315399"),
                  size: 14,
                ), 
                fillColor: "#ffffff", 
                fgColor: "#000000",
                borderColor: "#315399",
                hintText: "Enter receiver's phone number",
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                textEditingController: receiverPhoneNumber,
                regexChecker: isValidPhoneNumber,
              ),
              const SizedBox(height: 15,),
              MyVerboseTextField(
                type: TextFieldType.text, 
                label: "First name",
                fontSize: 14, 
                height: 38, 
                width: 350, 
                suffixIcon: Icon(
                  Icons.contacts_rounded,
                  color: getColorFromHex("#315399"),
                  size: 14,
                ), 
                fillColor: "#ffffff", 
                fgColor: "#000000",
                borderColor: "#315399",
                hintText: "Enter receiver's first name",
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                textEditingController: receiverFirstName,
                regexChecker: isValidName,
              ),
              const SizedBox(height: 15,),
              MyVerboseTextField(
                type: TextFieldType.text, 
                label: "Last name",
                fontSize: 14, 
                height: 38, 
                width: 350, 
                suffixIcon: Icon(
                  Icons.contacts_rounded,
                  color: getColorFromHex("#315399"),
                  size: 14,  
                ), 
                fillColor: "#ffffff", 
                fgColor: "#000000",
                borderColor: "#315399",
                hintText: "Enter receiver's last name",
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                textEditingController: receiverLastName,
                regexChecker: isValidName,
              ),
              const SizedBox(height: 15,),
              MyVerboseTextField(
                type: TextFieldType.text, 
                label: "Email",
                fontSize: 14, 
                height: 38, 
                width: 350, 
                suffixIcon: Icon(
                  Icons.email,
                  color: getColorFromHex("#315399"),
                  size: 14,  
                ), 
                fillColor: "#ffffff", 
                fgColor: "#000000",
                borderColor: "#315399",
                hintText: "Enter receiver's email",
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                textEditingController: receiverEmail,
                regexChecker: isValidEmail,
              ),
              const SizedBox(height: 20,),
              MyText(text: "Account Details", size: 20),
              const SizedBox(height: 10,),
              MyVerboseTextField(
                type: TextFieldType.text, 
                label: "Account Number",
                hintText: "Enter account number",
                fontSize: 14, 
                height: 38, 
                width: 350,  
                fillColor: "#ffffff", 
                borderColor: "#315399",
                fgColor: "#000000", 
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                textEditingController: accountNumber
              ),
              const SizedBox(height: 10,),
              MyVerboseTextField(
                type: TextFieldType.text, 
                label: "Bank Name",
                hintText: "Enter bank name",
                fontSize: 14, 
                height: 38, 
                width: 350, 
                suffixIcon: Icon(
                  Icons.balance,
                  color: getColorFromHex("#315399"),
                  size: 14,
                ), 
                fillColor: "#ffffff", 
                borderColor: "#315399",
                fgColor: "#000000", 
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                textEditingController: bankName
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 350,
                child: MyDropDownButton(
                  items: currency,
                  fontSize: 14,
                  defaultValue: defaultCurrency,
                  suffixIcon: Icons.currency_exchange,
                  label: "Currency", 
                  bgColor: "#ffffff",
                  fgColor: "#000000",
                  borderColor: "#315399",
                ),
              ),
              const SizedBox(height: 10,),
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
              type == FormType.add || type == FormType.update ? (
                SizedBox(
                  width: 350, 
                  child: MyDropDownButton(
                    items: status,
                    fontSize: 14,
                    suffixIcon: Icons.filter_alt,
                    defaultValue: defaultStatus,
                    label: "Status", 
                    bgColor: "#ffffff",
                    fgColor: "#000000",
                    borderColor: "#315399",
                  ),
                )
              ) : Container(),
              const SizedBox(height: 20,),
              MyText(text: "Nearby Agents", size: 20),
              const SizedBox(height: 10,),
              FutureBuilder(
                future: fetchAgents(),
                builder: (BuildContext context, snapshot) {
                  if(snapshot.data != null) {
                    List<String> agents = snapshot.data!.map((agent) => "${agent.fname} ${agent.lname}").toList();
                    
                    if(!agents.contains(defaultAgent.value)) {
                      agents.add(defaultAgent.value);
                    }

                    return  SizedBox(
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
                    );
                  }else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              const SizedBox(height: 20,),
              MyButton(
                text: "Done", 
                width: 350, 
                height: 38,
                bgcolor: "#315399", 
                borderColor: "#315399",
                fgcolor: "#ffffff",
                borderRadius: 19,
                onPressed: () {
                  if(!isValidPhoneNumber(senderPhoneNumber.text) || !isValidName(senderFirstName.text) ||
                    !isValidName(senderLastName.text) || !isValidEmail(senderEmail.text) ||
                    !isValidPhoneNumber(receiverPhoneNumber.text) || !isValidName(receiverFirstName.text) ||
                    !isValidName(receiverLastName.text) || !isValidEmail(receiverEmail.text)|| 
                    (type == FormType.add && defaultStatus.value.isEmpty)
                  ) {
                    showDialog(
                      context: context, 
                      builder: (BuildContext context) {
                        return const MyAlert(
                          type: AlertType.error,
                          errorMessage: "Invalid input!!",
                        );
                      }
                    );
                  } else {
                    showDialog(
                      context: context, 
                      builder: (BuildContext context) {
                        return const MyAlert(
                          type: AlertType.success,
                        );
                      }
                    );
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}