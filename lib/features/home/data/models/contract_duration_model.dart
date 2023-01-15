// To parse this JSON data, do
//
//     final contractDurationModel = contractDurationModelFromMap(jsonString);

import 'dart:convert';

import 'package:automated_payments_on_eth_blockchain_frontend/core/data/models/models.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

/// {@macro contractSettings.domain.entities.contractDuration}
class ContractDurationModel extends Equatable with ModelOf<ContractDuration> {
  /// {@macro contractSettings.domain.entities.contractDuration}
  const ContractDurationModel({
    required this.end,
    required this.unit,
  });

  /// {@macro contractSettings.domain.entities.contractDuration}
  factory ContractDurationModel.fromMap(Map<String, dynamic> json) {
    return ContractDurationModel(
      end: json['end'] as int,
      unit: DurationUnit.values.firstWhere(
        (
          DurationUnit durationUnit,
        ) {
          return durationUnit.name == json['unit'];
        },
      ),
    );
  }

  /// {@macro contractSettings.domain.entities.contractDuration}
  factory ContractDurationModel.fromJson(
    String string,
  ) {
    return ContractDurationModel.fromMap(
      json.decode(
        string,
      ) as Map<String, dynamic>,
    );
  }

  /// {@macro contractSettings.domain.entities.contractDuration.end}
  final int end;

  /// {@macro contractSettings.domain.entities.contractDuration.unit}
  final DurationUnit unit;

  @override
  ContractDurationModel copyWith({
    int? end,
    DurationUnit? unit,
  }) {
    return ContractDurationModel(
      end: end ?? this.end,
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
      'end': end,
      'unit': unit.name,
    };
  }

  @override
  List<Object?> get props => [
        end,
        unit,
      ];

  @override
  ContractDuration toEntity() {
    return ContractDuration(
      end: end,
      unit: unit,
    );
  }
}
