import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Shows a custom modal bottom sheet.
///
/// Consider using a [StatelessWidget] that returns a [SliverList] to pass
/// [child] to take advantage of Flutter's Hot Reload.
Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  Widget? title,
  Widget? child,
  EdgeInsets padding = const EdgeInsets.symmetric(
    horizontal: 20,
  ),
}) async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  final result = await showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(
            context,
          ).size.height *
          0.9,
      maxWidth: 1000,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
          ApplicationTheme.borderRadius,
        ),
      ),
    ),
    builder: (
      BuildContext context,
    ) {
      return _CustomBottomSheet(
        title: title,
        padding: padding,
        child: child,
      );
    },
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  return result;
}

class _CustomBottomSheet extends StatelessWidget {
  const _CustomBottomSheet({
    this.title,
    this.child,
    required this.padding,
  });

  final Widget? title;
  final Widget? child;
  final EdgeInsets padding;

  @override
  Widget build(
    BuildContext context,
  ) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverAppBar(
          toolbarHeight: ApplicationTheme.appBarHeight,
          pinned: true,
          title: title != null
              ? Row(
                  children: <Widget>[
                    const CustomCloseButton(),
                    const SizedBox(
                      width: 20,
                    ),
                    DefaultTextStyle.merge(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      child: title!,
                    ),
                  ],
                )
              : null,
          automaticallyImplyLeading: false,
        ),
        SliverPadding(
          padding: padding.add(
            EdgeInsets.only(
              bottom: MediaQuery.of(
                        context,
                      ).padding.bottom !=
                      0
                  ? MediaQuery.of(
                        context,
                      ).padding.bottom *
                      2
                  : 20,
            ),
          ),
          sliver: child,
        ),
      ],
    );
  }
}
