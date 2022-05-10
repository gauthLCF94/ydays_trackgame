import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ydays_trackgame/services/httpservice.dart';

class MyCustomError extends StatelessWidget {
  final String errorMsg;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  const MyCustomError({Key? key,
    required this.errorMsg,
    required this.refreshIndicatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 100
            ),
            const SizedBox(height: 15),
            Text(errorMsg, style: const TextStyle(fontSize:18)),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                refreshIndicatorKey.currentState!.show();
                log("Reload button pressed ...");
              },
              child:const Icon(Icons.refresh_rounded),
              style: ElevatedButton.styleFrom(
                primary: Colors.red
              ),
            )
          ]
        )
      )
    );
  }
}