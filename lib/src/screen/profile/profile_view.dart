import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  Future<void> signOutCurrentUser() async {
  try {
    await Amplify.Auth.signOut();
    print('hello');
  } on AuthException catch (e) {

    print(e.message);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => signOutCurrentUser(),
          child: const Text('signout')
        ),
      ),
    );
  }
}