import 'package:flutter/material.dart';
import 'package:flutter_frontend_test/data/services/users_service.dart';
import 'package:flutter_frontend_test/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    final list = userService.usuarios;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text("nombre: ${list[i].name}"),
              subtitle: Text("apellido: ${list[i].lastname}"),
              dense: true,
              onTap: () {
                userService.currentUser = list[i];
                Navigator.of(context).pushNamed('edit_profile');
              },
            );
          },
        ),
      ),
    );
  }
}
