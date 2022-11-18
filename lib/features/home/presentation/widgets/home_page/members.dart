part of '../../pages/home_page.dart';

class _Members extends StatelessWidget {
  const _Members();

  Future<void> _showMembersList({
    required BuildContext context,
  }) async {
    await showCustomModalBottomSheet<void>(
      context: context,
      padding: const EdgeInsets.only(
        top: 15,
        right: 50,
        left: 50,
      ),
      title: const Text(
        'Members for contract',
      ),
      child: const _MembersList(),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<ContractSettingsBloc, ContractSettingsState>(
      builder: (
        BuildContext context,
        ContractSettingsState contractSettingsState,
      ) {
        return Row(
          children: <Widget>[
            Text(
              'Members (${contractSettingsState.members.length})',
            ),
            const Spacer(),
            Button(
              onPressed: () {
                _showMembersList(
                  context: context,
                );
              },
              title: Text(
                contractSettingsState.members.isEmpty ? 'Set up' : 'View',
              ),
            )
          ],
        );
      },
    );
  }
}
