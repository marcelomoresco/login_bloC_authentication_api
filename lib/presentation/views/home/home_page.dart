import 'package:authentication_login/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: const Padding(
            padding: EdgeInsets.all(10.0),
          ),
          title: const Text("Autenticação com API"),
          actions: [
            IconButton(
                icon: const Icon(Icons.login),
                onPressed: () {
                  context.read<AuthBloc>().add(LoggoutEvent());
                })
          ],
        ),
        body: const Center(
          child: Text("Home Page"),
        ));
  }
}
