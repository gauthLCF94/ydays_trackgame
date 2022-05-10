import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ydays_trackgame/components/customappbar.dart';
import 'package:ydays_trackgame/models/imagemodel.dart';
import 'package:ydays_trackgame/models/riddlemodel.dart';
import 'package:ydays_trackgame/services/httpservice.dart';
import 'dart:convert' show utf8;

var encoded = utf8.encode('Lorem ipsum dolor sit amet, consetetur...');
var decoded = utf8.decode(encoded);

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

  final HttpService httpService = HttpService();

  late double screenWidth;
  late double screenHeight;

  late int _riddleId;
  late RiddleModel _riddle;
  late ImageModel _image;
  late String _content;

  int get riddleId => _riddleId;
  RiddleModel get riddle => _riddle;
  ImageModel get image => _image;
  String get content => _content;

  @override
  void initState() {
    super.initState();
    getEnigma();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    final args = ModalRoute.of(context)!.settings.arguments as int;
    log("args: " + args.toString());
    setState(() {
      _riddleId = args;
    });
    getEnigma();
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
                        Image.network(image.url),
                        const SizedBox(height: 20),
                        Text(
                            content,
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
      )
    );
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
                    arguments: _riddle.id_next,
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
            arguments: _riddle.id_next,
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
    //TODO: compléxifier la vérification (suppression des accents par exemple)
    _response = _response.toLowerCase()
        .replaceAll(' ', '');
    _userInput = _userInput.toLowerCase()
        .replaceAll(' ', '') // espaces
        .replaceAll(RegExp('<(\S*?)[^>]*>.*?|<.*? />'), '') // HTML Tags
        .replaceAll(RegExp('((?:(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))\.){3}(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d))))'), ''); // IP adresses

    if (_response == _userInput) {
      return true;
    }
    return false;
  }

  Future<void> getEnigma() async {
    if (!_riddleId.isNaN) {
      RiddleModel r = await httpService.getRiddleById(_riddleId);
      ImageModel i = await httpService.getImageByRiddleID(_riddleId);
      var encoded = utf8.encode(r.content);
      var decoded = utf8.decode(encoded);

      setState(() {
        _riddle = r;
        _image = i;
        _content = decoded;
      });
    }
  }
}
