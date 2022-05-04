import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ydays_trackgame/components/customappbar.dart';
import 'package:ydays_trackgame/models/riddlemodel.dart';
import 'package:ydays_trackgame/services/httpservice.dart';

class RiddlePage extends StatefulWidget {
  static const route = '/riddle';

  const RiddlePage({
    Key? key,
  }) : super(key:key);

  @override
  State<StatefulWidget> createState() => RiddlePageState();
}

class RiddlePageState extends State<RiddlePage> {
  final String title = "Enigmes";
  static bool pop = false;

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _riddlePageController = TextEditingController();

  late double screenWidth;
  late double screenHeight;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_focusNodeListener);
  }

  @override
  void dispose() {
    _riddlePageController.dispose();
    _focusNode.removeListener(_focusNodeListener);
    super.dispose();
  }

  Future<void> _focusNodeListener() async {
    if (_focusNode.hasFocus) {
      log('TextLabel has focus');
    } else {
      log('TextLabel lost focus');
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    final riddle = ModalRoute.of(context)!.settings.arguments as RiddleModel;

    return WillPopScope(
      onWillPop: () async {
        return pop;
      },
      child: Scaffold(
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
                        GetImage(riddle.imgContent),
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
              BottomScreenWidget(riddle),
            ]
          ),
        ),
      )
    );
  }

  Widget GetImage(String imgUrl) {
    if (imgUrl != "") {
      return Image.network(imgUrl, width: screenWidth, height: screenHeight/4);
    }
    else {
      return Image.asset("assets/img/logo_placeholder.png", width: 200, height: 200);
    }
  }

  Widget BottomScreenWidget(RiddleModel _riddle) {
    if (_riddle.response != "") {
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
                if (CheckUserAnswer(_riddle, _riddlePageController.text)) {
                  log('Good answer !');
                  //TODO: call API of next riddle
                  //TODO: redirect to new RiddlePage with the new data
                  NextRiddle(_riddle);
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
        //TODO: Go to next riddle
        //TODO: Possibilité de revenir
        pop = true;
        NextRiddle(_riddle);
      },
      child: const Text("Suivant"),
      style: ElevatedButton.styleFrom(
        primary:Colors.lightBlue,
        fixedSize: Size(screenWidth, screenHeight/20*1.5),
      )
    );
  }

  bool CheckUserAnswer(RiddleModel _riddle, String _userInput) {
    //TODO: compléxifier la vérification (suppression des espaces, des accents par exemple)
    if (_riddle.response == _userInput.toLowerCase()) {
      return true;
    }
    return false;
  }

  void NextRiddle(RiddleModel _currentRiddle) {
    //TODO: call API to load data of next riddle
    //TODO: redirect to new RiddlePage with the new data
    Future<RiddleModel> nextRiddle = HttpService.getRiddle(_currentRiddle.questId, _currentRiddle.id +1);
    Navigator.pushNamed(
        context,
        RiddlePage.route,
        arguments: nextRiddle
    );
  }

}
