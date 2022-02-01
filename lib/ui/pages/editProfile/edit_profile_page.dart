import 'package:flutter/material.dart';
import 'package:flutter_frontend_test/data/services/users_service.dart';
import 'package:flutter_frontend_test/ui/utils/blocs/adress_bloc.dart';
import 'package:flutter_frontend_test/ui/widgets/textfilds/adress_textfield.dart';
import 'package:flutter_frontend_test/ui/widgets/textfilds/date_textfield.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    final currentUser = userService.currentUser;

    final Adressbloc adressbloc = Adressbloc();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${currentUser.name} ${currentUser.lastname}",
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: currentUser.adress.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text("direccion ${i + 1}: ${currentUser.adress[i]}"),
                );
              },
            ),
          ),
          Text("agrega una direccion"),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 32),
            child: AdressTextField(adressbloc),
          ),
          StreamBuilder(
            stream: adressbloc.adressStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container();
              } else {
                return IconButton(
                  onPressed: () {
                    userService
                        .addAdress(adressbloc.getAdressController().text);
                  },
                  icon: Icon(Icons.add),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
