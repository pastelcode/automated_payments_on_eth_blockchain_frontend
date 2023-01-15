import 'dart:developer';

import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/router/router.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/sign_and_execute_contract_bloc/sign_and_execute_contract_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

part 'bloc_observer.dart';
part 'bloc_providers.dart';
part 'ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(
    () async* {
      yield LicenseEntryWithLineBreaks(
        <String>[
          'Inter',
        ],
        await rootBundle.loadString(
          'assets/fonts/Inter.OFL.txt',
        ),
      );
    },
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  Bloc.observer = ApplicationBlocObserver();

  runApp(
    const _BlocProviders(
      child: _Ui(),
    ),
  );
}
