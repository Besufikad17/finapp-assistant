// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddAgentRoute.name: (routeData) {
      final args = routeData.argsAs<AddAgentRouteArgs>(
          orElse: () => const AddAgentRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddAgentPage(key: args.key),
      );
    },
    AddTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<AddTransactionRouteArgs>(
          orElse: () => const AddTransactionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddTransactionPage(key: args.key),
      );
    },
    AgentDetailRoute.name: (routeData) {
      final args = routeData.argsAs<AgentDetailRouteArgs>(
          orElse: () => const AgentDetailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AgentDetailPage(
          key: args.key,
          agentId: args.agentId,
        ),
      );
    },
    AgentHomeRoute.name: (routeData) {
      final args = routeData.argsAs<AgentHomeRouteArgs>(
          orElse: () => const AgentHomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AgentHomePage(key: args.key),
      );
    },
    AgentsRoute.name: (routeData) {
      final args = routeData.argsAs<AgentsRouteArgs>(
          orElse: () => const AgentsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AgentsPage(key: args.key),
      );
    },
    BlockedTransactionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlockedTransactionsPage(),
      );
    },
    ChangeEmailRoute.name: (routeData) {
      final args = routeData.argsAs<ChangeEmailRouteArgs>(
          orElse: () => const ChangeEmailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChangeEmailPage(key: args.key),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>(
          orElse: () => const ChangePasswordRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChangePasswordPage(key: args.key),
      );
    },
    ChangePhoneNumberRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePhoneNumberRouteArgs>(
          orElse: () => const ChangePhoneNumberRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChangePhoneNumberPage(key: args.key),
      );
    },
    CreateTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<CreateTransactionRouteArgs>(
          orElse: () => const CreateTransactionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateTransactionPage(key: args.key),
      );
    },
    CurrencySettingsRoute.name: (routeData) {
      final args = routeData.argsAs<CurrencySettingsRouteArgs>(
          orElse: () => const CurrencySettingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CurrencySettingsPage(key: args.key),
      );
    },
    ExportTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<ExportTransactionRouteArgs>(
          orElse: () => const ExportTransactionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExportTransactionPage(
          key: args.key,
          start: args.start,
          end: args.end,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(key: args.key),
      );
    },
    SecuritySettingsHomeRoute.name: (routeData) {
      final args = routeData.argsAs<SecuritySettingsHomeRouteArgs>(
          orElse: () => const SecuritySettingsHomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SecuritySettingsHomePage(key: args.key),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    TransactionDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionDetailRouteArgs>(
          orElse: () => const TransactionDetailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TransactionDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    TransactionHomeRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionHomeRouteArgs>(
          orElse: () => const TransactionHomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TransactionHomePage(key: args.key),
      );
    },
    TransactionsRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionsRouteArgs>(
          orElse: () => const TransactionsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TransactionsPage(key: args.key),
      );
    },
    TrashDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TrashDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TrashDetailsPage(
          key: args.key,
          type: args.type,
        ),
      );
    },
    TrashMainRoute.name: (routeData) {
      final args = routeData.argsAs<TrashMainRouteArgs>(
          orElse: () => const TrashMainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TrashMainPage(key: args.key),
      );
    },
    UpdateAgentRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateAgentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdateAgentPage(
          key: args.key,
          agent: args.agent,
        ),
      );
    },
    UpdateAgentWalletRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateAgentWalletRouteArgs>(
          orElse: () => const UpdateAgentWalletRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdateAgentWalletPage(
          key: args.key,
          agent: args.agent,
        ),
      );
    },
    UpdateProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateProfileRouteArgs>(
          orElse: () => const UpdateProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdateProfilePage(key: args.key),
      );
    },
    UpdateTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateTransactionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdateTransactionPage(
          key: args.key,
          transaction: args.transaction,
        ),
      );
    },
  };
}

/// generated route for
/// [AddAgentPage]
class AddAgentRoute extends PageRouteInfo<AddAgentRouteArgs> {
  AddAgentRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddAgentRoute.name,
          args: AddAgentRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddAgentRoute';

