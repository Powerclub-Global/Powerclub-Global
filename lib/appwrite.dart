import 'package:appwrite/appwrite.dart';

Appwrite appwrite = Appwrite();

class Appwrite {
  Client client = Client();
  late Databases databases;
  late Account account;

  void initialiseAppwrite() {
    client
        .setEndpoint("https://cloud.appwrite.io/v1")
        .setProject("6629f80bd9d51cfbab00");
    databases = Databases(client);
    account = Account(client);
  }

  void phoneLogin() async {
    final account = Account(client);
    final sessionToken = await account.createPhoneToken(
        userId: ID.unique(), phone: '+14255550123');
    final userId = sessionToken.userId;
    final session = await account.updatePhoneSession(
    userId: userId,
    secret: '[SECRET]'
);
  }
}
