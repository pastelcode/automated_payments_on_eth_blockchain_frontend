import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template no_members_banner}
/// A banner to show when there are no members for the contract previously
/// added.
/// {@endtemplate}
class NoMembersBanner extends StatelessWidget {
  /// {@macro no_members_banner}
  const NoMembersBanner({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: <Widget>[
        const Icon(
          FlutterRemix.user_add_line,
          size: 72,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'There are no members',
          style: Theme.of(
            context,
          ).textTheme.headline6,
        ),
      ],
    );
  }
}