  static const PageInfo<AddAgentRouteArgs> page =
      PageInfo<AddAgentRouteArgs>(name);
}

class AddAgentRouteArgs {
  const AddAgentRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddAgentRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AddTransactionPage]
class AddTransactionRoute extends PageRouteInfo<AddTransactionRouteArgs> {
  AddTransactionRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddTransactionRoute.name,
          args: AddTransactionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddTransactionRoute';

  static const PageInfo<AddTransactionRouteArgs> page =
      PageInfo<AddTransactionRouteArgs>(name);
}

class AddTransactionRouteArgs {
  const AddTransactionRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddTransactionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AgentDetailPage]
class AgentDetailRoute extends PageRouteInfo<AgentDetailRouteArgs> {
  AgentDetailRoute({
    Key? key,
    int agentId = 0,
    List<PageRouteInfo>? children,
  }) : super(
          AgentDetailRoute.name,
          args: AgentDetailRouteArgs(
            key: key,
            agentId: agentId,
          ),
          initialChildren: children,
        );

  static const String name = 'AgentDetailRoute';

  static const PageInfo<AgentDetailRouteArgs> page =
      PageInfo<AgentDetailRouteArgs>(name);
}

class AgentDetailRouteArgs {
  const AgentDetailRouteArgs({
    this.key,
    this.agentId = 0,
  });

  final Key? key;

  final int agentId;

  @override
  String toString() {
    return 'AgentDetailRouteArgs{key: $key, agentId: $agentId}';
  }
}

/// generated route for
/// [AgentHomePage]
class AgentHomeRoute extends PageRouteInfo<AgentHomeRouteArgs> {
  AgentHomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AgentHomeRoute.name,
          args: AgentHomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AgentHomeRoute';

  static const PageInfo<AgentHomeRouteArgs> page =
      PageInfo<AgentHomeRouteArgs>(name);
}

class AgentHomeRouteArgs {
  const AgentHomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AgentHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AgentsPage]
class AgentsRoute extends PageRouteInfo<AgentsRouteArgs> {
  AgentsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AgentsRoute.name,
          args: AgentsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AgentsRoute';

  static const PageInfo<AgentsRouteArgs> page = PageInfo<AgentsRouteArgs>(name);
}

class AgentsRouteArgs {
  const AgentsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AgentsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [BlockedTransactionsPage]
class BlockedTransactionsRoute extends PageRouteInfo<void> {
  const BlockedTransactionsRoute({List<PageRouteInfo>? children})
      : super(
          BlockedTransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlockedTransactionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangeEmailPage]
class ChangeEmailRoute extends PageRouteInfo<ChangeEmailRouteArgs> {
  ChangeEmailRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChangeEmailRoute.name,
          args: ChangeEmailRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChangeEmailRoute';

  static const PageInfo<ChangeEmailRouteArgs> page =
      PageInfo<ChangeEmailRouteArgs>(name);
}

class ChangeEmailRouteArgs {
  const ChangeEmailRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ChangeEmailRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChangePasswordRoute.name,
          args: ChangePasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<ChangePasswordRouteArgs> page =
      PageInfo<ChangePasswordRouteArgs>(name);
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ChangePhoneNumberPage]
class ChangePhoneNumberRoute extends PageRouteInfo<ChangePhoneNumberRouteArgs> {
  ChangePhoneNumberRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChangePhoneNumberRoute.name,
          args: ChangePhoneNumberRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChangePhoneNumberRoute';

  static const PageInfo<ChangePhoneNumberRouteArgs> page =
      PageInfo<ChangePhoneNumberRouteArgs>(name);
}

class ChangePhoneNumberRouteArgs {
  const ChangePhoneNumberRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ChangePhoneNumberRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CreateTransactionPage]
class CreateTransactionRoute extends PageRouteInfo<CreateTransactionRouteArgs> {
  CreateTransactionRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreateTransactionRoute.name,
          args: CreateTransactionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateTransactionRoute';

