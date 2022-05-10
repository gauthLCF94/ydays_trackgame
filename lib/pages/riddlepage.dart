import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ydays_trackgame/components/customappbar.dart';
import 'package:ydays_trackgame/components/mycustomerror.dart';
import 'package:ydays_trackgame/models/imagemodel.dart';
import 'package:ydays_trackgame/models/riddlemodel.dart';
import 'package:ydays_trackgame/services/httpservice.dart';

class RiddlePage extends StatefulWidget {
  static const route = '/riddle';

  RiddlePage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RiddlePageState();
}

class RiddlePageState extends State<RiddlePage> {
  final String title = "Enigmes";

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _riddlePageController = TextEditingController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  late double screenWidth;
  late double screenHeight;

  late Future<RiddleModel> riddle;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    final args = ModalRoute.of(context)!.settings.arguments as int;
    log("args: " + args.toString());
    setState(() {
      riddle = HttpService.getRiddleById(args);
    });
    return FutureBuilder(
      future: riddle,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          log("in hasdata");
          final RiddleModel riddle = snapshot.data;
          return Scaffold(
            appBar: CustomAppBar(title),
            body: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(25.0),
                        child: SingleChildScrollView(
                          child: Column(
                              children: <Widget>[
                                GetImage(riddle.id),
                                const SizedBox(height: 20),
                                Text(
                                    riddle.textContent,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    )
                                ),
                              ]
                          ),
                        ),
                      ),
                    ),
                    BottomScreenWidget(context, riddle),
                  ]
              ),
            ),
          );
        }
        else if (snapshot.hasError) {
          log("in error");
          return MyCustomError(
            errorMsg: '${snapshot.error}',
            refreshIndicatorKey: _refreshIndicatorKey,
          );
        }
        else {
          log("in else");
          return const Center(child: CircularProgressIndicator());
        }
        // throw Exception('${snapshot.error} / ${snapshot.connectionState}');
      }
    );
  }

  Image GetImage(int _riddleId) {
    ImageModel img = HttpService.getImageByRiddleID(_riddleId) as ImageModel;
    return Image.network(img.url);
  }

  Widget BottomScreenWidget(BuildContext _context, RiddleModel _riddle) {
    if (_riddle.response != "null") {
      return TextField(
        controller: _riddlePageController,
        focusNode: _focusNode,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical:5.0, horizontal: 20.0),
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: "Answer",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.send_rounded),
              padding: const EdgeInsets.only(right: 5.0),
              onPressed: () {
                log('Sending : ' + _riddlePageController.text);
                log('Check response');
                if (CheckUserAnswer(_riddle.response, _riddlePageController.text)) {
                  log('Good answer !');
                  Navigator.pushNamed(
                    _context,
                    RiddlePage.route,
                    arguments: _riddle.nextId,
                  );
                }
                else {
                  //TODO: create error animation
                }
              },
            )
        ),
      );
    }
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(
            _context,
            RiddlePage.route,
            arguments: _riddle.nextId,
        );
      },
      child: const Text("Suivant"),
      style: ElevatedButton.styleFrom(
        primary:Colors.lightBlue,
        fixedSize: Size(screenWidth, screenHeight/20*1.5),
      )
    );
  }

  bool CheckUserAnswer(String _response, String _userInput) {
    //TODO: compléxifier la vérification (suppression des espaces, des accents par exemple)
    if (_response == _userInput.toLowerCase()) {
      return true;
    }
    return false;
  }
}
