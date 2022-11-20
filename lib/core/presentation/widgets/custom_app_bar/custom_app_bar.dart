import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';

part 'appearance_option.dart';
part 'application_menu_button.dart';

/// {@template custom_app_bar}
/// A custom application bar with essential actions.
/// {@endtemplate}
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// {@macro custom_app_bar}
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  /// The title for this app bar.
  final Widget title;

  /// The actions for this app bar.
  ///
  /// Application menu icon button is provided by default.
  final List<Widget>? actions;

  @override
  Widget build(
    BuildContext context,
  ) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(
      context,
    );

    return AppBar(
      leading: (parentRoute != null && parentRoute.canPop)
          ? const CustomBackButton()
          : null,
      title: DefaultTextStyle.merge(
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 20,
            ),
            title,
            const Spacer(),
            ...?actions,
            const ApplicationMenuButton(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        ApplicationTheme.appBarHeight,
      );
}
