

import 'package:flutter/material.dart';

@immutable
abstract class ResendCodeState {}

class ResendCodeInitial extends ResendCodeState {}

class ResendCodeSuccess extends ResendCodeState {}

class ResendCodeLoading extends ResendCodeState {}

class ResendCodeFailure extends ResendCodeState {}
