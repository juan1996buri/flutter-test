import 'package:app_food/features/app/domain/responses/reponse_result.dart';
import 'package:equatable/equatable.dart';

import 'package:app_food/features/app/domain/entities/pizza_entity.dart';

class ResponsePizza extends Equatable {
  final ResponseResult responseResult;
  final List<PizzaEntity>? pizzaList;

  const ResponsePizza({
    required this.responseResult,
    this.pizzaList,
  });

  @override
  List<Object?> get props => [responseResult, pizzaList];
}
