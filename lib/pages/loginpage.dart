import 'package:flutter/material.dart';
import 'package:ydays_trackgame/components/customappbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _uid = "";
  String _pwd = "";
  bool _visibility = false;

  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar("Jeu de piste à Paris"),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onChanged: (String value) {
                setState(() {
                  _uid = value;
                });
              },
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: "Identifiant",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                suffixIcon: const Icon(Icons.account_circle_rounded),
              ),
            ),
            const SizedBox(height: 15.0,),
            TextField(
              obscureText: !_visibility,
              onChanged: (String value) {
                setState(() {
                  _pwd = value;
                });
              },
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _visibility = _visibility ? false : true;
                        print("visibility:" + _visibility.toString());
                      });
                    },
                    icon: _visibility ? const Icon(Icons.visibility_rounded) : const Icon(Icons.visibility_off_rounded),
                    splashRadius: 1,
                  )
              ),
            ),
            const SizedBox(height: 15.0,),
            ElevatedButton(
              onPressed: () {
                //TODO: connect user
                print('connect user');
              },
              child: const Text('Connexion'),
              style: ElevatedButton.styleFrom(
                primary:Colors.lightBlue,
                fixedSize: Size(screenWidth, screenHeight/20*1.5),
              ),
            ),
            const SizedBox(height: 15.0,),
            ElevatedButton(
              onPressed: () {
                //TODO: redirect to register page
                print("redirect to register page");
              },
              child: const Text('Inscription'),
              style: ElevatedButton.styleFrom(
                primary:Colors.lightBlue,
                fixedSize: Size(screenWidth, screenHeight/20*1.5),
              ),
            ),
          ],
        ),
      )
    );
  }
}