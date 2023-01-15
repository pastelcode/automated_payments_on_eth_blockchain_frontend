// To parse this JSON data, do
//
//     final contractLapseModel = contractLapseModelFromMap(jsonString);

import 'dart:convert';

import 'package:automated_payments_on_eth_blockchain_frontend/core/data/models/models.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

/// {@macro contractSettings.domain.entities.contractLapse}
class ContractLapseModel extends Equatable with ModelOf<ContractLapse> {
  /// {@macro contractSettings.domain.entities.contractLapse}
  const ContractLapseModel({
    required this.every,
    required this.unit,
  });

  /// {@macro contractSettings.domain.entities.contractLapse}
  factory ContractLapseModel.fromMap(
    Map<String, dynamic> json,
  ) {
    return ContractLapseModel(
      every: json['every'] as int,
      unit: DurationUnit.values.firstWhere(
        (
          DurationUnit durationUnit,
        ) {
          return durationUnit.name == json['unit'];
        },
      ),
    );
  }

  /// {@macro contractSettings.domain.entities.contractLapse}
  factory ContractLapseModel.fromJson(
    String string,
  ) {
    return ContractLapseModel.fromMap(
      json.decode(
        string,
      ) as Map<String, dynamic>,
    );
  }

  /// {@macro contractSettings.domain.entities.contractLapse.every}
  final int every;

  /// {@macro contractSettings.domain.entities.contractLapse.unit}
  final DurationUnit unit;

  @override
  ContractLapseModel copyWith({
    int? every,
    DurationUnit? unit,
  }) {
    return ContractLapseModel(
      every: every ?? this.every,
      unit: unit ?? this.unit,
    );
  }

  @override
  String toJson() {
    return json.encode(
      toMap(),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'every': every,
      'unit': unit.name,
    };
  }

  @override
  List<Object?> get props => [
        every,
        unit,
      ];

  @override
  ContractLapse toEntity() {
    return ContractLapse(
      every: every,
      unit: unit,
    );
  }
}
