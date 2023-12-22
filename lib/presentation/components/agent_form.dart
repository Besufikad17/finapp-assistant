import 'package:finappassistant/presentation/components/alert.dart';
import 'package:finappassistant/presentation/components/button.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';

class MyAgentForm extends StatelessWidget {
  const MyAgentForm({
    super.key,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.email
  });

  final TextEditingController phoneNumber;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      color: getColorFromHex("#ffffff"),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyVerboseTextField(
                type: TextFieldType.phonenNumber, 
                label: "Agent Phone number",
                fontSize: 14, 
                height: 38, 
                width: 350, 
                hintText: "Enter agent's phone number",
                fillColor: "#ffffff", 
                borderColor: "#315399",
                suffixIcon: Icon(
                  Icons.phone,
                  color: getColorFromHex("#315399"),
                  size: 14,
                ),
                fgColor: "#000000", 
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                textEditingController: phoneNumber,
                regexChecker: isValidPhoneNumber,
              ),
              const SizedBox(height: 20,),
              MyText(text: "Sender information", size: 20),
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
                textEditingController: firstName,
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
                textEditingController: lastName,
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
                textEditingController: email,
                regexChecker: isValidEmail,
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
                  if(!isValidPhoneNumber(phoneNumber.text) || !isValidName(firstName.text) ||
                    !isValidName(lastName.text) || !isValidEmail(email.text) 
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
            ]
          )
        )
      )
    );
  }
}