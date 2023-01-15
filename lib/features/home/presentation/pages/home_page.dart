import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void _updateDuration({
    String? duration,
    DurationUnit? unit,
  }) {
    context.read<ContractSettingsBloc>().add(
          UpdateDuration(
            end: duration,
            unit: unit,
          ),
        );
  }

  void _updateLapse({
    String? duration,
    DurationUnit? unit,
  }) {
    context.read<ContractSettingsBloc>().add(
          UpdateLapse(
            every: duration,
            unit: unit,
          ),
        );
  }

  void _updateContractAddress(
    String address,
  ) {
    context.read<ContractSettingsBloc>().add(
          UpdateContractAddressEvent(
            address: address,
          ),
        );
  }

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
              const _Gap(),
              Form(
                key: GlobalKey<FormState>(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Contract address',
                    ),
                    const _Gap(),
                    BlockchainAddressInput(
                      onChanged: _updateContractAddress,
                    ),
                    const _Gap(),
                    const _Gap(),
                    const Text(
                      'Lapse',
                    ),
                    const _Gap(),
                    BlocBuilder<ContractSettingsBloc, ContractSettingsState>(
                      builder: (
                        BuildContext context,
                        ContractSettingsState contractSettingsState,
                      ) {
                        return DurationFormContent(
                          labelForDurationTextField: 'Every',
                          errorMessageForDurationTextField:
                              'Set a valid lapse for the contract',
                          initialDurationValue:
                              contractSettingsState.lapse.every,
                          initialDurationUnitValue:
                              contractSettingsState.lapse.unit,
                          onFieldsChange: _updateLapse,
                        );
                      },
                    ),
                    const _Gap(),
                    const _Gap(),
                    const Text(
                      'Duration',
                    ),
                    const _Gap(),
                    BlocBuilder<ContractSettingsBloc, ContractSettingsState>(
                      builder: (
                        BuildContext context,
                        ContractSettingsState contractSettingsState,
                      ) {
                        return DurationFormContent(
                          labelForDurationTextField: 'Ends in',
                          errorMessageForDurationTextField:
                              'Set a valid end for the contract',
                          initialDurationValue:
                              contractSettingsState.duration.end,
                          initialDurationUnitValue:
                              contractSettingsState.duration.unit,
                          onFieldsChange: _updateDuration,
                        );
                      },
                    ),
                    const _Gap(),
                    const _Gap(),
                    const SizedBox(
                      width: double.infinity,
                      child: SignAndExecuteButton(),
                    ),
                  ],
                ),
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
