import 'package:flutter/material.dart';

class TextFieldSenha extends StatelessWidget {
  const TextFieldSenha({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14.0,
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold),
      controller: _passwordController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: Colors.black26,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "Senha",
        hintStyle: const TextStyle(
            fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
      obscureText: true,
    );
  }
}
