import 'package:flutter/material.dart';
import 'package:pcg/widgets/drawer.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';

class AboutUsPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AboutUsPage({super.key});
  
   final List<Map<String, dynamic>> services = [
    {
      "title": "Branding",
      "description": "Building your brand identity and strategy.",
      "icon": Icons.brush,
    },
    {
      "title": "Web Development",
      "description":
          "Custom websites and web applications tailored to your needs.",
      "icon": Icons.web,
    },
    {
      "title": "Social Media",
      "description":
          "Engaging your audience through powerful social media strategies.",
      "icon": Icons.share,
    },
    {
      "title": "Experiences",
      "description": "Creating unforgettable experiences and events.",
      "icon": Icons.event_available,
    },
    {
      "title": "Marketing",
      "description":
          "Comprehensive marketing services to grow your visibility.",
      "icon": Icons.trending_up,
    },
    {
      "title": "Press",
      "description": "Managing press relations and communications.",
      "icon": Icons.record_voice_over,
    },
    // Add more services as needed
  ];

  final List<Map<String, dynamic>> industries = [
    {
      "title": "Energy",
      "description":
          "Innovative solutions for sustainable and renewable energy sources.",
      "icon": Icons.flash_on,
    },
    {
      "title": "Agriculture",
      "description":
          "Technologies and strategies for modern, sustainable agriculture.",
      "icon": Icons.eco,
    },
    {
      "title": "Development",
      "description": "Comprehensive land development and urban planning.",
      "icon": Icons.landscape,
    },
    {
      "title": "Transportation",
      "description":
          "Efficient and sustainable transportation solutions for Air, Land, and Sea.",
      "icon": Icons.directions_car,
    },
    {
      "title": "Networking",
      "description":
          "Advanced networking solutions for ISPs and digital infrastructure.",
      "icon": Icons.router,
    },
    {
      "title": "Space",
      "description":
          "Pioneering the final frontier with innovative space technologies.",
      "icon": Icons.rocket_launch,
    },
    {
      "title": "Robotics",
      "description":
          "Cutting-edge robotics for automation, efficiency, and exploration.",
      "icon": Icons.build,
    },
    {
      "title": "Blockchain",
      "description":
          "Secure, decentralized technologies for transactions and contracts.",
      "icon": Icons.account_balance_wallet,
    },
    {
      "title": "Hardware",
      "description": "The latest in computer and IoT device technologies.",
      "icon": Icons.computer,
    },
  ];


  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width >= 800;
    ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    bool isDesktop = MediaQuery.of(context).size.width >= 800;
        final themeColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : const Color(0xFFB4914C);
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          scaffoldKey: _scaffoldKey,
        ),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                   Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                   Image.asset('assets/about1.png'),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'At the heart of our mission lies a singular commitment: to build a brighter tomorrow, today. '
                            'As a forward-thinking global consultancy, we unite with the worlds pioneering changemakers to craft the future. '
                            'Spanning across the globe, our team operates as a unified force, dedicated to propelling our clients towards remarkable achievements. '
                            'Our ethos is defined by the pursuit of excellence, the drive to surpass competition, and the vision to transform industries.',
                            style: TextStyle(fontFamily: 'Cinzel'),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: isWideScreen
                          ? Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Our approach is characterized by a bespoke, integrated expertise, augmented by a dynamic ecosystem of digital pioneers. '
                                    'This combination ensures not only superior outcomes but does so with unmatched speed and sustainability. '
                                    'Reflecting our commitment to societal progress, we have pledged a portion of our profits and human capital to the Emergence NGO. '
                                    'This initiative aims to harness our collective skills and insights to address pressing issues in education, racial equity, social justice, economic development, and environmental conservation.',
                                    style: TextStyle(fontFamily: 'Cinzel'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Image.asset('assets/about2.png'),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Image.asset('assets/about2.png'),
                                const SizedBox(height: 20),
                                const Text(
                                  'Our approach is characterized by a bespoke, integrated expertise, augmented by a dynamic ecosystem of digital pioneers. '
                                  'This combination ensures not only superior outcomes but does so with unmatched speed and sustainability. '
                                  'Reflecting our commitment to societal progress, we have pledged a portion of our profits and human capital to the Emergence NGO. '
                                  'This initiative aims to harness our collective skills and insights to address pressing issues in education, racial equity, social justice, economic development, and environmental conservation.',
                                  style: TextStyle(fontFamily: 'Cinzel'),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: isWideScreen
                          ? Row(
                              children: [
                                Expanded(
                                  child: Image.asset('assets/about3.png'),
                                ),
                                const SizedBox(width: 20),
                                const Expanded(
                                  child: Text(
                                    'Pride in our work is matched by our recognition as an industry leader in ethical, social, and environmental practices. '
                                    'This accolade places us in the elite top 1% of businesses worldwide, a testament to our commitment to making a positive impact on the world. '
                                    'Since our inception in 2019, our measure of success has always been the success of our clients. '
                                    'It is this unwavering dedication that has earned us the highest client advocacy in the industry. '
                                    'Together, we champion the bold and innovate with integrity to achieve the extraordinary, today.',
                                    style: TextStyle(fontFamily: 'Cinzel'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Image.asset('assets/about3.png'),
                                const SizedBox(height: 20),
                                const Text(
                                  'Pride in our work is matched by our recognition as an industry leader in ethical, social, and environmental practices. '
                                  'This accolade places us in the elite top 1% of businesses worldwide, a testament to our commitment to making a positive impact on the world. '
                                  'Since our inception in 2019, our measure of success has always been the success of our clients. '
                                  'It is this unwavering dedication that has earned us the highest client advocacy in the industry. '
                                  'Together, we champion the bold and innovate with integrity to achieve the extraordinary, today.',
                                  style: TextStyle(fontFamily: 'Cinzel'),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isDarkMode ? Colors.white : const Color(0xFFB4914C),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Text(
                            'Our Values',
                            style: TextStyle(
                              fontFamily: 'Cinzel',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Our values are the building blocks of our culture, embedded in everything we do and central to what allows us to be a global consulting firm that leads with integrity.',
                            style: TextStyle(fontFamily: 'Cinzel'),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Our values are the building blocks of our culture, embedded in everything we do and central to what allows us to be a global consulting firm that leads with integrity.',
                            style: TextStyle(fontFamily: 'Cinzel'),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style:
                                  TextStyle(fontFamily: 'Cinzel', fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Innovation:\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Embracing cutting-edge technologies and creative solutions to stay ahead in the tech industry.\n\n',
                                ),
                                TextSpan(
                                  text: 'Integrity:\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Maintaining transparency, honesty, and ethical practices in all dealings.\n\n',
                                ),
                                TextSpan(
                                  text: 'Collaboration:\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Fostering a collaborative environment where diverse ideas and perspectives are valued.\n\n',
                                ),
                                TextSpan(
                                  text: 'Excellence:\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Striving for the highest quality in every project and service.\n\n',
                                ),
                                TextSpan(
                                  text: 'Customer-Centricity:\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Putting clients\' needs and satisfaction at the forefront of all actions.\n\n',
                                ),
                                TextSpan(
                                  text: 'Sustainability:\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Promoting sustainable practices in operations and projects.\n\n',
                                ),
                                TextSpan(
                                  text: 'Inclusivity:\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Creating an inclusive workplace that values diversity and equality.\n',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          const Text(
                            'Our Expertise',
                            style: TextStyle(
                              fontFamily: 'Cinzel',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          isWideScreen
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        'Our experts bring deep industry and functional expertise and a range of perspectives that question the status quo and spark change. We work in a uniquely collaborative model across the firm and throughout all levels of the client organization, fueled by the goal of helping our clients thrive and enabling them to make the world a better place.',
                                        style: TextStyle(fontFamily: 'Cinzel'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Image.asset(
                                      'assets/about4.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Image.asset(
                                      'assets/about4.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Our experts bring deep industry and functional expertise and a range of perspectives that question the status quo and spark change. We work in a uniquely collaborative model across the firm and throughout all levels of the client organization, fueled by the goal of helping our clients thrive and enabling them to make the world a better place.',
                                      style: TextStyle(fontFamily: 'Cinzel'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Industries',
                            style: TextStyle(
                              fontFamily: 'Cinzel',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(height: 16),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isDesktop ? 3 : 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 3,
                            ),
                            itemCount: industries.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Colors.white,
                                  border: Border.all(color: themeColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ListTile(
                                  leading: Icon(industries[index]["icon"],
                                      color: themeColor),
                                  title: Text(industries[index]["title"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: textColor)),
                                  subtitle: Text(
                                      industries[index]["description"],
                                      style: TextStyle(color: textColor)),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(height: 40),
                          const Text(
                            'Services',
                            style: TextStyle(
                              fontFamily: 'Cinzel',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                           GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isDesktop ? 3 : 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3,
                          ),
                          itemCount: services.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black
                                    : Colors.white,
                                border: Border.all(color: themeColor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ListTile(
                                leading: Icon(services[index]["icon"],
                                    color: themeColor),
                                title: Text(services[index]["title"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: textColor)),
                                subtitle: Text(services[index]["description"],
                                    style: TextStyle(color: textColor)),
                              ),
                            );
                          },
                        ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          const Text(
                            'Specialty Teams',
                            style: TextStyle(
                              fontFamily: 'Cinzel',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "PCG's specialty teams combine unique expertise and leading capabilities to better serve clients' evolving needs—from procurement to purpose and tech to transformation. Explore below.",
                            style: TextStyle(fontFamily: 'Cinzel'),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          isWideScreen
                              ? const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'PCG Amplify',
                                            style: TextStyle(
                                              fontFamily: 'Cinzel',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Role: Marketing & Press',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Summary: Driving strategic marketing initiatives and managing media relations to enhance client visibility, brand equity, and market influence.',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'PCG x Forge',
                                            style: TextStyle(
                                              fontFamily: 'Cinzel',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Role: Development',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Summary: Leading the development of advanced digital solutions, focusing on web, mobile apps, artificial intelligence, and blockchain technologies to transform client businesses.',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'PCG Nexus',
                                            style: TextStyle(
                                              fontFamily: 'Cinzel',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Role: Research',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Summary: Conducting cutting-edge research and innovation to create new technologies and methodologies, ensuring clients remain industry leaders.',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          /*
                                          Text(
                                            'PCG Capital',
                                            style: TextStyle(
                                              fontFamily: 'Cinzel',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Role: Finance',
                                            style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Summary: Providing expert financial analysis, strategy, and management to optimize financial performance and support informed decision-making.',
                                            style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'PCG Ventures',
                                            style: TextStyle(
                                              fontFamily: 'Cinzel',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Role: Investments',
                                            style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Summary: Identifying, managing, and optimizing investment opportunities to drive growth and maximize returns for clients.',
                                            style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          */
                                          Text(
                                            'PCG Terra',
                                            style: TextStyle(
                                              fontFamily: 'Cinzel',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Role: Land Development and Construction',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Summary: Overseeing land acquisition, development, and construction projects, ensuring sustainable, high-quality outcomes that meet client needs.',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'PCG Energy',
                                            style: TextStyle(
                                              fontFamily: 'Cinzel',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Role: Energy and Industrial Services',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Summary: Delivering innovative energy solutions and industrial services to enhance operational efficiency and sustainability for clients.',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'PCG Flow',
                                            style: TextStyle(
                                              fontFamily: 'Cinzel',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Role: Supply Chain and Logistics',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Summary: Streamlining supply chain and logistics operations to improve efficiency, reduce costs, and ensure timely delivery and fulfillment.',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          /*
                                          SizedBox(height: 20),
                                          Text(
                                            'PCG Design',
                                            style: TextStyle(
                                              fontFamily: 'Cinzel',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Role: Product Design and Manufacturing',
                                            style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'Summary: Leading the design and manufacturing processes for innovative products, from initial concept to production, ensuring market relevance and excellence.',
                                            style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          */
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'PCG Amplify',
                                      style: TextStyle(
                                        fontFamily: 'Cinzel',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Role: Marketing & Press',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Summary: Driving strategic marketing initiatives and managing media relations to enhance client visibility, brand equity, and market influence.',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'PCG x Forge',
                                      style: TextStyle(
                                        fontFamily: 'Cinzel',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Role: Development',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Summary: Leading the development of advanced digital solutions, focusing on web, mobile apps, artificial intelligence, and blockchain technologies to transform client businesses.',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'PCG Nexus',
                                      style: TextStyle(
                                        fontFamily: 'Cinzel',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Role: Research',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Summary: Conducting cutting-edge research and innovation to create new technologies and methodologies, ensuring clients remain industry leaders.',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    /*
                                    SizedBox(height: 20),
                                    Text(
                                      'PCG Capital',
                                      style: TextStyle(
                                        fontFamily: 'Cinzel',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Role: Finance',
                                      style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Summary: Providing expert financial analysis, strategy, and management to optimize financial performance and support informed decision-making.',
                                      style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'PCG Ventures',
                                      style: TextStyle(
                                        fontFamily: 'Cinzel',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Role: Investments',
                                      style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Summary: Identifying, managing, and optimizing investment opportunities to drive growth and maximize returns for clients.',
                                      style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    */
                                    SizedBox(height: 20),
                                    Text(
                                      'PCG Terra',
                                      style: TextStyle(
                                        fontFamily: 'Cinzel',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Role: Land Development and Construction',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Summary: Overseeing land acquisition, development, and construction projects, ensuring sustainable, high-quality outcomes that meet client needs.',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'PCG Energy',
                                      style: TextStyle(
                                        fontFamily: 'Cinzel',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Role: Energy and Industrial Services',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Summary: Delivering innovative energy solutions and industrial services to enhance operational efficiency and sustainability for clients.',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'PCG Flow',
                                      style: TextStyle(
                                        fontFamily: 'Cinzel',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Role: Supply Chain and Logistics',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Summary: Streamlining supply chain and logistics operations to improve efficiency, reduce costs, and ensure timely delivery and fulfillment.',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    /*
                                    SizedBox(height: 20),
                                    Text(
                                      'PCG Design',
                                      style: TextStyle(
                                        fontFamily: 'Cinzel',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Role: Product Design and Manufacturing',
                                      style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Summary: Leading the design and manufacturing processes for innovative products, from initial concept to production, ensuring market relevance and excellence.',
                                      style: TextStyle(fontFamily: 'Cinzel', fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    */
                                  ],
                                ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: const Column(
                        children: [
                          Text(
                            'Artificial Intelligence',
                            style: TextStyle(
                              fontFamily: 'Cinzel',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Scaling artificial intelligence can create a massive competitive advantage. Learn how our AI-driven initiatives have helped clients extract value.',
                            style: TextStyle(fontFamily: 'Cinzel'),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'READ OUR KNOWLEDGE >',
                            style: TextStyle(
                              fontFamily: 'Cinzel',
                              color: Color(0xFFB4914C),
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                      ],
                    ),
                  ),
                  isWideScreen ? const SizedBox() : const Footer()
                ],
              ),
            ),
          ),
          isWideScreen ? const Footer() : const SizedBox()
        ],
      ),
    );
  }
}
