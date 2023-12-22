import 'dart:convert';
import 'package:finappassistant/domain/models/agent.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:finappassistant/utils/constants/strings.dart';
import 'package:http/http.dart' as http;

import 'package:finappassistant/domain/models/transaction.dart';
import 'package:intl/intl.dart';

Future<List<Transaction>> getModels() async {
  List<Transaction> models = [];
  var headers = { 'Content-Type': 'application/json' };

  try {
    final response = await http.get(Uri.parse('$apiBaseUrl/transactions'));
    response.headers.addAll(headers);

    if(response.statusCode == 200) {
      var res = jsonDecode(response.body)["data"];
      List<Map<dynamic, dynamic>> result = [];

      for (var item in res) {
        result.add(Map<dynamic, dynamic>.from(item));
      }

      for(var element in result) {
        models.add(Transaction.fromMap(element));
      }
    }else {
      throw Exception('Failed to load transactions');
    }
  } catch (e) {
    print('Error reading or parsing the JSON: $e');
  }
  return models;
}

Future<List<Agent>> fetchAgents() async {
  List<Agent> agents = [];
  var headers = { 'Content-Type': 'application/json' };

  try {
    final response = await http.get(Uri.parse("$apiBaseUrl/agents"));
    response.headers.addAll(headers);

    if(response.statusCode == 200) {
      var res = jsonDecode(response.body)["data"];
      List<Map<dynamic, dynamic>> result = [];

      for (var item in res) {
        result.add(Map<dynamic, dynamic>.from(item));
      }

      for(var element in result) {
        agents.add(Agent.fromMap(element));
      }
    }else {
      throw Exception('Failed to load agents');
    }
  } catch (e) {
    print('Error reading or parsing the JSON: $e');
  }

  return agents;
}

String getGreeting() {
  int hour = DateTime.now().hour;

  if (hour >= 5 && hour < 12) {
    return "Good morning";
  } else if (hour >= 12 && hour < 18) {
    return "Good afternoon";
  } else {
    return "Good evening";
  }
}

String getSymbolFromName(Currency currency) {
  switch(currency) {
    case Currency.etb:
      return "ETB";
    case Currency.dollar:
      return "\$";
    case Currency.euro:
      return "€";
    case Currency.pound:
      return "£";
    case Currency.japaneseYen:
    case Currency.chineseYen:
      return "¥";
  }
}

String getSymbolFromType(TransactionType type) {
  switch(type) {
    case TransactionType.sent:
      return "-";
    case TransactionType.received:
      return "+";
  }
}

String getFullName(Currency currency) {
  switch(currency) {
    case Currency.etb:
      return "Ethiopian birr";
    case Currency.dollar:
      return "US dollar";
    case Currency.euro:
      return "Euro";
    case Currency.pound:
      return "United Kingdom pound";
    case Currency.chineseYen:
      return "Chinese yen";
    case Currency.japaneseYen:
      return "Japanese yen";
  }
}

String getMonthName(bool isShort, int index) {
  return isShort ? months[index].substring(0, 3) : months[index];
}

String formatNumber(double number) {
  NumberFormat formatter = NumberFormat('#,###');
  return formatter.format(number);
}

List<int> getPages(int total) {
  List<int> pages = [];
  for(int i = 1; i < (total / 10) + 1; i++) {
    pages.add(i);
  }
  return pages;
}

bool isValidEmail(String email) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

bool isValidPhoneNumber(String phoneNumber) {
  String pattern = r'(^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$)';
  return  RegExp(pattern).hasMatch(phoneNumber);
}

bool isValidName(String fullName) {
  String pattern = r'^[a-z A-Z,.\-]+$';
  return RegExp(pattern).hasMatch(fullName);
}
