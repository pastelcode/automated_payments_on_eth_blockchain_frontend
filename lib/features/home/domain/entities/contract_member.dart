import 'package:equatable/equatable.dart';

/// {@template contractSettings.entities.contractMember}
/// A member for the main contract.
/// {@endtemplate}
class ContractMember extends Equatable {
  /// {@macro entities.contractMember}
  const ContractMember({
    required this.percent,
    required this.address,
  });

  /// {@template contractSettings.domain.entities.contractMember.address}
  /// The address of this member in a blockchain.
  /// {@endtemplate}
  final String address;

  /// {@template contractSettings.domain.entities.contractMember.percent}
  /// The percent this member is going to pay on the contract.
  /// {@endtemplate}
  final num percent;

  @override
  List<Object?> get props => [
        address,
        percent,
      ];
}
