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
                Text(
                  '''
Lapseds${state.lapseds.isEmpty ? '' : ' (${state.lapseds.length})'}''',
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
                    ),
                    label: const Text(
                      'Set members first',
                    ),
                    labelStyle: Theme.of(
                      context,
                    ).textTheme.caption,
                    backgroundColor: Colors.blue.withOpacity(
                      .1,
                    ),
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
