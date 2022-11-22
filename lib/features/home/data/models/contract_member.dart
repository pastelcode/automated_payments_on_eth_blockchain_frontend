import 'package:equatable/equatable.dart';

/// {@template contract_member}
/// A member for the contract.
/// {@endtemplate}
class ContractMember extends Equatable {
  /// {@macro contract_member}
  const ContractMember({
    required this.address,
    required this.percent,
  });

  /// This member's wallet address.
  final String address;

  /// The percent this member is going to pay over the contract.
  final num percent;

  @override
  List<Object?> get props => [
        address,
        percent,
      ];
}
