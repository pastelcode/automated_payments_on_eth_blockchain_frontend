part of 'main.dart';

class _Ui extends StatelessWidget {
  const _Ui();

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: 'Automated payments on ETH blockchain',
      scrollBehavior: const _ScrollBehaviorModified(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Automated payments on ETH blockchain',
          ),
        ),
      ),
    );
  }
}

class _ScrollBehaviorModified extends ScrollBehavior {
  const _ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(
    _,
  ) {
    return const BouncingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics(),
    );
  }
}
