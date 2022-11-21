part of 'custom_app_bar.dart';

class _AboutBottomSheet extends StatelessWidget {
  const _AboutBottomSheet({super.key});

  static Future<void> show({
    required BuildContext context,
  }) async {
    return showCustomModalBottomSheet(
      context: context,
      title: const Text(
        'About',
      ),
      child: const _AboutBottomSheet(),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[],
    );
  }
}
