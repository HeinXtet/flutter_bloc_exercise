import 'package:equatable/equatable.dart';

class PostModel extends Equatable {

  final int id;
  final String title;
  final String body;
  PostModel({this.id, this.title, this.body});

  @override
  List<Object> get props => [id,title,body];

  @override
  String toString() => 'Post { id: $id }';

}
