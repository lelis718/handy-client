import 'package:equatable/equatable.dart';

class Help extends Equatable {
  final String user;
  final String message;

  Help({
    this.user,
    this.message,
  });

  factory Help.fromJson(Map<String, dynamic> json) {
    return Help(
      user: json["user"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        'user': this.user,
        'message': this.message,
      };

  @override
  List<Object> get props => [user, message];
}
