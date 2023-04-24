import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/Common/password_field.dart';
import 'package:mvvm/ViewModels/Auth.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Form(
              key: _formKey,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/image/download.jpg"),
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
                        onChanged: (value) =>
                            context.read<AuthProvider>().setUsername(value),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
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
                        child: PasswordField(
                      onChange: (value) =>
                          context.read<AuthProvider>().setPassword(value),
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                            fixedSize:
                                MaterialStateProperty.all(const Size(200, 45))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Đang xử lý yêu cầu'),
                                duration: Duration(milliseconds: 500),
                              ),
                            );
                            final result =
                                await context.read<AuthProvider>().onLogin();
                            if (result == 1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text("Đăng nhập thành công")),
                              );
                              context.go("/home");
                            }
                          }
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
      ),
    );
  }
}
