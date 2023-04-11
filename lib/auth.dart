import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('https://172.22.32.1/v1') // Your Appwrite Endpoint
    .setProject('64313f1c30f7d428db72') // Your project ID
    .setSelfSigned(
        status: true); // For self signed certificates, only use for development

//create user

Account account = Account(client);

// Register User
Future createUser(String name, String email, String password) async {
  try {
    final user = await account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    print('User created');
  } on AppwriteException catch (e) {
    print(e);
  }
}

//login user
Future loginUser(String email, String password) async {
  try {
    final user =
        await account.createEmailSession(email: email, password: password);
    print("user logged");
  } on AppwriteException catch (e) {
    print(e);
  }
}

//logout the user
Future logoutUser() async {
  account.deleteSession(sessionId: 'current');
}
