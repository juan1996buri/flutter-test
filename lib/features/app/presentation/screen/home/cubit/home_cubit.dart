import 'package:app_food/common/enums.dart';
import 'package:app_food/features/app/domain/entities/pizza_entity.dart';
import 'package:app_food/features/app/domain/responses/reponse_result.dart';
import 'package:app_food/features/app/domain/usecases/api_pizza_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._apiPizzaUseCase)
      : super(
          HomeState(
              responseResult: ResponseResult(
                responseStatus: ResponseStatus.off,
                message: "",
              ),
              pizzaList: const [],
              searchpizzaList: const []),
        );

  final ApiPizzaUseCase _apiPizzaUseCase;

  Future<void> findAllPizza() async {
    final newState = state.copyWith(
      responseResult: ResponseResult(
        responseStatus: ResponseStatus.loading,
        message: "",
      ),
    );
    emit(
      HomeState(
        responseResult: newState.responseResult,
        pizzaList: const [],
        searchpizzaList: const [],
      ),
    );
    final response = await _apiPizzaUseCase.findAllPizza();
    response.either((error) {
      final newState = state.copyWith(
        responseResult: error,
      );
      emit(
        HomeState(
          pizzaList: newState.pizzaList,
          searchpizzaList: newState.pizzaList,
          responseResult: newState.responseResult,
        ),
      );
    }, (success) {
      final newState = state.copyWith(
        pizzaList: success.pizzaList,
        responseResult: success.responseResult,
      );
      emit(
        HomeState(
          pizzaList: newState.pizzaList,
          searchpizzaList: newState.pizzaList,
          responseResult: newState.responseResult,
        ),
      );
    });
  }

  void changeFilterPizzaList({required String title}) {
    List<PizzaEntity> auxyPizzaList = state.pizzaList;

    final newList = auxyPizzaList.where((item) {
      return item.name!.toLowerCase().contains(title.trim().toLowerCase());
    }).toList();
    final newState = state.copyWith(
      searchpizzaList: newList,
    );

    emit(
      HomeState(
        searchpizzaList: newState.searchpizzaList,
        pizzaList: newState.pizzaList,
        responseResult: newState.responseResult,
      ),
    );
  }
}
