import 'package:flutter/material.dart';
import 'package:pcg/widgets/drawer.dart';
import '../widgets/contact_form.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
        ),
      ),
      drawer: const CustomDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ContactForm(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
