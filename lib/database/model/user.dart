import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  int id;

  String fName, lName, mobile, city, email, password;

  User(this.fName, this.lName, this.city, this.email, this.mobile,
      this.password);
}
