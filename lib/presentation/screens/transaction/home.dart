import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/config/router/app_router.dart';
import 'package:finappassistant/domain/models/transaction.dart';
import 'package:finappassistant/presentation/components/actions.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/dropdown_button.dart';
import 'package:finappassistant/presentation/components/pagination.dart';
import 'package:finappassistant/presentation/components/quick_access.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/presentation/components/text_field.dart';
import 'package:finappassistant/presentation/components/transaction.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class TransactionHomePage extends HookWidget {
  TransactionHomePage({super.key});

  final List<String> menu = ["Name", "Phone"];
  final searchField = TextEditingController();

  final List<Widget> access = [
    MyAction(
      title: "Create Transaction", 
      logoUrl: "assets/images/balance-logo.jpg", 
      page: CreateTransactionRoute()
    ),
    MyAction(
      title:  "View Transaction",
      logoUrl: "assets/images/doc-search-logo2.jpg",
      page: TransactionsRoute(),
    ),
    MyAction(
      title: "Export Transactions",
      logoUrl: "assets/images/excel-logo.jpg",
      page: ExportTransactionRoute(),
    ),
    MyAction(
      title: "Add Transactions", 
      logoUrl: "assets/images/add-logo.jpg", 
      page: AddTransactionRoute()
    ),
  ];

  bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(1);
    var skip = useState(0);
    var take = useState(10);
    var sortBy = useState(menu.first);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: MyAppBar(
          title: "Transactions", 
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
        child: Container(
          width: width,
          color: getColorFromHex("#f2f2f2"),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: getColorFromHex("#315399"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width < 600 ? width * 0.4: 120,
                          // height: 65,
                          child: MyDropDownButton(
                            items: menu, 
                            bgColor: "#315399",
                            fgColor: "#ffffff",
                            fontSize: 12,
                            borderColor: "#ffffff",
                            suffixIcon: Icons.filter_alt,
                            defaultValue: sortBy
                          )
                        ),
                        const SizedBox(width: 10,),
                        SizedBox(
                          width: width < 600 ? width * 0.5: 300,
                          height: 55,
                          child: MyTextField(
                            height: 65,
                            width: width < 600 ? width * 0.5: 300,
                            suffixIcon: Icon(
                              Icons.search,
                              color: getColorFromHex("#315399"),
                            ),
                            fontSize: 12,
                            hintText: "Search",
                            textEditingController: searchField,
                            type: TextFieldType.text,
                            fillColor: "#ffffff",
                            topRightBorderRadius: 20,
                            topLeftBorderRadius: 20,
                            bottomRightBorderRadius: 20,
                            bottomLeftBorderRadius: 20,
                          )
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: MyText(text: "Transaction menu", size: 26, color: "#ffffff",),
                    )
                  ],
                ),
              ),
              QuickAccess(access: access, topMargin: 10, hideTitle: true,),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  color: getColorFromHex("#ffffff"),
                  borderRadius: const BorderRadius.all(Radius.circular(25))
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    MyText(
                      text: "Recent transactions", 
                      size: 20, 
                      isBold: true,
                    ),
                    const SizedBox(height: 20,),
                    FutureBuilder(
                      future: getModels(),
                      builder: (BuildContext context, snapshot) {
                        if(snapshot.data != null) {
                          return Column(
                            children: [
                              getTransactions(context, snapshot.data!, skip.value, take.value),
                              MyPagination(
                                pages: getPages(snapshot.data!.length),
                                back: () {
                                  skip.value = skip.value - 10;
                                }, 
                                next: () {
                                  skip.value = skip.value + 10;
                                },
                                select: (int page) {
                                  skip.value = (page - 1) * 10;
                                },
                              ),
                            ]
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
                  ],
                ),
              ),
            ],
          )
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}

Widget getTransactions(BuildContext context, List<Transaction> transactions, int skip, int take) {
  List<Widget> elems = [];
  
  for(int i = skip; i < (skip + take); i++) {
    String currencySymbol = getSymbolFromName(transactions[i].currency!);
    elems.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: GestureDetector(
          onTap: () {
            context.router.push(TransactionDetailRoute(id: i));
          },
          child: TransactionComponent(
            onlyBottom: i != skip,
            fullName: "${transactions[i].agent!.fname} ${transactions[i].agent!.lname} ", 
            amount: (transactions[i].amount!) > 1000 ? 
              "$currencySymbol${((transactions[i].amount!) / 1000).toStringAsFixed(2)}k" : 
              "$currencySymbol${transactions[i].amount}", 
            date: "${transactions[i].updatedAt!.year}-${transactions[i].updatedAt!.month}-${transactions[i].updatedAt!.day} " + 
              "${transactions[i].updatedAt!.hour}:${transactions[i].updatedAt!.minute}", 
            status: transactions[i].status!,
            type: transactions[i].type!,
          ),
        ),
      )
    );
  }

  return Column(
    children: elems,
  );
}
