part of 'main.dart';

class _BlocProviders extends StatelessWidget {
  const _BlocProviders({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(
    BuildContext context,
  ) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (
            _,
          ) {
            return ThemeBloc();
          },
        ),
        BlocProvider(
          create: (
            _,
          ) {
            return SignAndExecuteContractBloc();
          },
        ),
        BlocProvider(
          create: (
            _,
          ) {
            return ContractSettingsBloc();
          },
        ),
      ],
      child: child,
    );
  }
}
