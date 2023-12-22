import 'package:finappassistant/domain/models/account.dart';
import 'package:finappassistant/domain/models/address.dart';
import 'package:finappassistant/domain/models/user.dart';
import 'package:finappassistant/domain/models/wallet.dart';

class Agent extends User {
  final String? fname;
  final String? lname;
  final String? phoneNumber;
  final String? email;
  final Account? account;
  final List<Wallet>? wallets;
  final Address? address;

  const Agent({
    this.fname, 
    this.lname, 
    this.phoneNumber, 
    this.email,
    this.account,
    this.wallets,
    this.address
  }): super(
    fname: fname,
    lname: lname,
    phoneNumber: phoneNumber,
    email: email,
    account: account
  );

  factory Agent.fromMap(Map<dynamic, dynamic> map) {
    return Agent(
      fname: map['fname'],
      lname: map['lname'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      account: Account.fromMap(map['account']),
      wallets: (map['wallets'] as List<dynamic>).map((wallet) {
        return Wallet.fromMap(wallet);
      }).toList(),
      address: Address.fromMap(map['address'])
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fname': fname,
      'lname': lname,
      'phoneNumber': phoneNumber,
      'email': email,
      'account': account,
      'wallets': wallets,
      'address': address
    };
  }
}
