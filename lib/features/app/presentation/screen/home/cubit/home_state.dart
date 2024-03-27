part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.pizzaList,
    required this.responseResult,
    required this.searchpizzaList,
  });
  final List<PizzaEntity> pizzaList;
  final List<PizzaEntity> searchpizzaList;
  final ResponseResult responseResult;

  HomeState copyWith({
    List<PizzaEntity>? pizzaList,
    List<PizzaEntity>? searchpizzaList,
    ResponseResult? responseResult,
  }) {
    return HomeState(
      pizzaList: pizzaList ?? this.pizzaList,
      searchpizzaList: searchpizzaList ?? this.searchpizzaList,
      responseResult: responseResult ?? this.responseResult,
    );
  }

  @override
  List<Object> get props => [pizzaList, searchpizzaList, responseResult];
}
