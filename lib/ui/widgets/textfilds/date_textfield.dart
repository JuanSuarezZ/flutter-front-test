import 'package:flutter/material.dart';
import 'package:flutter_frontend_test/ui/utils/blocs/date_bloc.dart';
import 'package:flutter_frontend_test/ui/utils/blocs/username_bloc.dart';

class DateTextField extends StatelessWidget {
  final Datebloc bloc;

  const DateTextField(this.bloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //general variables
    final decoration = BoxDecoration(
      // color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      // boxShadow: <BoxShadow>[
      //   BoxShadow(
      //       color: Colors.black.withOpacity(0.08),
      //       offset: const Offset(0, 8),
      //       blurRadius: 4.0)
      // ],
    );
    var padding = const EdgeInsets.only(top: 5, left: 5, bottom: 0, right: 0);
    var margin = const EdgeInsets.only(bottom: 0, left: 8, right: 8);
    var contentPadding =
        const EdgeInsets.only(left: 11, right: 3, top: 14, bottom: 0);
    final errorStyle =
        TextStyle(fontSize: 12, color: Theme.of(context).errorColor);
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20),
    );
    final icon = IconButton(
        onPressed: () {},
        icon:
            Icon(Icons.person_sharp, color: Theme.of(context).iconTheme.color));
    final size = MediaQuery.of(context).size;

    var buttons = IconButton(
      onPressed: () {
        //limpia stream controller
        bloc.restartDateController();
        //limpia txt controller
        bloc.getDateController().clear();
      },
      icon: Icon(
        Icons.clear,
        color: Theme.of(context).iconTheme.color,
      ),
    );

    return StreamBuilder(
      stream: bloc.dateStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: padding,
          margin: margin,
          decoration: decoration,
          child: TextField(
              autofocus: false,
              style: Theme.of(context).textTheme.bodyText1,
              controller: bloc.getDateController(),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.bodyText1,
                fillColor: Theme.of(context).backgroundColor,
                hintStyle: Theme.of(context).textTheme.bodyText1,
                contentPadding: contentPadding,
                errorStyle: errorStyle,
                border: border,
                suffixIcon: (bloc.getDateController().text == null ||
                        bloc.getDateController().text == "")
                    ? null
                    : buttons,
                icon: icon,
                hintText: "fecha de nacimiento",
                errorText: (snapshot.error is ArgumentError ||
                        snapshot.error == null ||
                        bloc.date == "" ||
                        snapshot.error is NoSuchMethodError)
                    ? null
                    : snapshot.error.toString(),
              ),
              onChanged: bloc.changeDate),
        );
      },
    );
  }
}
