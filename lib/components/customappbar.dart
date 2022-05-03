import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
  final String _title;

  CustomAppBar(
      this._title,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right:20.0),
          child: GestureDetector(
            onTap: () {
              //TODO: redirect to account page (if any)
              print('redirection to account page');
            },
            child: const Icon(Icons.account_circle_rounded, size: 30,),
          )
        )
      ],
      automaticallyImplyLeading: true,
    );
  }

}
