class Profile {

  String firstName;
  String lastName;
  int? age;
  double height;
  Gender gender;
  List<String> hobbies;
  String favoriteProgrammingLanguage;
  String secret;

  Profile({
    this.firstName = "",
    this.lastName = "",
    this.age,
    this.height = 0.0,
    this.gender = Gender.male,
    this.hobbies = const [],
    this.favoriteProgrammingLanguage = "",
    this.secret = ""
  });
}

enum Gender {
  male,
  female
}