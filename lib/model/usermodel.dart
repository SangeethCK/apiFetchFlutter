class UserModel {
  String id;
  String title;
  String firstName;
  String lastName;
  String picture;

 

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        picture = json['picture'];
}
