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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text(
                  'Lapseds',
                ),
                if (state.members.isEmpty) ...[
                  const SizedBox(
                    width: 15,
                  ),
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        ApplicationTheme.borderRadius,
                      ),
                    ),
                    avatar: Icon(
                      FlutterRemix.error_warning_line,
                      size: Theme.of(
                            context,
                          ).textTheme.caption!.fontSize! *
                          1.5,
                      color: Colors.orange.shade900,
                    ),
                    label: const Text(
                      'Set members first',
                    ),
                    labelStyle: Theme.of(
                      context,
                    ).textTheme.caption!.copyWith(
                          color: Colors.orange.shade900,
                        ),
                    backgroundColor: Colors.orange.shade50,
                  ),
                ],
                const Spacer(),
                Button(
                  onPressed: state.members.isEmpty ? null : () {},
                  title: Text(
                    state.lapseds.isEmpty ? 'Set up' : 'View',
                  ),
                  tooltip: state.members.isEmpty ? 'Set members first' : '',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
