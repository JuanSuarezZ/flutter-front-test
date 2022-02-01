import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_frontend_test/core/helpers/validator_inputs.dart';
import 'package:rxdart/rxdart.dart';

class Datebloc with Validators {
  //controllers
  final _dateTextController = TextEditingController();

  //streams
  final _dateController = BehaviorSubject<String>();

  Stream<String> get dateStream =>
      _dateController.stream.transform(validarFecha);

  // Insertar valores al Stream
  Function(String) get changeDate => _dateController.sink.add;

  restartDateController() {
    _dateController.sink.add("");
    _dateTextController.clear();
  }

  // Obtener el último valor ingresado a los streams
  String? get date => _dateController.valueOrNull;

  //geters
  getDateController() => _dateTextController;

  dispose() {
    _dateController.close();
  }
}
