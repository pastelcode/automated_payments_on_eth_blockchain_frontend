part of '../../pages/home_page.dart';

class _Lapseds extends StatelessWidget {
  const _Lapseds();

  @override
  Widget build(
    BuildContext context,
  ) {
    return AbsorbPointer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Chip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  ApplicationTheme.borderRadius,
                ),
              ),
            ),
            label: const Text(
              'Set members first',
            ),
            labelStyle: Theme.of(
              context,
            ).textTheme.caption!.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimary,
                ),
            backgroundColor: Theme.of(
              context,
            ).colorScheme.primary,
          ),
          Opacity(
            opacity: .5,
            child: Row(
              children: <Widget>[
                const Text(
                  'Lapseds',
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
            ),
          ),
        ],
      ),
    );
  }
}
