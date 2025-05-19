import 'package:flutter/material.dart';
import 'package:devinsight/models/publication/post.dart';
import 'package:devinsight/ui/home/widgets/publicationsCard.dart';
import 'package:devinsight/ui/home/widgets/user_list.dart';
import 'package:devinsight/ui/home/widgets/mediaCard.dart';

import '../../../../models/publication/comment.dart';
import '../interactionsCard.dart';

Widget buildTabContent(
  int selectedTab,
  List<Post> posts,
  List<Comment> comments,
  //List connections,
) {
  switch (selectedTab) {
    case 0:
      return _buildSliverList<Post>(
        posts,
        (post) => PublicationsCard(post: post),
      );
    case 1:
      return _buildSliverList<Comment>(
        comments,
        (comments) => InteractionCard(comment: comments),
      );
    case 2:
      return const SliverFillRemaining(
        child: UserList(searchQuery: ""),
      );
    case 3:
      return const MediaGallery();
    default:
      return const SliverToBoxAdapter();
  }
}

Widget _buildSliverList<T>(
  List<T> data,
  Widget Function(T) itemBuilder,
) {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    sliver: SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: itemBuilder(data[index]),
        ),
        childCount: data.length,
      ),
    ),
  );
}
