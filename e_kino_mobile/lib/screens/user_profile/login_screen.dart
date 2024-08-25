import 'package:e_kino_mobile/providers/movies_provider.dart';
import 'package:e_kino_mobile/screens/master_screen.dart';
import 'package:e_kino_mobile/screens/user_profile/registration_form_screen.dart';
import 'package:e_kino_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late MoviesProvider _moviesProvider;
    _moviesProvider = context.read<MoviesProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 185, 163, 163))),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Pasword",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 185, 163, 163))),
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(143, 148, 251, 1),
                  Color.fromRGBO(8, 17, 184, 0.6)
                ]),
              ),
              child: InkWell(
                onTap: () async {
                  try {
                    Authorization.username = _usernameController.text;
                    Authorization.password = _passwordController.text;

                    await _moviesProvider.get();

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MasterScreenWidget()));
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                title: const Text("Error "),
                                content: Text(e.toString()),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Close")),
                                ]));
                  }
                },
                child: const Center(child: Text("Prijava")),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegistrationScreenScreen()));
              },
              child: const Text(
                'Registrujte se.',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
