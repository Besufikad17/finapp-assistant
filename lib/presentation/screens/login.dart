import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/config/router/app_router.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class LoginPage extends HookWidget {
  LoginPage({super.key});

  final emailOrPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var checked = useState(false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.075),
        child: MyAppBar(
          title: "", 
          height: height * 0.075,
          automaticallyImplyLeading: false, 
          bgColor: "#315399",
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Theme.of(context).colorScheme.primary,
          color: getColorFromHex("#315399"),
          child: Form(
            child: Column(
              children: [
                SizedBox(height: height * 0.005,),
                Center(child: Image.asset("assets/images/logo-top.png")),
                SizedBox(height: height * 0.05,),
                MyText(
                  text: "Financial App", 
                  size: 0.047 * height, 
                  isBold: true, 
                  color: "#ffffff",
                ),
                SizedBox(height: height * 0.075,),
                MyText(
                  text: "Admin Login", 
                  size: 0.028 * height, 
                  color: "#ffffff",
                ),
                SizedBox(height: height * 0.05,),
                Container(
                  width: width < 600 ? width : 600,
                  child: Row(
                    mainAxisAlignment: width < 600 ? MainAxisAlignment.start : MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SingleChildScrollView(
                            child: SizedBox(
                              width: width < 600 ? width * 0.89 : 400,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: [
                                  MyTextField(
                                    fontSize: height * 0.0165, 
                                    topRightBorderRadius: width * 0.12,
                                    type: TextFieldType.text,
                                    width: width < 600 ? width * 0.89 : 400,
                                    height: height * 0.06,
                                    fillColor: "#D9D9D9", 
                                    hintText: "Enter email or phone number", 
                                    textEditingController: emailOrPhoneNumber,
                                    prefixIcon: Icon(
                                      Icons.person_2_outlined,
                                      color: getColorFromHex("#315399"),
                                    )
                                  ),
                                  const SizedBox(height: 1.5,),
                                  MyTextField(
                                    fontSize: height * 0.0165, 
                                    type: TextFieldType.password,
                                    fillColor: "#D9D9D9", 
                                    bottomRightBorderRadius: width * 0.12,
                                    width: width < 600 ? width * 0.89 : 400,
                                    height: height * 0.06,
                                    hintText: "Password", 
                                    textEditingController: emailOrPhoneNumber,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: getColorFromHex("#315399"),
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: width < 600 ? width * 0.82 : 370,
                            top: height * 0.02,
                            child: FloatingActionButton(
                              elevation: 0,
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                 color: getColorFromHex("#315399"),
                                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(0, 3),
                                    ),
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 0),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.forward,
                                  color: getColorFromHex("#ffffff"),
                                ),
                              ),
                              onPressed: (){
                                context.router.replace(HomeRoute());
                              }
                            ),
                          ),
                        ]
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.005,),
                SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 4, right: 18),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              tristate: true,
                              checkColor: getColorFromHex("#315399"),
                              activeColor: getColorFromHex("#ffffff"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                              side: BorderSide(
                                color: getColorFromHex("#ffffff"),
                              ),
                              value: checked.value,
                              semanticLabel: "Remember me",
                              onChanged: (bool? value) {
                                checked.value = value != null;
                              },
                            ),
                            MyText(
                              text: "Remember me", 
                              size: height * 0.0165,
                              color: "#ffffff",
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child:  MyText(
                            text: "Forgot?", 
                            size: height * 0.0165,
                            color: "#ffffff",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.17,),
                Center(child: Image.asset("assets/images/logo-bottom.png")),
              ],
            ),
          ),
        ),
      )
    );
  }
}