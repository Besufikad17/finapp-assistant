class Account {
  final String? bankName;
  final String? accountNumber;

  const Account({this.bankName, this.accountNumber});

  factory Account.fromMap(Map<dynamic, dynamic> map) {
    return Account(
      bankName: map['bankName'],
      accountNumber: map['accountNumber']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bankName': bankName,
      'accountNumber': accountNumber
    };
  }
}