import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_frontend_test/data/services/users_service.dart';
import 'package:flutter_frontend_test/ui/theme/theme_bloc.dart';
import 'package:provider/provider.dart';

import 'core/routes/routes.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BlocTheme>(create: (_) => BlocTheme()),
        ChangeNotifierProvider<UserService>(create: (_) => UserService()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //consuming the provider
    final themeNotifier = Provider.of<BlocTheme>(context);
    return MaterialApp(
   
      initialRoute: "register",
      routes: getAplicationRoutes,
      theme: themeNotifier.getTheme(),
    );
  }
}
