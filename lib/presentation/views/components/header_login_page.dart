import 'package:flutter/material.dart';

class HeaderLoginPage extends StatelessWidget {
  const HeaderLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        padding: const EdgeInsets.only(bottom: 20.0, top: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Autenticação com API",
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Login app using BLOC pattern and REST API",
              style: TextStyle(fontSize: 10.0, color: Colors.black38),
            )
          ],
        ));
  }
}
