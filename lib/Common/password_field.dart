import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final Function(String?) onChange;
  const PasswordField({required this.onChange, Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: !_passwordVisible,
        enableSuggestions: false,
        autocorrect: false,
        onChanged: widget.onChange,
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
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
    );
  }
}
