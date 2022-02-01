import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_frontend_test/core/helpers/validator_inputs.dart';
import 'package:rxdart/rxdart.dart';

class Usernamebloc with Validators {
  //controllers
  final _usernameTextController = TextEditingController();

  //streams
  final _usernameController = BehaviorSubject<String>();

  Stream<String> get usernameStream =>
      _usernameController.stream.transform(validarUserName);

  // Insertar valores al Stream
  Function(String) get changeUsername => _usernameController.sink.add;

  restartUsernameController() {
    _usernameController.sink.add("");
    _usernameTextController.clear();
  }

  // Obtener el último valor ingresado a los streams
  String? get username => _usernameController.valueOrNull;

  //geters
  getUsernameController() => _usernameTextController;

  dispose() {
    _usernameController.close();
  }
}
