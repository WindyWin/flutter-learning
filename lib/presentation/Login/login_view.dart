import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/Common/password_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Form(
            key: _formKey,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    "https://itviec.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOXMvS2c9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--58c93159cd5e45169503a9917c87b6acfd05ce01/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RkhKbGMybDZaVjkwYjE5c2FXMXBkRnNIYVFJc0FXa0NMQUU9IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--1b8988b96ed4a58d3628eb3340c8b231786ccfc0/Logo%20KBTG.jpg"),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Tên đăng nhập",
                      ),
                    ),
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    // height: 50,
                    child: TextFormField(
                      obscureText: !_passwordVisible,
                      enableSuggestions: false,
                      autocorrect: false,
                      onChanged: (v) {},
                      decoration: InputDecoration(
                        labelText: "Mật khẩu",
                        // hintText: 'Enter your password',

                        //create border radius
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          fixedSize:
                              MaterialStateProperty.all(const Size(200, 45))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                        debugPrint("login");
                      },
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
