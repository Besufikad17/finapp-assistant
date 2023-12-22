import 'package:auto_route/auto_route.dart';
import 'package:finappassistant/domain/models/agent.dart';
import 'package:finappassistant/domain/models/transaction.dart';
import 'package:finappassistant/presentation/screens/agent/add_agent.dart';
import 'package:finappassistant/presentation/screens/agent/agent_detail.dart';
import 'package:finappassistant/presentation/screens/agent/home.dart';
import 'package:finappassistant/presentation/screens/agent/update_agent.dart';
import 'package:finappassistant/presentation/screens/settings/blocked.dart';
import 'package:finappassistant/presentation/screens/settings/currency.dart';
import 'package:finappassistant/presentation/screens/settings/profile.dart';
import 'package:finappassistant/presentation/screens/settings/security.dart';
import 'package:finappassistant/presentation/screens/settings/trash.dart';
import 'package:finappassistant/presentation/screens/transaction/add_transaction.dart';
import 'package:finappassistant/presentation/screens/agent/agents.dart';
import 'package:finappassistant/presentation/screens/login.dart';
import 'package:finappassistant/presentation/screens/home.dart';
import 'package:finappassistant/presentation/screens/settings.dart';
import 'package:finappassistant/presentation/screens/transaction/create_transaction.dart';
import 'package:finappassistant/presentation/screens/transaction/export_transaction.dart';
import 'package:finappassistant/presentation/screens/transaction/home.dart';
import 'package:finappassistant/presentation/screens/transaction/transaction_detail.dart';
import 'package:finappassistant/presentation/screens/transaction/transactions.dart';
import 'package:finappassistant/presentation/screens/transaction/update_transaction.dart';
import 'package:finappassistant/utils/constants/enums.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  final bool isLoggedIn;

  AppRouter({required this.isLoggedIn});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: isLoggedIn),
    AutoRoute(page: LoginRoute.page, initial: !isLoggedIn),
    AutoRoute(page: TransactionHomeRoute.page),
    AutoRoute(page: TransactionsRoute.page),
    AutoRoute(page: AddTransactionRoute.page),
    AutoRoute(page: CreateTransactionRoute.page),
    AutoRoute(page: TransactionDetailRoute.page),
    AutoRoute(page: UpdateTransactionRoute.page),
    AutoRoute(page: ExportTransactionRoute.page),
    AutoRoute(page: AgentHomeRoute.page),
    AutoRoute(page: AddAgentRoute.page),
    AutoRoute(page: AgentsRoute.page),
    AutoRoute(page: AgentDetailRoute.page),
    AutoRoute(page: UpdateAgentRoute.page),
    AutoRoute(page: UpdateAgentWalletRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: CurrencySettingsRoute.page),
    AutoRoute(page: UpdateProfileRoute.page),
    AutoRoute(page: TrashMainRoute.page),
    AutoRoute(page: TrashDetailsRoute.page),
    AutoRoute(page: SecuritySettingsHomeRoute.page),
    AutoRoute(page: ChangePhoneNumberRoute.page),
    AutoRoute(page: ChangeEmailRoute.page),
    AutoRoute(page: ChangePasswordRoute.page),
    AutoRoute(page: BlockedTransactionsRoute.page)
  ];
}