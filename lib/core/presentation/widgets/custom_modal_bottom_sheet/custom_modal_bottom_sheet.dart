import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Shows a custom modal bottom sheet.
///
/// Consider using a [StatelessWidget] that returns a [ListView] with
/// `shrinkWrap: true` to pass [child] to take advantage of Flutter's Hot
/// Reload.
///
/// If [padding] is null it defaults to `EdgeInsets.symmetric(horizontal: 20).`
Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  Widget? title,
  Widget? child,
  EdgeInsets? padding,
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
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 20,
            ),
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
    required this.title,
    required this.child,
    required this.padding,
  });

  final Widget? title;
  final Widget? child;
  final EdgeInsets padding;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      // This padding allow the keyboard to be visible if there is any text
      // field in this bottom sheet.
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(
          context,
        ).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppBar(
            toolbarHeight: ApplicationTheme.appBarHeight,
            automaticallyImplyLeading: false,
            title: Row(
              children: <Widget>[
                const CustomCloseButton(),
                const SizedBox(
                  width: 20,
                ),
                if (title != null)
                  DefaultTextStyle.merge(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    child: title!,
                  ),
              ],
            ),
          ),
          Padding(
            padding: padding +
                EdgeInsets.only(
                  bottom: MediaQuery.of(
                                context,
                              ).padding.bottom !=
                              0 &&
                          MediaQuery.of(
                                context,
                              ).padding.bottom <=
                              20
                      ? MediaQuery.of(
                            context,
                          ).padding.bottom *
                          2
                      : 20,
                ),
            child: child,
          ),
        ],
      ),
    );
  }
}
