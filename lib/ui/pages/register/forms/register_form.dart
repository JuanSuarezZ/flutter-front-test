import 'package:flutter/material.dart';
import 'package:flutter_frontend_test/data/services/users_service.dart';
import 'package:flutter_frontend_test/ui/pages/register/blocs/register_bloc.dart';
import 'package:flutter_frontend_test/ui/utils/blocs/adress_bloc.dart';
import 'package:flutter_frontend_test/ui/utils/blocs/date_bloc.dart';
import 'package:flutter_frontend_test/ui/utils/blocs/username_bloc.dart';
import 'package:flutter_frontend_test/ui/widgets/textfilds/adress_textfield.dart';
import 'package:flutter_frontend_test/ui/widgets/textfilds/date_textfield.dart';
import 'package:flutter_frontend_test/ui/widgets/textfilds/username_textfield.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    final Usernamebloc usernamebloc = Usernamebloc();
    final Usernamebloc lasnamebloc = Usernamebloc();
    final Adressbloc adressbloc = Adressbloc();
    final Datebloc datebloc = Datebloc();
    final RegisterBloc registerBloc =
        RegisterBloc(usernamebloc, lasnamebloc, adressbloc, datebloc);

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 60),
                            child: Text(
                              "Register",
                              style: Theme.of(context).textTheme.headline1!,
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            child: Stack(
                              children: [
                                createContainer(
                                  usernamebloc,
                                  lasnamebloc,
                                  adressbloc,
                                  datebloc,
                                ),
                                createButton(registerBloc),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(right: 16, top: 16),
                                child: Text(
                                  "Forgot ?",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 16, top: 24),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffe98f60),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Align createButton(RegisterBloc registerBloc) {
    return Align(
      alignment: Alignment.centerRight,
      child: StreamBuilder(
        stream: registerBloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == true) {
            return InkWell(
              onTap: () {
                final userService =
                    Provider.of<UserService>(context, listen: false);
                userService.addUser(registerBloc);
                Navigator.of(context).pushNamed('home');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green[200]!.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff1bccba),
                      Color(0xff22e2ab),
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            );
          } else {
            return Container(
              margin: const EdgeInsets.only(right: 15),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.green[200]!.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.grey,
                  ],
                ),
              ),
              child: const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.white,
                size: 32,
              ),
            );
          }
        },
      ),
    );
  }

  Container createContainer(Usernamebloc usernamebloc,
      Usernamebloc lastnamebloc, Adressbloc adressbloc, Datebloc datebloc) {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(
        right: 70,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 32),
            child: UserNameTextField(usernamebloc),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 32),
            child: UserNameTextField.lastname(lastnamebloc),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 32),
            child: DateTextField(datebloc),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 32),
            child: AdressTextField(adressbloc),
          ),
        ],
      ),
    );
  }
}
