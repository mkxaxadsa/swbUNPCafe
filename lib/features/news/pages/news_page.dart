import 'package:cafe_test/core/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/news_bloc.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const CustomAppbar(title: 'News'),
              BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoadedState) {
                    if (state.news.isEmpty) return const NoData(expanded: true);

                    return Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        children: [
                          ...List.generate(
                            state.news.length,
                            (index) {
                              return NewsCard(news: state.news[index]);
                            },
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
          // Positioned(
          //   right: 24,
          //   bottom: 56 + getBottom(context),
          //   child: PrimaryButton(
          //     title: '+ Add News',
          //     width: 165,
          //     onPressed: () {
          //       context.push('/news/add');
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
