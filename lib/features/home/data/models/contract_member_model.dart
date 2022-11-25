import 'dart:convert';

import 'package:automated_payments_on_eth_blockchain_frontend/core/data/models/models.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

/// {@macro contractSettings.domain.entities.contractMember}
class ContractMemberModel extends Equatable with ModelOf<ContractMember> {
  /// {@macro contractSettings.domain.entities.contractMember}
  const ContractMemberModel({
    required this.percent,
    required this.address,
  });

  /// {@macro contractSettings.domain.entities.contractMember}
  factory ContractMemberModel.fromMap(
    Map<String, dynamic> json,
  ) {
    return ContractMemberModel(
      address: json['address'] as String,
      percent: json['percent'] as num,
    );
  }

  /// {@macro contractSettings.domain.entities.contractMember}
  factory ContractMemberModel.fromJson(
    String string,
  ) {
    return ContractMemberModel.fromMap(
      json.decode(
        string,
      ) as Map<String, dynamic>,
    );
  }

  /// {@macro contractSettings.domain.entities.contractMember.address}
  final String address;

  /// {@macro contractSettings.domain.entities.contractMember.percent}
  final num percent;

  @override
  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'percent': percent,
    };
  }

  @override
  String toJson() {
    return json.encode(
      toMap(),
    );
  }

  @override
  ContractMemberModel copyWith({
    String? address,
    int? percent,
  }) =>
      ContractMemberModel(
        address: address ?? this.address,
        percent: percent ?? this.percent,
      );

  @override
  ContractMember toEntity() {
    return ContractMember(
      address: address,
      percent: percent,
    );
  }

  @override
  List<Object?> get props => [
        address,
        percent,
      ];
}
