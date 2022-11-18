part of '../../pages/home_page.dart';

class _Lapseds extends StatelessWidget {
  const _Lapseds();

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<ContractSettingsBloc, ContractSettingsState>(
      builder: (
        BuildContext context,
        ContractSettingsState state,
      ) {
        return Tooltip(
          message: state.members.isEmpty ? 'Set members first' : '',
          child: AbsorbPointer(
            absorbing: state.members.isEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (state.members.isEmpty)
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
                  opacity: state.members.isEmpty ? .5 : 1,
                  child: Row(
                    children: <Widget>[
                      const Text(
                        'Lapseds',
                      ),
                      const Spacer(),
                      Button(
                        onPressed: () {},
                        title: Text(
                          state.lapseds.isEmpty ? 'Set up' : 'View',
                        ),
                        tooltip:
                            state.members.isEmpty ? 'Set members first' : '',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
