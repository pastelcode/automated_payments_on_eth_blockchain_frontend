part of '../../pages/home_page.dart';

class _Members extends StatelessWidget {
  const _Members();

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<ContractSettingsBloc, ContractSettingsState>(
      builder: (
        BuildContext context,
        ContractSettingsState state,
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
              title: Text(
                state.members.isEmpty ? 'Set up' : 'View',
              ),
            )
          ],
        );
      },
    );
  }
}
