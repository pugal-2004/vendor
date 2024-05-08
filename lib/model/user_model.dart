class UserModel{
  final String name;
  final String email;
  final String bio;
  final String profilePic;
  final String creditAt;
  final String phoneNumber;
  final String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.bio,
    required this.phoneNumber,
    required this.profilePic,
    required this.creditAt,
    required this.uid
  });

  //send to database using brain
  factory UserModel.fromMap(Map<String, dynamic>map){
    return UserModel(
      name: map['name']?? '',
     email: map['email']?? '',
      bio: map['bio']?? '',
       phoneNumber: map['phoneNumber']?? '',
        profilePic: map['profilePic']?? '', 
        creditAt: map['credAt']?? '', 
        uid: map['uid']?? '',
        );
  }

  //to map

   Map<String, dynamic> toMap(){
    return{
      "name": name,
      "email": email,
      "uid": uid,
      "bio": bio,
      "profilePic":profilePic,
      "phoneNumber": phoneNumber,
      "credAt": creditAt,



    };
   }



  
}