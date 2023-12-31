import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memorydirective/providers/provider.dart';

import '../providers/get_current_user_provider.dart';
import 'package:memorydirective/providers/logout_provider.dart';

class HomePage extends ConsumerWidget {
  //this is for go_route navigation
  static HomePage builder(BuildContext context, GoRouterState state) =>
      const HomePage();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(getCurrentUserProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: userState.when(
        data: (user) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CachedNetworkImage(
                  imageUrl: user.imgUrl,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    backgroundImage: imageProvider,
                  ),
                ),
                Text(user.username),
                IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () async {
                    //logout user
                    await ref.read(logoutProvider.future);
                  },
                ),
              ],
            ),
          );
        },
        error: (error, _) => const Center(
          child: Text('Something went wrong'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

// now let's test on android emulator
