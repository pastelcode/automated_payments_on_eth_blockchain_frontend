import 'package:automated_payments_on_eth_blockchain_frontend/core/errors/errors.dart';
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
            members: <ContractMember>[],
            lapseds: <ContractLapse>[],
            duration: null,
          ),
        ) {
    on<AddMember>(
      _handleAddMember,
    );
    on<RemoveMember>(
      _handleRemoveMember,
    );
    on<ResetFailure>(
      _handleResetFailure,
    );
    on<UpdateDuration>(
      _handleUpdateDuration,
    );
  }

  void _handleAddMember(
    AddMember event,
    Emitter<ContractSettingsState> emit,
  ) {
    final doesUserAlreadyExist = state.members.indexWhere(
          (
            ContractMember member,
          ) {
            return member.address == event.member.address;
          },
        ) !=
        -1;
    if (doesUserAlreadyExist) {
      emit(
        state.copyWith(
          failure: AnotherFailure(
            message: 'Member already added',
          ),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        members: <ContractMember>[
          ...state.members,
          event.member,
        ],
      ),
    );
  }

  void _handleRemoveMember(
    RemoveMember event,
    Emitter<ContractSettingsState> emit,
  ) {
    final filteredList = state.members.where(
      (
        ContractMember member,
      ) {
        return member.address != event.member.address;
      },
    ).toList();
    emit(
      state.copyWith(
        members: filteredList,
      ),
    );
  }

  void _handleResetFailure(
    ResetFailure event,
    Emitter<ContractSettingsState> emit,
  ) {
    // Sets the `failure` property to `null`.
    emit(
      state.copyWith(),
    );
  }

  void _handleUpdateDuration(
    UpdateDuration event,
    Emitter<ContractSettingsState> emit,
  ) {
    emit(
      state.copyWith(
        duration: event.duration,
      ),
    );
  }

  // TODO(pastelcode): Add a handler for [UpdateLapses]
}
