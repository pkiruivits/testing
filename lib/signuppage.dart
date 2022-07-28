import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'sql_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final TextEditingController _fnameController = TextEditingController();
final TextEditingController _lnameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  Future<void> _addUser() async {
    await SQLHelper.createUser(
        _fnameController.text,
        _lnameController.text,
        _emailController.text,
        _usernameController.text,
        _passwordController.text);
    // _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'KTTC SignUp Page',
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
                controller: _fnameController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Your First Name",
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
                  controller: _lnameController,
                  //obscureText: true,
                  onChanged: (value) {
                    // password = value;
                    // print(password);
                    // passwordController.text = password;
                  },
                  decoration: InputDecoration(
                    hintText: "Lastname",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: _emailController,
                  // obscureText: true,
                  onChanged: (value) {
                    // password = value;
                    // print(password);
                    // passwordController.text = password;
                  },
                  decoration: InputDecoration(
                    hintText: "Email Adress",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: _usernameController,
                  // obscureText: true,
                  onChanged: (value) {
                    // password = value;
                    // print(password);
                    // passwordController.text = password;
                  },
                  decoration: InputDecoration(
                    hintText: "User Name",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: _passwordController,
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
                  onPressed: () async {
                    await _addUser();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Successfully added user!'),
                    ));
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return dashboard();
                    //     },
                    //   ),
                    // );
                  },
                  child: Text(
                    "Sign Up".toUpperCase(),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ));
  }
}
