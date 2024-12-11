import 'package:e_kino_mobile/screens/user_profile/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';
import '../../providers/users_provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _formKeyBuild = GlobalKey<FormBuilderState>();
  final _formPasswordKey = GlobalKey<FormState>();
  late UsersProvider _usersProvider;
  bool _isLoading = true;
  String? usernameLS;
  Users? _user;
  late Map<String, dynamic> userData;

  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  // Mape za prevođenje int vrijednosti u stringove
  final Map<int, String> spolValues = {1: 'Muški', 2: 'Ženski'};
  final Map<int, String> radniStatusValues = {1: 'Zaposlen', 2: 'Nezaposlen'};
  final Map<int, String> stepenObrazovanjaValues = {
    1: 'Osnovno',
    2: 'Srednje',
    3: 'Bachelor (Osnovne studije)',
    4: 'Master',
    5: 'Doktorat'
  };

  Future<String?> _retrieveAndPrintUsernameState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usernameState = prefs.getString('usernameState');
    return usernameState;
  }

  @override
  void initState() {
    super.initState();
    _usersProvider = context.read<UsersProvider>();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _retrieveAndPrintUsernameState().then((username) {
      setState(() {
        usernameLS = username;
      });
      _fetchUserByUsername(username);
    });
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _fetchUserByUsername(String? username) async {
    if (username != null && _isLoading) {
      try {
        final user = await _usersProvider.getUsername(username);
        if (user.userId != null) {
          setState(() {
            _user = user;
            userData = {
              "userId": _user?.userId ?? '',
              "firstName": _user?.firstName ?? '',
              "lastName": _user?.lastName ?? '',
              "email": _user?.email ?? '',
              "phone": _user?.phone ?? '',
              "username": _user?.username ?? '',
              "status": _user?.status ?? '',
              "roleIdList": [2],
              "spolId": _user?.spolId,
              "radniStatusId": _user?.radniStatusId,
              "stepenObrazovanjaId": _user?.stepenObrazovanjaId
            };
          });
        }
      } catch (error) {
        Exception('Greska: $error');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _updateUserData(String field, dynamic value) {
    if (value != null) {
      setState(() {
        userData[field] = value;
      });
    }
  }

  void _saveUserData(BuildContext context) async {
    try {
      await _usersProvider.update(userData['userId'], userData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Korisnički podatci uspješno izmjenjeni'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      Exception('Greška u snimanju korisničkih podataka: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Greška prilikom izmjene korisničkih podataka'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _changePassword() async {
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;
    Map<String, dynamic> updatedUserData = Map.from(userData);
    updatedUserData['password'] = newPassword;
    updatedUserData['passwordConfirm'] = confirmPassword;

    try {
      await _usersProvider.update(updatedUserData['userId'], updatedUserData);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Korisnički podatci uspješno izmjenjeni'),
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Greška prilikom izmjene korisničkih podataka'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      Exception('Greska u snimanju korisničkih podataka: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  _buildForm(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _saveUserData(context),
                    child: const Text('Spasi izmjene'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          contentPadding: EdgeInsets.zero,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Password"),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Form(
                                key: _formPasswordKey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      controller: _newPasswordController,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                          labelText: 'Novi password'),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Unesite novi password';
                                        } else if (value.length < 6) {
                                          return 'Password mora imati najmanje 6 karaktera';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16.0),
                                    TextFormField(
                                      controller: _confirmPasswordController,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                          labelText: 'Potvrdi Password'),
                                      validator: (value) {
                                        if (value !=
                                            _newPasswordController.text) {
                                          return 'Passwordi se ne podudaraju';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 32.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_formPasswordKey.currentState!
                                            .validate()) {
                                          _changePassword();
                                        }
                                      },
                                      child: const Text('Izmjeni Password'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text('Izmjeni Password'),
                  ),
                ],
              ),
      ),
    );
  }

  FormBuilder _buildForm() {
    return FormBuilder(
      key: _formKeyBuild,
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'Ime',
            decoration: const InputDecoration(labelText: 'Ime'),
            initialValue: userData['firstName'] ?? '',
            onChanged: (value) => _updateUserData('firstName', value),
          ),
          FormBuilderTextField(
            name: 'Prezime',
            decoration: const InputDecoration(labelText: 'Prezime'),
            initialValue: userData['lastName'] ?? '',
            onChanged: (value) => _updateUserData('lastName', value),
          ),
          FormBuilderTextField(
            name: 'Email',
            decoration: const InputDecoration(labelText: 'Email'),
            initialValue: userData['email'] ?? '',
            onChanged: (value) => _updateUserData('email', value),
          ),
          FormBuilderTextField(
            name: 'Telefon',
            decoration: const InputDecoration(labelText: 'Telefon'),
            initialValue: userData['phone'] ?? '',
            onChanged: (value) => _updateUserData('phone', value),
          ),
          FormBuilderTextField(
            name: 'Username',
            decoration: const InputDecoration(labelText: 'Username'),
            initialValue: userData['username'] ?? '',
            onChanged: (value) => _updateUserData('username', value),
          ),
          FormBuilderDropdown<int>(
            name: 'Spol',
            decoration: const InputDecoration(labelText: 'Spol'),
            initialValue: userData['spolId'],
            onChanged: (value) => _updateUserData('spolId', value),
            items: spolValues.entries
                .map((entry) => DropdownMenuItem<int>(
                      value: entry.key,
                      child: Text(entry.value),
                    ))
                .toList(),
          ),
          FormBuilderDropdown<int>(
            name: 'Radni status',
            decoration: const InputDecoration(labelText: 'Radni status'),
            initialValue: userData['radniStatusId'],
            onChanged: (value) => _updateUserData('radniStatusId', value),
            items: radniStatusValues.entries
                .map((entry) => DropdownMenuItem<int>(
                      value: entry.key,
                      child: Text(entry.value),
                    ))
                .toList(),
          ),
          FormBuilderDropdown<int>(
            name: 'Stepen obrazovanja',
            decoration: const InputDecoration(labelText: 'Stepen obrazovanja'),
            initialValue: userData['stepenObrazovanjaId'],
            onChanged: (value) => _updateUserData('stepenObrazovanjaId', value),
            items: stepenObrazovanjaValues.entries
                .map((entry) => DropdownMenuItem<int>(
                      value: entry.key,
                      child: Text(entry.value),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
