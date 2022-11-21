import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// {@template home_page}
/// A initial page to show as the home.
/// {@endtemplate}
class HomePage extends StatefulWidget {
  /// {@macro home_page}
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKeyToValidate = GlobalKey<FormState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          'Contract settings',
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(
                        context,
                      ).size.width *
                      .9 >
                  500
              ? 500
              : MediaQuery.of(
                    context,
                  ).size.width *
                  .9,
          child: ListView(
            children: <Widget>[
              const MembersTile(),
              const LapsesTile(),
              const _Gap(),
              Form(
                key: _formKeyToValidate,
                child: const DurationFormContent(),
              ),
              const _Gap(),
              const _Gap(),
              SignAndExecuteButton(
                formKeyToValidate: _formKeyToValidate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Gap extends StatelessWidget {
  const _Gap();

  @override
  Widget build(
    BuildContext context,
  ) {
    return const SizedBox(
      height: 20,
    );
  }
}
