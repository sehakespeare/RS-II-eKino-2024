import 'package:e_kino_desktop/providers/auditorium_provider.dart';
import 'package:e_kino_desktop/providers/genre_provider.dart';
import 'package:e_kino_desktop/screens/auditoriums/auditoriums_screen.dart';
import 'package:e_kino_desktop/screens/genre/genre_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../providers/users_provider.dart';

class AddGenreScreen extends StatefulWidget {
  const AddGenreScreen({super.key});
  @override
  State<AddGenreScreen> createState() => _AddGenreScreenState();
}

class _AddGenreScreenState extends State<AddGenreScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final Map<String, dynamic> _initialValue = {};
  late GenreProvider _genreProvider;

  @override
  void initState() {
    super.initState();
    _genreProvider = context.read<GenreProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Genre",
        style: TextStyle(fontSize: 18),
      )),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 300,
          child: Column(
            children: [
              _buildForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          var isValid =
                              _formKey.currentState?.saveAndValidate() ?? false;
                          if (isValid) {
                            var request =
                                Map.from(_formKey.currentState!.value);

                            try {
                              await _genreProvider.insert(request);

                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const GenreScreen(),
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Uspješno ste dodali žanr",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } on Exception catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    e.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        child: const Text("Sačuvaj")),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        initialValue: _initialValue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FormBuilderTextField(
              decoration: const InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.black)),
              name: "name",
              style: const TextStyle(color: Colors.black),
              validator: FormBuilderValidators.required(
                  errorText: "Polje ne smije biti prazno."),
            ),
          ],
        ),
      ),
    );
  }
}
