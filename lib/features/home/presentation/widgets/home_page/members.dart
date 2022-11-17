part of '../../pages/home_page.dart';

class _Members extends StatelessWidget {
  const _Members();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: <Widget>[
        const Text(
          'Members',
        ),
        const Spacer(),
        Button(
          onPressed: () {},
          isPrimary: true,
          title: const Text(
            'Set up',
          ),
        ),
      ],
    );
  }
}
