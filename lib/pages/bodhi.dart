import 'package:flutter/material.dart';
import 'package:pcg/widgets/drawer.dart';
import 'package:pcg/widgets/linktree.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';

class Bodhi extends StatelessWidget {
  const Bodhi({Key? key}) : super(key: key);

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
      body: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: LinkTreeWidget(
                  assetPath: 'assets/bodhi.png',
                  name: 'Jessy Bodhi Artman',
                  contact: 'bodhi@powerclubglobal.com',
                  links: [
                    LinkButton(
                      title: 'Website',
                      url: 'https://www.powerclubglobal.com',
                      isDownload: false,
                    ),
                    LinkButton(
                      title: 'LinkedIn',
                      url: 'https://www.linkedin.com/in/jessy-artman-740b9a94',
                      isDownload: false,
                    ),
                    LinkButton(
                      title: 'Instagram',
                      url: 'https://www.instagram.com/jessyartman/',
                      isDownload: false,
                    ),
                    LinkButton(
                      title: 'X',
                      url: 'https://twitter.com/JessyArtman',
                      isDownload: false,
                    ),
                    LinkButton(
                      title: 'Download Card',
                      url:
                          'https://firebasestorage.googleapis.com/v0/b/powerclub-glb.appspot.com/o/Jessy%20%E2%80%9CBodhi%E2%80%9D%20Artman.vcf?alt=media&token=4c6611e3-61f6-421d-bca5-5bf7bdf0a2ed',
                      isDownload: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