  static const PageInfo<CreateTransactionRouteArgs> page =
      PageInfo<CreateTransactionRouteArgs>(name);
}

class CreateTransactionRouteArgs {
  const CreateTransactionRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreateTransactionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CurrencySettingsPage]
class CurrencySettingsRoute extends PageRouteInfo<CurrencySettingsRouteArgs> {
  CurrencySettingsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CurrencySettingsRoute.name,
          args: CurrencySettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CurrencySettingsRoute';

  static const PageInfo<CurrencySettingsRouteArgs> page =
      PageInfo<CurrencySettingsRouteArgs>(name);
}

class CurrencySettingsRouteArgs {
  const CurrencySettingsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CurrencySettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ExportTransactionPage]
class ExportTransactionRoute extends PageRouteInfo<ExportTransactionRouteArgs> {
  ExportTransactionRoute({
    Key? key,
    DateTime? start,
    DateTime? end,
    List<PageRouteInfo>? children,
  }) : super(
          ExportTransactionRoute.name,
          args: ExportTransactionRouteArgs(
            key: key,
            start: start,
            end: end,
          ),
          initialChildren: children,
        );

  static const String name = 'ExportTransactionRoute';

  static const PageInfo<ExportTransactionRouteArgs> page =
      PageInfo<ExportTransactionRouteArgs>(name);
}

class ExportTransactionRouteArgs {
  const ExportTransactionRouteArgs({
    this.key,
    this.start,
    this.end,
  });

  final Key? key;

  final DateTime? start;

  final DateTime? end;

