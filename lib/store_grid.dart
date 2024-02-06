import 'package:flutter/material.dart';

class StoreGrid extends StatelessWidget {
  final List<dynamic> girdData;
  final bool isDark;

  const StoreGrid({super.key, required this.girdData, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          isDark ? Colors.black : Colors.white, // Set the background color here
      child: Column(
        children: [
          Wrap(
            spacing: 60.0,
            runSpacing: 40.0,
            alignment: WrapAlignment.center,
            children: List.generate(girdData.length, (jobID) {
              return Container(
                  width: 400,
                  height: 570,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 200,
                          child: Image.network(
                            "https://picsum.photos/600/100",
                            fit: BoxFit.fill,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        girdData[jobID]["name"],
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        girdData[jobID]["type"],
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Job Description",
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        girdData[jobID]["description"],
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Skills Required",
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: List.generate(
                            girdData[jobID]["skills"].length,
                            (index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 0, 140, 255),
                                  ),
                                  color: Color.fromARGB(220, 34, 150, 245),
                                ),
                                height: 30,
                                width: 90,
                                child: Center(
                                    child: Text(
                                  girdData[jobID]["skills"][index],
                                  style: TextStyle(color: Colors.white),
                                )),
                              );
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Stipend - ${girdData[jobID]["salary"]}',
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  minimumSize: Size(400, 55),
                                  backgroundColor:
                                      Color.fromARGB(255, 121, 190, 60),
                                  shape: RoundedRectangleBorder()),
                              onPressed: () {},
                              child: Text(
                                "Apply Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 3,
                                ),
                              )),
                        ],
                      )
                    ],
                  ));
            }),
          ),
        ],
      ),
    );
  }
}
