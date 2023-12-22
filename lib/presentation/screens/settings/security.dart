import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/config/router/app_router.dart';
import 'package:finappassistant/presentation/components/alert.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/button.dart';
import 'package:finappassistant/presentation/components/email.dart';
import 'package:finappassistant/presentation/components/security_settings.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

@RoutePage()
class SecuritySettingsHomePage extends HookWidget {
  SecuritySettingsHomePage({super.key});

  Map<String, List<dynamic>> settings = {
    "Phone number": [Icons.phone, ChangePhoneNumberRoute(), "09123456"],
    "Email": [Icons.person, ChangeEmailRoute(), "example@gmail.com"],
    "Change password": [Icons.lock, ChangePasswordRoute(), "password"],
  };

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(4);

    return Scaffold(
      backgroundColor: getColorFromHex("#ffffff"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Privacy and security", 
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(text: "Security", size: 20, color: "#6a6a6a",),
                const SizedBox(height: 15,),
                _getSettings(context, settings),
              ]
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }

  Widget _getSettings(BuildContext context, Map<String, List<dynamic>> settings) {
    List<Widget> elems = [];
    int count = 0;

    settings.forEach((key, value) {
      elems.add(
        SecuritySettingComponent(
          title: key, 
          subTitle: value[2], 
          icon: value[0], 
          page: value[1],
          isObscure: count != settings.length - 1,
        )
      );
      count++;
    });

    return Column(children: elems,);
  }
}

@RoutePage()
class ChangePhoneNumberPage extends HookWidget {
  ChangePhoneNumberPage({super.key});

  final TextEditingController currentPhoneNumber = TextEditingController();
  final TextEditingController newPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(4);
    currentPhoneNumber.value = const TextEditingValue(text: "09123456");

