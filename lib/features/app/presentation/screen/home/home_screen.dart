import 'package:app_food/common/app_colors.dart';
import 'package:app_food/common/app_text_styles.dart';
import 'package:app_food/common/enums.dart';
import 'package:app_food/common/image_resources.dart';
import 'package:app_food/features/app/presentation/screen/home/cubit/home_cubit.dart';
import 'package:app_food/features/app/presentation/widgets/card_item_pizza_widget.dart';
import 'package:app_food/features/app/presentation/widgets/search_pizza_widget.dart';
import 'package:app_food/features/app/presentation/widgets/show_modal_detail_pizza.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await context.read<HomeCubit>().findAllPizza();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.watch<HomeCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.vibrantOrange,
        shape: const CircleBorder(),
        onPressed: () async {
          await context.read<HomeCubit>().findAllPizza();
        },
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: HeaderSliverPersistentHeaderDelegate(
              maxExtentHeader: size.height * 0.35,
              minExtentHeader: 130,
              builder: (value) {
                double newValue = (value / 0.8).clamp(0, 1);
                return Container(
                  color: AppColors.vibrantOrange,
                  child: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: Opacity(
                            opacity: (1 - (newValue)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Image.asset(
                                ImageResources.logo,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: SearchPizzaWidget(
                            onChanged: (value) {
                              context.read<HomeCubit>().changeFilterPizzaList(
                                    title: value,
                                  );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (bloc.state.responseResult.responseStatus ==
                  ResponseStatus.loading ||
              bloc.state.responseResult.responseStatus == ResponseStatus.error)
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  if (bloc.state.responseResult.responseStatus ==
                      ResponseStatus.loading)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  if (bloc.state.responseResult.responseStatus ==
                      ResponseStatus.error)
                    Text(
                      bloc.state.responseResult.message,
                      style: AppTextStyle.titleItemStyle,
                    ),
                ],
              ),
            ),
          if (bloc.state.responseResult.responseStatus ==
                  ResponseStatus.success &&
              bloc.state.searchpizzaList.isEmpty)
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "No existe ese producto..",
                    style: AppTextStyle.titleItemStyle,
                  ),
                ],
              ),
            ),
          if (bloc.state.responseResult.responseStatus ==
                  ResponseStatus.success &&
              bloc.state.pizzaList.isNotEmpty)
            SliverList.builder(
              itemCount: bloc.state.searchpizzaList.length,
              itemBuilder: (context, index) {
                final pizzaEntity = bloc.state.searchpizzaList[index];
                return Padding(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: CardItemPizzaWidget(
                    pizzaEntity: pizzaEntity,
                    onTap: (value) {
                      handleModalDetailPizza(
                        context: context,
                        pizzaEntity: pizzaEntity,
                      );
                    },
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class HeaderSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double maxExtentHeader;
  final double minExtentHeader;
  final Widget Function(double value) builder;

  HeaderSliverPersistentHeaderDelegate({
    required this.maxExtentHeader,
    required this.minExtentHeader,
    required this.builder,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return builder(
      shrinkOffset / maxExtentHeader,
    );
  }

  @override
  double get maxExtent => maxExtentHeader;

  @override
  double get minExtent => minExtentHeader;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
