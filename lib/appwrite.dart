import 'package:appwrite/appwrite.dart';

Appwrite appwrite = Appwrite();

class Appwrite {
  Client client = Client();
  late Databases databases;
  late Account account;

  void initialiseAppwrite() {
    client
        .setEndpoint("https://cloud.appwrite.io/v1")
        .setProject("669cf82100212276b67e");
    databases = Databases(client);
    account = Account(client);
  }

  void phoneLogin() async {
    final account = Account(client);
    final sessionToken = await account.createPhoneToken(
        userId: ID.unique(), phone: '+14255550123');
    final userId = sessionToken.userId;
    await account.updatePhoneSession(userId: userId, secret: '[SECRET]');
  }
}
