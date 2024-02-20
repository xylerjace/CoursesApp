import 'package:course/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:course/model/category.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> tabs = ["UI/UX", "Web Dev", "App Dev"];

  List<Courses> courses = [];
  List<Courses> popular = [];

  void fetchData() {
    courses = Courses.getCourses();
    popular = Courses.getPopular();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          searchBar(),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Category",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 10),
          tabBar(),
          SizedBox(height: 20),
          coursesList(),
          SizedBox(height: 10),
          Text(
            "Popular Courses",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          GridView.builder(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: popular.length,
            itemBuilder: (content, index) {
              return Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 193, 235, 255)
                          .withOpacity(0.3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        popular[index].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(popular[index].lessons),
                          Text(
                            popular[index].rating,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.lightBlue,
                            size: 30,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            popular[index].price,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlue),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details(
                                            courses: courses[index],
                                          )),
                                );
                              },
                              icon: Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: SvgPicture.asset(popular[index].iconPath),
                        ),
                      ),
                    ],
                  ));
            },
          ),
        ],
      ),
    );
  }

  Container coursesList() {
    return Container(
      height: 150,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20),
            width: 280,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 148, 196, 236).withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Container(
                    width: 100,
                    height: 70,
                    child: SvgPicture.asset(courses[index].iconPath),
                  ),
                ),
                Container(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          courses[index].name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  courses[index].lessons,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  courses[index].price,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 5),
                                      Text(
                                        courses[index].rating,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.lightBlue,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Details(
                                                    courses: courses[index],
                                                  )),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Container tabBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.all(5),
      height: 50,
      alignment: Alignment.center,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 25),
        itemCount: tabs.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: currentIndex == index ? Colors.blueAccent : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: currentIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container searchBar() {
    return Container(
      height: 40,
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(30, 20, 50, 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Course',
          contentPadding: const EdgeInsets.all(15),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text.rich(
        TextSpan(
          text: 'Choose your \n',
          children: [
            TextSpan(
              text: 'Desired Course',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              image: const DecorationImage(
                image: AssetImage("assets/profile.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
