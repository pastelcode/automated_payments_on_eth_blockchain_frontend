import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
