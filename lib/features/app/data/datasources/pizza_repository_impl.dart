import 'package:app_food/common/enums.dart';
import 'package:app_food/features/app/data/repositories/pizza_repository.dart';
import 'package:app_food/features/app/domain/entities/pizza_entity.dart';
import 'package:app_food/features/app/domain/responses/reponse_result.dart';
import 'package:app_food/features/app/domain/responses/response_pizza.dart';
import 'package:flutter/services.dart';

class PizzaRepositoryImpl implements PizzaRepository {
  @override
  Future<ResponsePizza> findAll() async {
    await Future.delayed(const Duration(seconds: 3));
    String data = await rootBundle.loadString('assets/pizzas_api.json');
    final response = pizzaEntityFromJson(data);
    return ResponsePizza(
      responseResult: ResponseResult(
        responseStatus: ResponseStatus.success,
        message: "exito",
      ),
      pizzaList: response,
    );
  }
}
