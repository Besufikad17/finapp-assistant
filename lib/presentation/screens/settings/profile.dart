import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/presentation/components/alert.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/button.dart';
import 'package:finappassistant/presentation/components/dropdown_button.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/constants/strings.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class UpdateProfilePage extends HookWidget {
  UpdateProfilePage({super.key});

  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();

  final List<String> countries = [
    "Ethiopia",
    "USA",
    "England",
    "China",
    "Japan",
    "Germany"
  ];

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(4);
    var imageUrl = useState("");
    var defaultCountry = useState(countries.first);

    return Scaffold(
      backgroundColor: getColorFromHex("#ffffff"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Profile setting", 
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(text: "Update your profile", size: 18, color: "#6a6a6a",),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.network(
                      defaultProfilePicture,
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const SizedBox(width: 15,),
                  MyText(text: imageUrl.value, size: 12, color: "#000000",)
                ],
              ),
              const SizedBox(height: 15,),
              MyVerboseTextField(
                type: TextFieldType.text, 
                fontSize: 15, 
                height: 38, 
                width: 350,
                label: "First name",
                hintText: "Enter your first name", 
                fillColor: "#ffffff", 
                fgColor: "#000000",
                borderColor: "#315399",
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                suffixIcon: Icon(
                  Icons.contacts_outlined,
                  color: getColorFromHex("#315399"),
                  size: 14,
                ),
                textEditingController: fname,
                regexChecker: isValidName,
              ),
              const SizedBox(height: 15,),
              MyVerboseTextField(
                type: TextFieldType.text, 
                fontSize: 15, 
                height: 38, 
                width: 350,
                label: "Last name",
                hintText: "Enter your last name", 
                fillColor: "#ffffff", 
                fgColor: "#000000",
                borderColor: "#315399",
                borderRadius: 19, 
                enabledBorderWidth: 1, 
                focusedBorderWidth: 1, 
                suffixIcon: Icon(
                  Icons.contacts_outlined,
                  color: getColorFromHex("#315399"),
                  size: 14,
                ),
                textEditingController: lname,
                regexChecker: isValidName,
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 350,
                child: MyDropDownButton(
                  items: countries,
                  fontSize: 14,
                  defaultValue: defaultCountry,
                  suffixIcon: Icons.flag,
                  label: "Select country", 
                  bgColor: "#ffffff",
                  fgColor: "#000000",
                  borderColor: "#315399",
                ),
              ),
              const SizedBox(height: 15,),
              MyButton(
                text: "Save", 
                width: 350, 
                height: 38,
                fontSize: 15,
                bgcolor: "#315399",
                borderColor: "#315399",
                borderRadius: 19, 
                onPressed: (){
                  if(fname.text.isEmpty || lname.text.isEmpty || imageUrl.value.isEmpty
                    || !isValidName(fname.text) || !isValidName(lname.text)
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
              ),
            ],
          )
        )
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}