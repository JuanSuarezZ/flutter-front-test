import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_frontend_test/core/helpers/validator_inputs.dart';
import 'package:rxdart/rxdart.dart';

class Adressbloc with Validators {
  //controllers
  final _adressTextController = TextEditingController();

  //streams
  final _adressController = BehaviorSubject<String>();

  Stream<String> get adressStream =>
      _adressController.stream.transform(validarAdress);

  // Insertar valores al Stream
  Function(String) get changeAdress => _adressController.sink.add;

  restartAdressController() {
    _adressController.sink.add("");
    _adressTextController.clear();
  }

  // Obtener el último valor ingresado a los streams
  String? get date => _adressController.valueOrNull;

  //geters
  getAdressController() => _adressTextController;

  dispose() {
    _adressController.close();
  }
}
