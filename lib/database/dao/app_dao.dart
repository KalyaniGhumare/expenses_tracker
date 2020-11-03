import 'package:floor/floor.dart';
import 'package:flutter_widget/database/model/user.dart';

@dao
abstract class AppDao {
  // Insert New User into DB
  @insert
  Future<void> insertUser(User user);

  @Query(
      "SELECT * FROM User WHERE mobile = :mobileNumber AND password = :password")
  Future<User> checkUser(String mobileNumber, String password);

  // Update database value
  @update
  Future<int> updateUser(User user);

  @Query("SELECT * FROM User WHERE mobile = :mobile")
  Future<User> readUserDetails(String mobile);

  @Query("SELECT * FROM User WHERE mobile = :mobile")
  Future<User> readUserDetailsForDeleteRecord(String mobile);

  @delete
  Future<int> deleteUser(User user);
}
