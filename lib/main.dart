import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/router/router.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_providers.dart';
part 'ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  runApp(
    const _BlocProviders(
      child: _Ui(),
    ),
  );
}
