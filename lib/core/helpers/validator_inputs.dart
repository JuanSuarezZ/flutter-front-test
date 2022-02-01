import 'dart:async';

class Validators {
  final validarFecha = StreamTransformer<String, String>.fromHandlers(
    handleData: (fecha, sink) {
      Pattern pattern = r'^([0-2][0-9]|3[0-1])(\/|-)(0[1-9]|1[0-2])\2(\d{4})$';
      RegExp regExp = RegExp(pattern.toString());

      if (regExp.hasMatch(fecha)) {
        sink.add(fecha);
      } else {
        sink.addError('Ingresa una fecha valida');
      }
    },
  );

  final validarUserName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length >= 6 && name.length <= 20) {
      sink.add(name);
    } else {
      sink.addError('Ingresa un Nombre mas largo');
    }
  });

  final validarLastName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length >= 3 && name.length <= 20) {
      sink.add(name);
    } else {
      sink.addError('Ingresa un apellido');
    }
  });

  final validarAdress = StreamTransformer<String, String>.fromHandlers(
      handleData: (adress, sink) {
    if (adress.length >= 3 && adress.length <= 20) {
      sink.add(adress);
    } else {
      sink.addError('direccion no valida');
    }
  });
}
