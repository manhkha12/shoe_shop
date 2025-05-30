import 'package:shoe_store/features/cart/cubit/cart_cubit.dart';
import 'package:shoe_store/features/order/cubit/order_cubit.dart';
import 'package:shoe_store/shared/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:shoe_store/shared/cubits/app_cubit/app_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shoe_store/shared/cubits/login_cubit/login_cubit.dart';
import 'package:shoe_store/shared/cubits/product_cubit/product_cubit.dart';
import 'package:shoe_store/shared/cubits/product_detail_cubit/product_detail_cubit.dart';
import 'package:shoe_store/shared/cubits/review_cubit/review_cubit.dart';
import 'package:shoe_store/shared/cubits/search_cubit/search_cubit.dart';
import 'package:shoe_store/shared/cubits/signup_cubit/signup_cubit.dart';
import 'package:shoe_store/shared/enums/order.dart';

Future<void> registerCubitModules(GetIt getIt) async {
  // register cubit modules
  getIt
    ..registerLazySingleton(() => AppCubit(authRepository: getIt()))
    ..registerFactory(
      () => ProductCubit(productRepository: getIt()),
    )
    ..registerFactory(
      () => SearchCubit(searchProductRepository: getIt()),
    )
    ..registerFactory(() => SignupCubit(userRepository: getIt()))
    ..registerFactory(
        () => LoginCubit(userRepository: getIt(), appCubit: getIt()))
    ..registerFactory(() => ReviewCubit(reviewRepository: getIt()))
    ..registerFactory(() => CartCubit(cartRepository: getIt()))
    ..registerFactory(() => AddToCartCubit(cartRepository: getIt()))
    ..registerFactory(() => OrderCubit(orderRepository: getIt()))
    ..registerFactory(
      () => ProductDetailCubit(productDetailRepository: getIt()),
    );
}
