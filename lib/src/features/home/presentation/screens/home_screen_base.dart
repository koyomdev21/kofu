import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kofu/src/constants/app_sizes.dart';
import 'package:kofu/src/routing/app_router.dart';

class HomeScreenBase extends StatelessWidget {
  const HomeScreenBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: false,
              centerTitle: true,
              title: const Text(
                'KOFU AUTO PARTS',
                style: TextStyle(
                  fontSize: Sizes.p28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(
                  60,
                ),
                child: AppBar(
                  elevation: 0,
                  title: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          onTap: () => context.goNamed(AppRoute.search.name),
                          decoration: const InputDecoration(
                            hintText: 'Search for product or shop name',
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.asset(
                          'assets/images/banner${index + 1}.jpg',
                        ),
                      ),
                    ),
                  );
                },
                childCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
