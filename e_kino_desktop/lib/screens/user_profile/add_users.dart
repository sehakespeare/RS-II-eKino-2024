import 'package:e_kino_desktop/screens/user_profile/users_screen.dart';
import 'package:e_kino_desktop/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../models/search_result.dart';
import '../../models/user.dart';
import '../../models/user_roles.dart';
import '../../providers/users_provider.dart';

class AddUserScreen extends StatefulWidget {
  final int? id;
  final String? name;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? userName;
  final String? roleNames;

  final List<UserRole>? roleList;
  final bool? status;

  const AddUserScreen(
      {super.key,
      this.id,
      this.name,
      this.lastname,
      this.email,
      this.phone,
      this.userName,
      this.roleList,
      this.status,
      this.roleNames});
  @override
  State<AddUserScreen> createState() => _RegistrationScreenScreenState();
}

class _RegistrationScreenScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> userData = {};
  late UsersProvider _usersProvider;

  @override
  void initState() {
    super.initState();
    _usersProvider = context.read<UsersProvider>();

    if (widget.id != null) {
      List<int>? roleIds = [];
      for (var element in widget.roleList!) {
        roleIds.add(element.roleId!);
      }

      userData = {
        "id": widget.id,
        "firstName": widget.name,
        "lastName": widget.lastname,
        "email": widget.email,
        "phone": widget.phone,
        "username": widget.userName,
        "password": null,
        "passwordConfirm": null,
        "status": widget.status,
        "roleIdList": roleIds,
        "roleNames": widget.roleNames
      };
    } else {
      userData = {
        "status": true,
      };
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

                          if (widget.id != null) {
                            try {
                              await _usersProvider.update(
                                  userData['id'], request);

                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const UsersScreen(),
                              ));

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
                              if (e.toString() ==
                                  "Exception: [Username is already in use]") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text("Upozorenje"),
                                    content: const Text(
                                        "Korisničko ime već postoji!"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (e.toString() ==
                                  "Exception: [Email is already in use]") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text("Upozorenje"),
                                    content: const Text("Email već postoji!"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
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
                          } else {
                            try {
                              await _usersProvider.insert(request);

                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const UsersScreen(),
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Uspješno ste dodali korisnika",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 96, 65, 65)),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } on Exception catch (e) {
                              if (e.toString() ==
                                  "Exception: [Username is already in use]") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text("Upozorenje"),
                                    content: const Text(
                                        "Korisničko ime već postoji!"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (e.toString() ==
                                  "Exception: [Email is already in use]") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text("Upozorenje"),
                                    content: const Text("Email već postoji!"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
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
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: "Polje ne smije biti prazno."),
                FormBuilderValidators.maxLength(20,
                    errorText: "Polje može imati najviše 20 karaktera."),
                FormBuilderValidators.minLength(2,
                    errorText: "Polje mora imati najmanje 2 karaktera."),
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              decoration: const InputDecoration(
                labelText: "Prezime",
                labelStyle: TextStyle(color: Colors.black),
              ),
              name: "lastName",
              style: const TextStyle(color: Colors.black),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: "Polje ne smije biti prazno."),
                FormBuilderValidators.maxLength(20,
                    errorText: "Polje može imati najviše 20 karaktera."),
                FormBuilderValidators.minLength(2,
                    errorText: "Polje mora imati najmanje 2 karaktera."),
              ]),
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
                FormBuilderValidators.maxLength(10,
                    errorText: "Broj može imati najviše 10 cifara."),
                FormBuilderValidators.match(r'^0\d{0,9}$',
                    errorText: "Broj mora početi s nulom."),
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              decoration: const InputDecoration(
                  labelText: "Korisničko ime",
                  labelStyle: TextStyle(color: Colors.black)),
              name: "username",
              style: const TextStyle(color: Colors.black),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: "Polje ne smije biti prazno."),
                FormBuilderValidators.maxLength(15,
                    errorText: "Polje može imati najviše 15 karaktera."),
                FormBuilderValidators.minLength(4,
                    errorText: "Polje mora imati najmanje 4 karaktera."),
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              decoration: const InputDecoration(
                  labelText: "Lozinka",
                  labelStyle: TextStyle(color: Colors.black)),
              name: "password",
              obscureText: true,
              style: const TextStyle(color: Colors.black),
              validator: widget.id != null
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
                validator: widget.id != null
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
                      FormBuilderCheckboxGroup<int>(
                        wrapDirection: Axis.vertical,
                        orientation: OptionsOrientation.vertical,
                        name: 'roleIdList',
                        initialValue:
                            userData['roleIdList']?.take(1).toList() ?? [],
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
                        onChanged: (selected) {
                          if (selected != null && selected.length > 1) {
                            // Keep only the last selected option in the list

                            // Update the form state
                            setState(() {
                              FormBuilder.of(context)
                                  ?.fields['roleIdList']!
                                  .reset();
                              _formKey.currentState!.fields['roleIdList']!
                                  .reset();
                            });
                            selected = [selected!.last];
                            userData['roleIdList'] = [selected!.last];
                            _formKey.currentState?.fields['roleIdList']
                                ?.didChange([selected!.last]);
                            [selected!.last];
                            FormBuilder.of(context)
                                ?.fields['roleIdList']
                                ?.didChange([selected!.last]);
                            setState(() {});
                          }
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.minLength(1,
                              errorText: "Morate označiti barem jednu opciju."),
                        ]),
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
                      title: const Text('Active'),
                    ),
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
