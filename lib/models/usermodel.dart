class UserModel
{
  String? name ;
  String? email;
  String? userid;
  String? image = 'https://i.stack.imgur.com/ILTQq.png';
  String? phone ;
  String? city;
  String? location;

  UserModel({
    this.email,
    this.name,
    this.userid,
    this.image,
    this.phone,
    this.city,
    this.location,
  });

factory UserModel.fromMap(map)
{
  return UserModel(
    name: map['name'],
    email: map['email'],
    userid: map['userid'],
    image: map['image'],
    phone: map['phone'],
    city: map['city'],
    location: map['location']
  );
}

  Map<String,dynamic> toMap()
  {
    return{
      'name' : name,
      'email': email,
      'userid':userid,
      'image' : image,
      'phone' : phone,
      'city': city,
      'location' : location
    };
  }
}