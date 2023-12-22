import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/config/router/app_router.dart';
import 'package:finappassistant/domain/models/transaction.dart';
import 'package:finappassistant/presentation/components/alert.dart';
import 'package:finappassistant/presentation/components/app_bar.dart';
import 'package:finappassistant/presentation/components/bottom_navbar.dart';
import 'package:finappassistant/presentation/components/button.dart';
import 'package:finappassistant/presentation/components/text.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/resources/colors.dart';
import 'package:finappassistant/utils/resources/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class TransactionDetailPage extends HookWidget {
  const TransactionDetailPage({
    super.key,
    this.id = 0,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = useState(1);
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MyAppBar(
            title: "Transaction details",
            isCentered: true,
            bgColor: "#315399",
            fgColor: "#ffffff",
            height: 100,
            actions: [
              IconButton(
                  onPressed: () {},
                  highlightColor: getColorFromHex("#254682"),
                  icon: Icon(
                      color: getColorFromHex("#ffffff"), Icons.notifications))
            ],
          )),
      body: FutureBuilder(
        future: getModels(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data != null) {
            Transaction transaction = snapshot.data!.elementAt(id);
            String currencySymbol = getSymbolFromName(transaction.currency!);
            String typeSymbol = getSymbolFromType(transaction.type!);
            String monthName = getMonthName(true, transaction.createdAt!.month - 1);
            String monthName2 = getMonthName(true, transaction.updatedAt!.month - 1);

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: Card(
                        child: Container(
                          width: 345,
                          height: 163,
                          decoration: BoxDecoration(
                            color: getColorFromHex("#ffffff"),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: getColorFromHex("#315399"),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyText(
                                      text:
                                          "$typeSymbol $currencySymbol${transaction.amount}",
                                      size: 32,
                                      color: "#315399",
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    MyText(
                                      text: "Currency",
                                      size: 15,
                                      color: "#6A6A6A",
                                    ),
                                    SizedBox(
                                      width: width > 400 ? 180 : 160,
                                    ),
                                    switch (transaction.currency) {
                                      Currency.etb => MyText(
                                          text: "ETB",
                                          size: 20,
                                          color: "#315399",
                                        ),
                                      Currency.dollar => MyText(
                                          text: "USD",
                                          size: 20,
                                          color: "#315399",
                                        ),
                                      Currency.euro => MyText(
                                          text: "EURO",
                                          size: 20,
                                          color: "#315399",
                                        ),
                                      Currency.pound => MyText(
                                          text: "POUND",
                                          size: 20,
                                          color: "#315399",
                                        ),
                                      Currency.japaneseYen => MyText(
                                          text: "YEN",
                                          size: 20,
                                          color: "#315399"),
                                      Currency.chineseYen => MyText(
                                          text: "YEN",
                                          size: 20,
                                          color: "#315399"),
                                      _ => MyText(
                                          text: "ERROR",
                                          size: 20,
                                          color: "#DC143C",
                                        )
                                    }
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    MyText(
                                      text: "Status",
                                      size: 15,
                                      color: "#6A6A6A",
                                    ),
                                    SizedBox(
                                      width: width > 400 ? 160 : 130,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  getColorFromHex("#315399")),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            top: 4,
                                            right: 10,
                                            bottom: 4),
                                        child: MyText(
                                            text: transaction.status!.name.toUpperCase(),
                                            size: 16,
                                            color: "#315399"),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    MyText(
                                      text: "Account",
                                      size: 15,
                                      color: "#6A6A6A",
                                    ),
                                    const SizedBox(
                                      width: 70,
                                    ),
                                    MyText(
                                      text:
                                          "${transaction.receiver!.account!.bankName}:${transaction.receiver!.account!.accountNumber!}",
                                      size: 12,
                                      color: "#315399",
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Card(
                        child: Container(
                          width: 345,
                          height: 610,
                          decoration: BoxDecoration(
                            color: getColorFromHex("#ffffff"),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: getColorFromHex("#315399"),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        text: "Created by",
                                        size: 15,
                                        color: "#6A6A6A",
                                      ),
                                      MyText(
                                          text:
                                              "at ${transaction.createdAt!.hour}:${transaction.createdAt!.minute} - $monthName ${transaction.createdAt!.day}, ${transaction.createdAt!.year}",
                                          size: 15,
                                          color: "#6A6A6A")
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    MyText(
                                        text: "Admin, Besufikad Micheal",
                                        size: 20,
                                        color: "#315399")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        text: "Completed by",
                                        size: 15,
                                        color: "#6A6A6A",
                                      ),
                                      MyText(
                                          text:
                                              "at ${transaction.updatedAt!.hour}:${transaction.updatedAt!.minute} - $monthName2 ${transaction.updatedAt!.day}, ${transaction.updatedAt!.year}",
                                          size: 15,
                                          color: "#6A6A6A")
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    MyText(
                                      text: "Agent, ${transaction.agent!.fname!} ${transaction.agent!.lname}",
                                      size: 20,
                                      color: "#315399")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText(text: "Sender", size: 15, color: "#6A6A6A"),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.contacts_rounded,
                                          color: getColorFromHex("#315399"),
                                        ),
                                        const SizedBox(width: 20,),
                                        MyText(text: transaction.sender!.fname!, size: 15, isBold: true,)
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: getColorFromHex("#315399"),
                                        ),
                                        const SizedBox(width: 20,),
                                        MyText(text: transaction.sender!.phoneNumber!, size: 15, isBold: true,)
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    MyText(text: "Reciever", size: 15, color: "#6A6A6A"),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.contacts_rounded,
                                          color: getColorFromHex("#315399"),
                                        ),
                                        const SizedBox(width: 20,),
                                        MyText(text: transaction.receiver!.fname!, size: 15, isBold: true,)
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: getColorFromHex("#315399"),
                                        ),
                                        const SizedBox(width: 20,),
                                        MyText(text: transaction.receiver!.phoneNumber!, size: 15, isBold: true,)
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.account_balance,
                                          color: getColorFromHex("#315399"),
                                        ),
                                        const SizedBox(width: 20,),
                                        MyText(text: "${transaction.receiver!.account!.bankName}:${transaction.receiver!.account!.accountNumber}", size: 15, isBold: true,)
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    MyText(text: "Status", size: 15, color: "#6A6A6A"),
                                    const SizedBox(height: 10,),
                                    MyText(text: transaction.status!.name.toUpperCase(), size: 15, color: "#315399"),
                                    const SizedBox(height: 10,),
                                    MyText(text: "Proof doc", size: 15, color: "#6A6A6A"),
                                    Row(
                                      children: (transaction.supportingDocs!.map((docs) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/images/proof.jpg",
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                        );
                                      })).toList()
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MyButton(
                                          text: "Delete", 
                                          width: 109, 
                                          height: 30,
                                          fontSize: 15,
                                          bgcolor: "#ffffff",
                                          fgcolor: "#DC143C",
                                          borderColor: "#DC143C",
                                          borderRadius: 10, 
                                          onPressed: () {
                                            showDialog(
                                              context: context, 
                                              builder: (BuildContext context) {
                                                return MyAlert(
                                                  type: AlertType.dialog,
                                                  body: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        MyText(
                                                          text: "Are you sure you want to \n delete this transaction?", 
                                                          size: 15,
                                                          isBold: true,
                                                        ),
                                                        const SizedBox(height: 10,),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            MyButton(
                                                              text: "Yes", 
                                                              width: 80, 
                                                              height: 20, 
                                                              fontSize: 15, 
                                                              fgcolor: "#DC143C",
                                                              bgcolor: "#ffffff",
                                                              borderColor: "#ffffff",
                                                              onPressed: (){}, 
                                                            ),
                                                            MyButton(
                                                              text: "No", 
                                                              width: 80, 
                                                              height: 20, 
                                                              fontSize: 15, 
                                                              fgcolor: "#315399",
                                                              bgcolor: "#ffffff",
                                                              borderColor: "#ffffff",
                                                              onPressed: (){}, 
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                            );
                                          }
                                        ),
                                        MyButton(
                                          text: "Update", 
                                          width: 109, 
                                          height: 30, 
                                          fontSize: 15,
                                          bgcolor: "#ffffff",
                                          fgcolor: "#a6a6a6",
                                          borderColor: "#a6a6a6",
                                          borderRadius: 10, 
                                          onPressed: () {
                                            context.router.push(UpdateTransactionRoute(transaction: transaction));
                                          })
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(currentPageIndex: currentPageIndex),
    );
  }
}
