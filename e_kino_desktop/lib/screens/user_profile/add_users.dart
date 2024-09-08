import 'package:e_kino_desktop/screens/user_profile/users_screen.dart';
import 'package:e_kino_desktop/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../models/user_roles.dart';
import '../../providers/users_provider.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});
  @override
  State<AddUserScreen> createState() => _RegistrationScreenScreenState();
}

class _RegistrationScreenScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> userData = {};
  late UsersProvider _usersProvider;
  late UsersProvider _korisnikProvider;
  @override
  void initState() {
    super.initState();
    _usersProvider = context.read<UsersProvider>();
    if (UsersData.id != null) {
      List<int>? roleIds = [];
      for (var element in UsersData.roleList!) {
        roleIds.add(element.roleId!);
      }

      userData = {
        "id": UsersData.id,
        "firstName": UsersData.name,
        "lastName": UsersData.lastname,
        "email": UsersData.email,
        "phone": UsersData.phone,
        "username": UsersData.userName,
        "password": null,
        "passwordConfirm": null,
        "status": UsersData.status,
        "roleIdList": roleIds
      };
    } else {
      userData = {};
    }
    initForm();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> initForm() async {}
  Map<String, int> values = {
    'Administrator': 1,
    'Client': 2,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dodaj korisnika",
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            UsersData.id = null;
            userData = {};
            _formKey.currentState?.reset();
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
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
                          var request = Map.from(_formKey.currentState!.value);

                          if (UsersData.id != null) {
                            try {
                              await _usersProvider.update(
                                  userData['id'], request);

                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const UsersScreen(),
                              ));
                              UsersData.id = null;

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Uspješno ste editovali korisnika",
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
                          } else {
                            try {
                              await _usersProvider.insert(request);

                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Uspješno ste dodali korisnika",
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
                        }
                      },
                      child: const Text("Spasi")),
                )
              ],
            ),
          ],
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
                  labelText: "Ime", labelStyle: TextStyle(color: Colors.black)),
              name: "firstName",
              style: const TextStyle(color: Colors.black),
              validator: FormBuilderValidators.required(
                  errorText: "Polje ne smije biti prazno."),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              decoration: const InputDecoration(
                labelText: "Prezime",
                labelStyle: TextStyle(color: Colors.black),
              ),
              name: "lastName",
              style: const TextStyle(color: Colors.black),
              validator: FormBuilderValidators.required(
                  errorText: "Polje ne smije biti prazno."),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              decoration: const InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.black)),
              name: "email",
              style: const TextStyle(color: Colors.black),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: "Polje ne smije biti prazno."),
                FormBuilderValidators.email(
                    errorText: "Unesite ispravnu email adresu."),
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              decoration: const InputDecoration(
                  labelText: "Telefon",
                  labelStyle: TextStyle(color: Colors.black)),
              name: "phone",
              style: const TextStyle(color: Colors.black),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: "Polje ne smije biti prazno."),
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              decoration: const InputDecoration(
                  labelText: "Korisničko ime",
                  labelStyle: TextStyle(color: Colors.black)),
              name: "username",
              style: const TextStyle(color: Colors.black),
              validator: FormBuilderValidators.required(
                  errorText: "Polje ne smije biti prazno."),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              decoration: const InputDecoration(
                  labelText: "Lozinka",
                  labelStyle: TextStyle(color: Colors.black)),
              name: "password",
              obscureText: true,
              style: const TextStyle(color: Colors.black),
              validator: UsersData.id != null
                  ? null
                  : FormBuilderValidators.required(
                      errorText: "Polje ne smije biti prazno."),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
                decoration: const InputDecoration(
                    labelText: "Ponovite lozinku",
                    labelStyle: TextStyle(color: Colors.black)),
                name: "passwordConfirm",
                validator: UsersData.id != null
                    ? null
                    : FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "Polje ne smije biti prazno."),
                        (passwordConfirmValue) {
                          var password =
                              _formKey.currentState?.fields["password"]!.value;
                          if (passwordConfirmValue == password) return null;
                          return 'Lozinke se ne podudaraju';
                        },
                      ]),
                obscureText: true,
                style: const TextStyle(color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      FormBuilderCheckboxGroup(
                        wrapDirection: Axis.vertical,
                        orientation: OptionsOrientation.vertical,
                        name: 'roleIdList',
                        options: [
                          FormBuilderFieldOption(
                            value: values.values.first,
                            child: const Text('Administator'),
                          ),
                          FormBuilderFieldOption(
                            value: values.values.last,
                            child: const Text('Client'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderCheckbox(
                        initialValue: userData['status'],
                        name: 'status',
                        title: const Text('Active')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
