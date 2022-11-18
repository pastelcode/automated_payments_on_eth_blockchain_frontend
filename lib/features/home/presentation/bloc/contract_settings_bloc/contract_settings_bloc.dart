import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contract_settings_event.dart';
part 'contract_settings_state.dart';

/// {@template contract_settings_bloc}
/// A bloc to manage the main contract settings.
///
/// Events:
/// - [AddMember]
/// - [UpdateLapseds]
/// - [UpdateDuration]
///
/// States:
/// - [ContractSettingsState]
/// {@endtemplate}
class ContractSettingsBloc
    extends Bloc<ContractSettingsEvent, ContractSettingsState> {
  /// {@macro contract_settings_bloc}
  ContractSettingsBloc()
      : super(
          const ContractSettingsState(
            members: <Member>[],
            lapseds: <Lapsed>[],
            duration: null,
          ),
        ) {
    on<AddMember>(
      _handleAddMember,
    );
  }

  void _handleAddMember(
    AddMember event,
    Emitter<ContractSettingsState> emit,
  ) {
    emit(
      state.copyWith(
        members: <Member>[
          ...state.members,
          event.member,
        ],
      ),
    );
  }

  // TODO(pastelcode): Add a handler for [UpdateLapseds]

  // TODO(pastelcode): Add a handler for [UpdateDuration]
}