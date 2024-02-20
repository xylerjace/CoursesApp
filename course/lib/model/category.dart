class Courses {
  String name;
  String iconPath;
  String lessons;
  String price;
  String rating;

  Courses(
      {this.name = "",
      this.iconPath = "",
      this.lessons = "",
      this.price = "",
      this.rating = ""});

  static List<Courses> getCourses() {
    List<Courses> courses = [];

    courses.add(Courses(
        name: "Data Science",
        lessons: "24 Lessons",
        price: "\$25",
        rating: "4.3",
        iconPath: "assets/data-science.svg"));
    courses.add(Courses(
        name: "Web Dev",
        lessons: "26 Lessons",
        price: "\$20",
        rating: "4.4",
        iconPath: "assets/webdev.svg"));
    courses.add(Courses(
        name: "Css Course",
        lessons: "17 Lessons",
        price: "\$15",
        rating: "4.0",
        iconPath: "assets/css.svg"));
    courses.add(Courses(
        name: "Database",
        lessons: "30 Lessons",
        price: "\$30",
        rating: "4.7",
        iconPath: "assets/database.svg"));

    return courses;
  }

  static List<Courses> getPopular() {
    List<Courses> popular = [];

    popular.add(Courses(
        name: "Cyber Security",
        lessons: "34 Lessons",
        price: "\$40",
        rating: "4.9",
        iconPath: "assets/cybersecurity.svg"));
    popular.add(Courses(
        name: "Machine Learning",
        lessons: "27 Lessons",
        price: "\$30",
        rating: "4.6",
        iconPath: "assets/machine.svg"));
    popular.add(Courses(
        name: "Asp. Net",
        lessons: "25 Lessons",
        price: "\$25",
        rating: "4.1",
        iconPath: "assets/asp.net.svg"));
    popular.add(Courses(
        name: "Cyber Security",
        lessons: "34 Lessons",
        price: "\$40",
        rating: "4.9",
        iconPath: "assets/cybersecurity.svg"));
    popular.add(Courses(
        name: "Cyber Security",
        lessons: "34 Lessons",
        price: "\$40",
        rating: "4.9",
        iconPath: "assets/cybersecurity.svg"));

    return popular;
  }
}
