import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template sum_of_members_percents_must_be_100_banner}
/// A banner that shows a reminder that members percent sum must be 100.
/// {@endtemplate}
class SumOfMembersPercentMustBe100Banner extends StatelessWidget {
  /// {@macro sum_of_members_percents_must_be_100_banner}
  const SumOfMembersPercentMustBe100Banner({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(
          .1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            ApplicationTheme.borderRadius,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(
            FlutterRemix.information_line,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              'Reminder: Sum of members percents must be 100',
            ),
          ),
        ],
      ),
    );
  }
}
