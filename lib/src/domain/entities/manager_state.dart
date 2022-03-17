import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager_state.freezed.dart';

@freezed
class ManagerState with _$ManagerState {
  factory ManagerState({
    required Color stateColor,
    required String state,
  }) = _ManagerState;
}