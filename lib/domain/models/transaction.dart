import 'package:finappassistant/domain/models/agent.dart';
import 'package:finappassistant/domain/models/user.dart';
import 'package:finappassistant/utils/constants/enums.dart';

class Transaction {
  final Currency? currency;
  final double? amount;
  final TransactionStatus? status;
  final TransactionType? type;
  final User? sender;
  final User? receiver;
  final Agent? agent;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? supportingDocs;

  const Transaction({
    this.currency,
    this.amount,
    this.status,
    this.type,
    this.sender,
    this.receiver,
    this.agent,
    this.createdAt,
    this.updatedAt,
    this.supportingDocs
  });

  factory Transaction.fromMap(Map<dynamic, dynamic> map) {
    return Transaction(
      currency: Currency.values.byName(map['currency']),
      amount: double.parse(map['amount']),
      status: TransactionStatus.values.byName(map['status']),
      type: TransactionType.values.byName(map['type']),
      sender: User.fromMap(map['sender']),
      receiver: User.fromMap(map['receiver']),
      agent: Agent.fromMap(map['agent']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(int.parse(map['createdAt'])),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(int.parse(map['updatedAt'])),
      supportingDocs: map['supportingDocs']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currency': currency,
      'amount': amount,
      'status': status,
      'type': type,
      'sender': sender,
      'receiver': receiver,
      'agent': agent,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'supportingDocs': supportingDocs
    };
  }
}
