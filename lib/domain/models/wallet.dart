import 'package:finappassistant/domain/models/account.dart';
import 'package:finappassistant/utils/constants/enums.dart';

class Wallet {
  final double? balance;
  final Currency? currency;
  final Account? account;

  const Wallet({this.balance, this.currency, this.account});

  factory Wallet.fromMap(Map<dynamic, dynamic> map) {
    return Wallet(
      balance: double.parse(map['balance']),
      currency: Currency.values.byName(map['currency']),
      account: Account.fromMap(map['account'])
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'balance': balance,
      'currency': currency,
      'account': account
    };
  }

}