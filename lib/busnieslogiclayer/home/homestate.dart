
import 'package:flutter/material.dart';

@immutable
abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateSuccess extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateFailure extends HomeState {}
