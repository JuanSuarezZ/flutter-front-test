import 'package:flutter/material.dart';
import 'package:flutter_frontend_test/domian/models/user_model.dart';
import 'package:flutter_frontend_test/ui/pages/register/blocs/register_bloc.dart';

class UserService with ChangeNotifier {
  UserService() {}
  final List<User> usuarios = [];
  //
  //
  // User(
  //     name: "juan",
  //     lastname: "suarez",
  //     dateOfBirth: "20/02/2002",
  //     adress: ["asdad"],
  //   ),
  //   User(
  //     name: "juan",
  //     lastname: "suarez",
  //     dateOfBirth: "20/02/2002",
  //     adress: ["asdad"],
  //   ),
  //   User(
  //     name: "juan",
  //     lastname: "suarez",
  //     dateOfBirth: "20/02/2002",
  //     adress: ["asdad"],
  //   ),
  // ];

  late User currentUser;

  addAdress(String s) {
    currentUser.adress.add(s);
    notifyListeners();
  }

  addUser(RegisterBloc registerBloc) {
    final name = registerBloc.usernamebloc.getUsernameController().text;
    final lastname = registerBloc.lasnamebloc.getUsernameController().text;
    final dateOfBirth = registerBloc.datebloc.getDateController().text;
    final adress = registerBloc.adressbloc.getAdressController().text;
    final List<String> listAdress = [];
    listAdress.add(adress);

    registerBloc.usernamebloc.restartUsernameController();
    registerBloc.lasnamebloc.restartUsernameController();
    registerBloc.datebloc.restartDateController();
    registerBloc.adressbloc.restartAdressController();

    final user = User(
      name: name,
      lastname: lastname,
      dateOfBirth: dateOfBirth,
      adress: listAdress,
    );
    usuarios.add(user);
    notifyListeners();
  }
}
