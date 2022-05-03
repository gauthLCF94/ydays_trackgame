import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ydays_trackgame/components/customappbar.dart';
import 'package:ydays_trackgame/models/riddlemodel.dart';

class RiddlePage extends StatefulWidget {
  const RiddlePage({
    Key? key,
  }) : super(key:key);

  @override
  State<StatefulWidget> createState() => RiddlePageState();
}

class RiddlePageState extends State<RiddlePage> {
  final String title = "Enigmes";

  final RiddleModel data = RiddleModel.initialize();
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _riddlePageController = TextEditingController();

  late double screenWidth = 0.0;
  late double screenHeight = 0.0;

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
      print('TextLabel has focus');
    } else {
      print ('TextLabel lost focus');
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

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
                      GetImage(data.imgContent),
                      const SizedBox(height: 20),
                      Text(
                        data.textContent,
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
            TextField(
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
                    print('Sending : ' + _riddlePageController.text);
                  },
                )
              ),
            ),
          ]
        ),
      ),
    );
  }

  Widget GetImage(String imgUrl) {
    if (imgUrl != "") {
      return Image.network(imgUrl, width: screenWidth, height: screenHeight/4);
    }
    else {
      return const SizedBox(height: 0);
    }
  }

}
