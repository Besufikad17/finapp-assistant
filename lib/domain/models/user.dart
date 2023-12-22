import 'package:finappassistant/domain/models/account.dart';

class User {
  final String? fname;
  final String? lname;
  final String? phoneNumber;
  final String? email;
  final Account? account;

  const User({this.fname, this.lname, this.phoneNumber, this.email, this.account});

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      fname: map['fname'],
      lname: map['lname'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      account: Account.fromMap(map['account'])
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fname': fname,
      'lname': lname,
      'phoneNumber': phoneNumber,
      'email': email,
      'account': account
    };
  }
}