  @override
  String toString() {
    return 'ExportTransactionRouteArgs{key: $key, start: $start, end: $end}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SecuritySettingsHomePage]
class SecuritySettingsHomeRoute
    extends PageRouteInfo<SecuritySettingsHomeRouteArgs> {
  SecuritySettingsHomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SecuritySettingsHomeRoute.name,
          args: SecuritySettingsHomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SecuritySettingsHomeRoute';

  static const PageInfo<SecuritySettingsHomeRouteArgs> page =
      PageInfo<SecuritySettingsHomeRouteArgs>(name);
}

class SecuritySettingsHomeRouteArgs {
  const SecuritySettingsHomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SecuritySettingsHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransactionDetailPage]
class TransactionDetailRoute extends PageRouteInfo<TransactionDetailRouteArgs> {
  TransactionDetailRoute({
    Key? key,
    int id = 0,
    List<PageRouteInfo>? children,
  }) : super(
          TransactionDetailRoute.name,
          args: TransactionDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionDetailRoute';

  static const PageInfo<TransactionDetailRouteArgs> page =
      PageInfo<TransactionDetailRouteArgs>(name);
}

class TransactionDetailRouteArgs {
  const TransactionDetailRouteArgs({
    this.key,
    this.id = 0,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'TransactionDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [TransactionHomePage]
class TransactionHomeRoute extends PageRouteInfo<TransactionHomeRouteArgs> {
  TransactionHomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TransactionHomeRoute.name,
          args: TransactionHomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TransactionHomeRoute';

  static const PageInfo<TransactionHomeRouteArgs> page =
      PageInfo<TransactionHomeRouteArgs>(name);
}

class TransactionHomeRouteArgs {
  const TransactionHomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'TransactionHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [TransactionsPage]
class TransactionsRoute extends PageRouteInfo<TransactionsRouteArgs> {
  TransactionsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TransactionsRoute.name,
          args: TransactionsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const PageInfo<TransactionsRouteArgs> page =
      PageInfo<TransactionsRouteArgs>(name);
}

class TransactionsRouteArgs {
  const TransactionsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'TransactionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [TrashDetailsPage]
class TrashDetailsRoute extends PageRouteInfo<TrashDetailsRouteArgs> {
  TrashDetailsRoute({
    Key? key,
    required TrashType type,
    List<PageRouteInfo>? children,
  }) : super(
          TrashDetailsRoute.name,
          args: TrashDetailsRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'TrashDetailsRoute';

  static const PageInfo<TrashDetailsRouteArgs> page =
      PageInfo<TrashDetailsRouteArgs>(name);
}

class TrashDetailsRouteArgs {
  const TrashDetailsRouteArgs({
    this.key,
    required this.type,
  });

  final Key? key;

  final TrashType type;

  @override
  String toString() {
    return 'TrashDetailsRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [TrashMainPage]
class TrashMainRoute extends PageRouteInfo<TrashMainRouteArgs> {
  TrashMainRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TrashMainRoute.name,
          args: TrashMainRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TrashMainRoute';

  static const PageInfo<TrashMainRouteArgs> page =
      PageInfo<TrashMainRouteArgs>(name);
}

class TrashMainRouteArgs {
  const TrashMainRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'TrashMainRouteArgs{key: $key}';
  }
}

/// generated route for
/// [UpdateAgentPage]
class UpdateAgentRoute extends PageRouteInfo<UpdateAgentRouteArgs> {
  UpdateAgentRoute({
    Key? key,
    required Agent agent,
    List<PageRouteInfo>? children,
  }) : super(
          UpdateAgentRoute.name,
          args: UpdateAgentRouteArgs(
            key: key,
            agent: agent,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateAgentRoute';

  static const PageInfo<UpdateAgentRouteArgs> page =
      PageInfo<UpdateAgentRouteArgs>(name);
}

class UpdateAgentRouteArgs {
  const UpdateAgentRouteArgs({
    this.key,
    required this.agent,
  });

  final Key? key;

  final Agent agent;

  @override
  String toString() {
    return 'UpdateAgentRouteArgs{key: $key, agent: $agent}';
  }
}

/// generated route for
/// [UpdateAgentWalletPage]
class UpdateAgentWalletRoute extends PageRouteInfo<UpdateAgentWalletRouteArgs> {
  UpdateAgentWalletRoute({
    Key? key,
    Agent? agent,
    List<PageRouteInfo>? children,
  }) : super(
          UpdateAgentWalletRoute.name,
          args: UpdateAgentWalletRouteArgs(
            key: key,
            agent: agent,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateAgentWalletRoute';

  static const PageInfo<UpdateAgentWalletRouteArgs> page =
      PageInfo<UpdateAgentWalletRouteArgs>(name);
}

class UpdateAgentWalletRouteArgs {
  const UpdateAgentWalletRouteArgs({
    this.key,
    this.agent,
  });

  final Key? key;

  final Agent? agent;

  @override
  String toString() {
    return 'UpdateAgentWalletRouteArgs{key: $key, agent: $agent}';
  }
}

/// generated route for
/// [UpdateProfilePage]
class UpdateProfileRoute extends PageRouteInfo<UpdateProfileRouteArgs> {
  UpdateProfileRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UpdateProfileRoute.name,
          args: UpdateProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UpdateProfileRoute';

  static const PageInfo<UpdateProfileRouteArgs> page =
      PageInfo<UpdateProfileRouteArgs>(name);
}

class UpdateProfileRouteArgs {
  const UpdateProfileRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UpdateProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [UpdateTransactionPage]
class UpdateTransactionRoute extends PageRouteInfo<UpdateTransactionRouteArgs> {
  UpdateTransactionRoute({
    Key? key,
    required Transaction transaction,
    List<PageRouteInfo>? children,
  }) : super(
          UpdateTransactionRoute.name,
          args: UpdateTransactionRouteArgs(
            key: key,
            transaction: transaction,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateTransactionRoute';

  static const PageInfo<UpdateTransactionRouteArgs> page =
      PageInfo<UpdateTransactionRouteArgs>(name);
}

class UpdateTransactionRouteArgs {
  const UpdateTransactionRouteArgs({
    this.key,
    required this.transaction,
  });

  final Key? key;

  final Transaction transaction;

  @override
  String toString() {
    return 'UpdateTransactionRouteArgs{key: $key, transaction: $transaction}';
  }
}
