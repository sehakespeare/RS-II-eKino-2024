import 'package:e_kino_desktop/providers/auditorium_provider.dart';
import 'package:e_kino_desktop/screens/auditoriums/auditoriums_screen.dart';
import 'package:e_kino_desktop/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../providers/users_provider.dart';

class AddAuditoriumScreen extends StatefulWidget {
  final int? auditoriumId;
  final String? name;
  const AddAuditoriumScreen({this.auditoriumId, this.name, super.key});
  @override
  State<AddAuditoriumScreen> createState() => _AddAuditoriumScreenState();
}

class _AddAuditoriumScreenState extends State<AddAuditoriumScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> userData = {};
  late AuditoriumProvider _usersProvider;

  @override
  void initState() {
    super.initState();
    _usersProvider = context.read<AuditoriumProvider>();
    if (widget.auditoriumId != null) {
      userData = {
        "id": widget.auditoriumId,
        "name": widget.name,
      };
    } else {
      userData = {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Auditorium",
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Postavite ikonu back gumba
          onPressed: () {
            userData = {};
            _formKey.currentState?.reset();
            Navigator.pop(context);
          },
        ),
      ),
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
                            if (widget.auditoriumId != null) {
                              // _updateUserData(field, value);
                              try {
                                await _usersProvider.update(
                                    userData['id'], request);

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const AuditoriumScreen(),
                                ));

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Uspješno ste editovali auditorium",
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
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            } else {
                              try {
                                await _usersProvider.insert(request);

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const AuditoriumScreen(),
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Uspješno ste dodali auditorium",
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
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
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
        initialValue: userData,
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
