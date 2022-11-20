import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

class NoMembersBanner extends StatelessWidget {
  const NoMembersBanner();

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
