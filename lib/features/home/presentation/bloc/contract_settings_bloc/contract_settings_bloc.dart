import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/data/models/models.dart';
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
/// - [RemoveMember]
/// - [UpdateDuration]
/// - [UpdateLapse]
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
            lapse: ContractLapse(
              every: null,
              unit: null,
            ),
            duration: ContractDuration(
              end: null,
              unit: null,
            ),
          ),
        ) {
    on<AddMember>(
      _handleAddMember,
    );
    on<RemoveMember>(
      _handleRemoveMember,
    );

    on<UpdateDuration>(
      _handleUpdateDuration,
    );
    on<UpdateLapse>(
      _handleUpdateLapse,
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
            return member.address == event.address;
          },
        ) !=
        -1;
    if (doesUserAlreadyExist) {
      CustomSnackBar.showErrorSnackBar(
        message: 'Member already added',
      );
      return;
    }
    final parsedPercent = num.parse(
      event.percent,
    );
    emit(
      state.copyWith(
        members: <ContractMember>[
          ...state.members,
          ContractMember(
            address: event.address,
            percent: parsedPercent,
          ),
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

  void _handleUpdateDuration(
    UpdateDuration event,
    Emitter<ContractSettingsState> emit,
  ) {
    emit(
      state.copyWith(
        duration: state.duration.copyWith(
          end: event.end != null
              ? int.parse(
                  event.end!,
                )
              : null,
          unit: event.unit,
        ),
      ),
    );
  }

  void _handleUpdateLapse(
    UpdateLapse event,
    Emitter<ContractSettingsState> emit,
  ) {
    emit(
      state.copyWith(
        lapse: state.lapse.copyWith(
          every: event.every != null
              ? int.parse(
                  event.every!,
                )
              : null,
          unit: event.unit,
        ),
      ),
    );
  }
}