    return Scaffold(
      backgroundColor: getColorFromHex("#ffffff"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Phone", 
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(text: "Change your phone", size: 20, color: "#6a6a6a",),
                const SizedBox(height: 15,),
                MyVerboseTextField(
                  type: TextFieldType.phonenNumber, 
                  fontSize: 15, 
                  height: 38, 
                  width: 350, 
                  enabled: false,
                  fillColor: "#ffffff", 
                  label: "Current phone number",
                  borderColor: "#6a6a6a",
                  fgColor: "#000000", 
                  borderRadius: 19, 
                  enabledBorderWidth: 1, 
                  focusedBorderWidth: 1, 
                  textEditingController: currentPhoneNumber
                ),
                const SizedBox(height: 20,),
                MyVerboseTextField(
                  type: TextFieldType.phonenNumber, 
                  fontSize: 15, 
                  height: 38, 
                  width: 350, 
                  fillColor: "#ffffff", 
                  label: "New phone number",
                  hintText: "Enter your new phone number",
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
                  textEditingController: newPhoneNumber,
                  regexChecker: isValidPhoneNumber,
                ),
                const SizedBox(height: 20,),
                MyButton(
                  text: "Save", 
                  width: 350, 
                  height: 38,
                  fontSize: 15,
                  bgcolor: "#315399",
                  borderColor: "#315399",
                  borderRadius: 19, 
                  onPressed: (){
                    if(newPhoneNumber.text.isEmpty || isValidPhoneNumber(newPhoneNumber.text)) {
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
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}

@RoutePage()
class ChangeEmailPage extends HookWidget {
  ChangeEmailPage({super.key});

  final TextEditingController currentEmail = TextEditingController();
  final TextEditingController newEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(4);
    var isVerified = useState(false);
    var code = useState("");
    var input = useState("");
    var isError = useState(false);
    currentEmail.value = const TextEditingValue(text: "exmaple@gmail.com");

    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: getColorFromHex("#ffffff"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Email", 
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
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: width < 400 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                MyText(text: "Email verification", size: 20, color: "#6a6a6a",),
                const SizedBox(height: 15,),
                EmailComponent(isVerified: isVerified.value, email: "exmaple@gmail.com"),
                const SizedBox(height: 15,),
                if(!isVerified.value)
                  VerificationComponent(
                    code: code, 
                    isError: isError, 
                    input: input, 
                    precondition: true,
                    width: width,  
                  ),
                const SizedBox(height: 15,),
                MyText(text: "Change your email", size: 20, color: "#6a6a6a",),
                const SizedBox(height: 15,),
                MyVerboseTextField(
                  type: TextFieldType.text, 
                  fontSize: 15, 
                  height: 38, 
                  width: 350, 
                  enabled: false,
                  fillColor: "#ffffff", 
                  label: "Current email",
                  borderColor: "#6a6a6a",
                  fgColor: "#000000", 
                  borderRadius: 19, 
                  enabledBorderWidth: 1, 
                  focusedBorderWidth: 1, 
                  textEditingController: currentEmail
                ),
                const SizedBox(height: 20,),
                MyVerboseTextField(
                  type: TextFieldType.text, 
                  fontSize: 15, 
                  height: 38, 
                  width: 350, 
                  fillColor: "#ffffff", 
                  label: "New email",
                  hintText: "Enter your new email",
                  borderColor: "#315399",
                  suffixIcon: Icon(
                    Icons.email,
                    color: getColorFromHex("#315399"),
                    size: 14,
                  ),
                  fgColor: "#000000", 
                  borderRadius: 19, 
                  enabledBorderWidth: 1, 
                  focusedBorderWidth: 1, 
                  textEditingController: newEmail,
                  regexChecker: isValidEmail,
                ),
                const SizedBox(height: 10,),
                VerificationComponent(
                  code: code, 
                  isError: isError, 
                  input: input, 
                  label: false,
                  width: width,
                  precondition: (newEmail.text.isNotEmpty || isValidEmail(newEmail.text)),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}

@RoutePage()
class ChangePasswordPage extends HookWidget {
  ChangePasswordPage({super.key});

  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  bool isValid() {
    return oldPassword.text.isEmpty || newPassword.text.isEmpty 
      || confirmPassword.text.isEmpty;
  }

  bool isConfirmed() {
    return newPassword.text != confirmPassword.text;
  }

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(4);
    var isVerified = useState(true);
    var code = useState("");
    var input = useState("");
    var isError = useState(false);
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: getColorFromHex("#ffffff"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Password", 
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: width < 400 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                MyText(text: "Change your password", size: 20, color: "#6a6a6a",),
                const SizedBox(height: 15,),
                MyVerboseTextField(
                  type: TextFieldType.password, 
                  fontSize: 15, 
                  height: 38, 
                  width: 350, 
                  fillColor: "#ffffff", 
                  label: "Old password",
                  hintText: "Enter your old password",
                  borderColor: "#6a6a6a",
                  fgColor: "#000000", 
                  borderRadius: 19, 
                  enabledBorderWidth: 1, 
                  focusedBorderWidth: 1, 
                  suffixIcon: Icon(
                    Icons.lock,
                    color: getColorFromHex("#315399"),
                    size: 14,
                  ),
                  textEditingController: oldPassword
                ),
                const SizedBox(height: 20,),
                MyVerboseTextField(
                  type: TextFieldType.password, 
                  fontSize: 15, 
                  height: 38, 
                  width: 350, 
                  fillColor: "#ffffff", 
                  label: "New password",
                  hintText: "Enter your new password",
                  borderColor: "#315399",
                  suffixIcon: Icon(
                    Icons.lock,
                    color: getColorFromHex("#315399"),
                    size: 14,
                  ),
                  fgColor: "#000000", 
                  borderRadius: 19, 
                  enabledBorderWidth: 1, 
                  focusedBorderWidth: 1, 
                  textEditingController: newPassword,
                ),
                const SizedBox(height: 20,),
                MyVerboseTextField(
                  type: TextFieldType.password, 
                  fontSize: 15, 
                  height: 38, 
                  width: 350, 
                  fillColor: "#ffffff", 
                  label: "Confirm password",
                  hintText: "Confirm your new password",
                  borderColor: "#315399",
                  suffixIcon: Icon(
                    Icons.lock,
                    color: getColorFromHex("#315399"),
                    size: 14,
                  ),
                  fgColor: "#000000", 
                  borderRadius: 19, 
                  enabledBorderWidth: 1, 
                  focusedBorderWidth: 1, 
                  textEditingController: confirmPassword,
                ),
                const SizedBox(height: 20,),
                MyText(text: "Verify your identity", size: 20, color: "#6a6a6a",),
                isVerified.value ?
                  Column(
                    children: [
                      const SizedBox(height: 10,),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            code.value = "12345";
                          },
                          child: MyText(text: "Get code", size: 12, color: "#315399",),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Center(
                        child: VerificationCode(
                          textStyle: TextStyle(
                            fontSize: 20.0, 
                            color: getColorFromHex("#315399")
                          ),
                          keyboardType: TextInputType.number,
                          underlineColor: isError.value ? getColorFromHex("#DC143C") : 
                            getColorFromHex("#315399"), // If this is null it will use primaryColor: Colors.red from Theme
                          underlineUnfocusedColor: isError.value ? getColorFromHex("#DC143C") : 
                            getColorFromHex("#315399"),
                          length: 5,
                          cursorColor:  getColorFromHex("#000000"),
                          onCompleted: (String value) {
                            input.value = value;
                          }, 
                          onEditing: (bool value) {
                          }
                        )
                      ),
                    ],
                  ) :  
                  MyText(text: "your email example@gmail.com isn't verified", size: 15, color: "#DC143C",),
                const SizedBox(height: 20,),
                Center(
                  child: MyButton(
                    text: "Update now", 
                    width: 350, 
                    height: 38,
                    fontSize: 15,
                    bgcolor: "#315399",
                    borderColor: "#315399",
                    borderRadius: 19, 
                    onPressed: (){
                      if(isValid()) {
                        displayError(context, "Invalid input!!");
                      } else {
                        if(isConfirmed()) {
                          displayError(context, "Confirm your password properly!!");
                        }else {
                          if(code.value.isNotEmpty) {
                            int count = 0;
                            for(int i = 0; i < 5; i++) {
                              if(code.value[i] == input.value[i]) {
                                count++;
                              }
                            }
                            isError.value = count != 5;
                          }else {
                            displayError(context, "Get the code first!!");
                          }
                          if(isError.value) {
                            showDialog(
                              context: context, 
                              builder: (BuildContext context) {
                                return const MyAlert(
                                  type: AlertType.success,
                                );
                              }
                            );
                          }else {
                            displayError(context, "Invalid verification code!!");
                          }
                        }
                      }
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}



