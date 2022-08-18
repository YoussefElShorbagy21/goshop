class UserModel
{
  String? name ;
  String? email;
  String? userid;
  String? image = 'https://i.stack.imgur.com/ILTQq.png';

  UserModel({
    this.email,
    this.name,
    this.userid,
    this.image,
  });

factory UserModel.fromMap(map)
{
  return UserModel(
    name: map['name'],
    email: map['email'],
    userid: map['userid'],
    image: map['image'],
  );
}

  Map<String,dynamic> toMap()
  {
    return{
      'name' : name,
      'email': email,
      'userid':userid,
      'image' : image,
    };
  }
}