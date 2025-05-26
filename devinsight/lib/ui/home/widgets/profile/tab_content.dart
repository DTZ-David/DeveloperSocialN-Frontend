import 'package:flutter/material.dart';
import 'package:devinsight/models/publication/post.dart';
import 'package:devinsight/ui/home/widgets/publicationsCard.dart';
import 'package:devinsight/ui/home/widgets/mediaCard.dart';

import '../../../../models/publication/comment.dart';
import '../../../../models/user/user_dto.dart';
import '../interactionsCard.dart';
import 'connectios_user_card.dart';

Widget buildTabContent(
  int selectedTab,
  List<Post> posts,
  List<Comment> comments,
  List<UserDto> connections,
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
      return _buildSliverList<UserDto>(
        connections,
        (user) => ConnectionsUserCard(user: user),
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
