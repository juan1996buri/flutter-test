import 'package:app_food/features/app/data/datasources/pizza_repository_impl.dart';
import 'package:app_food/features/app/domain/usecases/api_pizza_use_case.dart';
import 'package:app_food/features/app/presentation/screen/home/cubit/home_cubit.dart';
import 'package:app_food/features/app/presentation/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        //repository
        RepositoryProvider(
          create: (context) => PizzaRepositoryImpl(),
        ),
        // use case
        RepositoryProvider(
          create: (context) => ApiPizzaUseCase(
            context.read<PizzaRepositoryImpl>(),
          ),
        ),
        //bloc
        BlocProvider(
          create: (context) => HomeCubit(
            context.read<ApiPizzaUseCase>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const HomeScreen(),
      ),
    );
  }
}
