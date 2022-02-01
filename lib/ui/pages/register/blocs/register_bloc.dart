import 'dart:async';

import 'package:flutter_frontend_test/core/helpers/validator_inputs.dart';
import 'package:flutter_frontend_test/ui/utils/blocs/adress_bloc.dart';
import 'package:flutter_frontend_test/ui/utils/blocs/date_bloc.dart';
import 'package:flutter_frontend_test/ui/utils/blocs/username_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators {
  final Usernamebloc usernamebloc;
  final Usernamebloc lasnamebloc;
  final Adressbloc adressbloc;
  final Datebloc datebloc;

  RegisterBloc(
      this.usernamebloc, this.lasnamebloc, this.adressbloc, this.datebloc);

  Stream<bool> get formValidStream => Rx.combineLatest4(
        usernamebloc.usernameStream,
        lasnamebloc.usernameStream,
        adressbloc.adressStream,
        datebloc.dateStream,
        (a, b, c, d) => true,
      );
}
