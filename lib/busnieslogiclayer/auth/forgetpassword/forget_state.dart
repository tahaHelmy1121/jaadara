
import 'package:flutter/material.dart';

@immutable
abstract class ForgetState {}

class forgetInitial extends ForgetState {}

class forgetSuccess extends ForgetState {}

class forgetLoading extends ForgetState {}
class forgetfalure extends ForgetState {}

