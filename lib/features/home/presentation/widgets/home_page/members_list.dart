part of '../../pages/home_page.dart';

class _MembersList extends StatelessWidget {
  const _MembersList();

  void _removeMember({
    required BuildContext context,
    required Member member,
  }) {
    context.read<ContractSettingsBloc>().add(
          RemoveMember(
            member: member,
          ),
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
        return ListView.separated(
          itemCount: contractSettingsState.members.length,
          shrinkWrap: true,
          separatorBuilder: (
            _,
            __,
          ) {
            return const SizedBox(
              height: 15,
            );
          },
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            final member = contractSettingsState.members[index];

            return Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(
                          .1,
                        ),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${index + 1}',
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: _MemberEntry(
                    address: member.address,
                    percent: member.percent,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  onPressed: () {
                    _removeMember(
                      context: context,
                      member: contractSettingsState.members[index],
                    );
                  },
                  title: const Icon(
                    FlutterRemix.delete_bin_line,
                  ),
                  tooltip: 'Delete member',
                ),
              ],
            );
          },
        );
      },
    );
  }
}
