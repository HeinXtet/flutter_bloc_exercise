import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb/post/bloc/bloc.dart';
import 'package:flutter_tmdb/post/bloc/post_bloc.dart';
import 'package:flutter_tmdb/post/view/PostView.dart';
import 'package:flutter_tmdb/timer/view/WaveBackground.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Example"),
      ),
      body: BlocProvider(
        create: (context) => PostBloc()..add(PostFetched()),
        child: Stack(
          children: [WaveBackground(), PostView()],
        ),
      ),
    );
  }
}
