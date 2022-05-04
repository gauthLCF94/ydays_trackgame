import 'package:flutter/material.dart';
import 'package:ydays_trackgame/components/customappbar.dart';

class RegisterPage extends StatefulWidget {
  static const route = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final String title = "Register";
  final _formKey = GlobalKey<FormState>();

  String _uid = "";
  String _email = "";
  String _pwd = "";
  bool _visibility = false;

  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(title),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                validator: (_value) {
                  //TODO: valider la valeur du champ
                },
                onChanged:  (String value) {
                  setState(() {
                    _uid = value;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  suffixIcon: const Icon(Icons.account_circle_rounded),
                ),
              ),
              const SizedBox(height: 15.0,),
              TextFormField(
                validator: (_value) {
                  //TODO: valider la valeur du champ
                },
                onChanged:  (String value) {
                  setState(() {
                    _email = value;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  suffixIcon: const Icon(Icons.alternate_email_rounded),
                ),
              ),
              const SizedBox(height: 15.0,),
              TextFormField(
                validator: (_value) {
                  //TODO: valider la valeur du champ
                },
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
                  //TODO: register user
                  print("redirect to register page");
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Registering ..."))
                    );
                  }
                },
                child: const Text('Inscription'),
                style: ElevatedButton.styleFrom(
                  primary:Colors.lightBlue,
                  fixedSize: Size(screenWidth, screenHeight/20*1.5),
                ),
              ),
            ],
          )
        )
      )
    );
  }
}