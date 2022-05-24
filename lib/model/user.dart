class User{
  final String id;
  final String imageUrl;
  final String nickName;

  const User({required this.id,required this.imageUrl,required this.nickName});
  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'imageUrl': this.imageUrl,
      'nickName': this.nickName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      nickName: map['nickName'] as String,
    );
  }
}