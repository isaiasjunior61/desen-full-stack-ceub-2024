import 'package:flutter/widgets.dart';
import 'package:app_novo/models/models.dart';
import 'package:flutter/material.dart';
import 'package:app_novo/models/post.dart';

class PostSection extends StatelessWidget {
  final List<Post> posts;

  const PostSection({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Friend Posts',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(post.profileImageUrl),
                        ),
                        title: Text(
                          post.comment,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          '${post.timestamp} mins ago',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
