import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_order/makeorder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'KTTC Login Page',
            style: TextStyle(
              color: Colors.black87,
              fontFamily: "Brand Bold",
            ),
          ),
        ),
        body: Form(
          child: Column(
            children: [
              const Divider(),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Your User Name",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  onChanged: (value) {
                    // password = value;
                    // print(password);
                    // passwordController.text = password;
                  },
                  decoration: InputDecoration(
                    hintText: "Your password",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Hero(
                tag: "login_btn",
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyFoodApp();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Login".toUpperCase(),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ));
  }
}
