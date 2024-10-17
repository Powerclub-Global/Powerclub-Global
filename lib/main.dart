import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pcg/appwrite.dart';
import 'package:pcg/change_notifiers/blog_notifier.dart';
import 'package:pcg/pages/blog_page.dart';
import 'package:pcg/pages/direct_blog_page.dart';
import 'package:pcg/pages/press_release.dart';
import 'package:pcg/theme/theme.dart';
import 'package:pcg/theme/theme_manager.dart';
import 'pages/home.dart';
import 'pages/industries.dart';
import 'pages/services.dart';
import 'pages/insights.dart';
import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/careers.dart';
import 'pages/bodhi.dart';

void main() {
  appwrite.initialiseAppwrite();
  blogNotifier.fetchBlogs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return PageTransition(
          child: Home(),
          type: PageTransitionType.leftToRight,
          settings: settings);
    }
    final pathSegments = Uri.parse(settings.name ?? "").pathSegments;

    switch (pathSegments[0]) {
      case 'industriesPage':
        return PageTransition(
            child: IndustriesPage(),
            type: PageTransitionType.leftToRight,
            settings: settings);
      case 'servicesPage':
        return PageTransition(
            child: ServicesPage(),
            type: PageTransitionType.leftToRight,
            settings: settings);
      case 'insightsPage':
        return PageTransition(
            child: const InsightsPage(),
            type: PageTransitionType.leftToRight,
            settings: settings);
      case 'aboutUsPage':
        return PageTransition(
            child: AboutUsPage(),
            type: PageTransitionType.leftToRight,
            settings: settings);
      case 'contactUsPage':
        return PageTransition(
            child: const ContactUsPage(),
            type: PageTransitionType.leftToRight,
            settings: settings);
      case 'careersPage':
        return PageTransition(
            child: CareersPage(),
            type: PageTransitionType.leftToRight,
            settings: settings);
      case 'pressReleases':
        return PageTransition(
            child: const PressReleasePage(),
            type: PageTransitionType.leftToRight,
            settings: settings);
      case 'bodhiPage':
        return PageTransition(
            child: const Bodhi(),
            type: PageTransitionType.leftToRight,
            settings: settings);
      case 'blogs':
        if (blogNotifier.pressReleases.isEmpty || blogNotifier.blogs.isEmpty) {
          return PageTransition(
              child: DirectBlogPage(urlId: pathSegments[1]),
              type: PageTransitionType.leftToRight,
              settings: settings);
        }
        final Document post = blogNotifier.pressReleases[pathSegments[1]] ??
            blogNotifier.blogs[pathSegments[1]]!;
        return PageTransition(
            child: BlogPage(
              title: post.data["title"],
              image: post.data["thumbnail"],
              content: post.data["content"],
            ),
            type: PageTransitionType.leftToRight,
            settings: settings);
      default:
        return PageTransition(
            child: Home(),
            type: PageTransitionType.leftToRight,
            settings: settings);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeManager,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Powerclub Global',
          theme: MyAppThemes.lightTheme,
          darkTheme: MyAppThemes.darkTheme,
          themeMode: themeManager.themeMode,
          debugShowCheckedModeBanner: false,
          onGenerateInitialRoutes: (initialRoute) =>
              [onGenerateRoute(RouteSettings(name: initialRoute))],
          onGenerateRoute: onGenerateRoute,
        );
      },
    );
  }
}
