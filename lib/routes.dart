import 'package:get_it/get_it.dart';
import 'package:shoe_store/features/admin_dasbroad_screen.dart';
import 'package:shoe_store/features/cart/cart_detail.dart';
import 'package:shoe_store/features/cart/cubit/cart_cubit.dart';
import 'package:shoe_store/features/home_page/home_page_screen.dart';
import 'package:shoe_store/features/intro/intro_screen.dart';
import 'package:shoe_store/features/intro/story_book.dart';
import 'package:shoe_store/features/login/login_screen.dart';

import 'package:shoe_store/features/main_screen.dart';
import 'package:shoe_store/features/order/cubit/order_cubit.dart';
import 'package:shoe_store/features/order/oder_screen.dart';
import 'package:shoe_store/features/peoduct_detail/product_detail.dart';
import 'package:shoe_store/features/search_reasults/search_results.dart';
import 'package:shoe_store/features/setting/component/user_update_info.dart';
import 'package:shoe_store/features/setting/setting_page_screen.dart';
import 'package:shoe_store/features/signup/sign_up_screen.dart';
import 'package:shoe_store/shared/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe_store/shared/cubits/product_cubit/product_cubit.dart';
import 'package:shoe_store/shared/cubits/product_detail_cubit/product_detail_cubit.dart';
import 'package:shoe_store/shared/cubits/review_cubit/review_cubit.dart';
import 'package:shoe_store/shared/cubits/search_cubit/search_cubit.dart';
import 'package:shoe_store/shared/cubits/signup_cubit/signup_cubit.dart';
import 'package:shoe_store/shared/models/cart_item.dart';
import 'package:shoe_store/shared/models/product.dart';

import 'features/intro/splash_screen.dart';

class RouteName {
  static const String splash = '/';
  static const String storyBook = '/story-book';
  static const String intro = '/intro';
  static const String main = '/main';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String setting = '/setting';
  static const String productDetail = '/product_detail';
  static const String searchResults = '/search_results';
  static const String userUpdateInfo = '/user_update_info';
  static const String cartDetail = '/cart_detail';
  static const String adminDashboard = '/adminDashboard';
  static const String orderScreen = '/order_screen';
  static const String homePage = '/home_page';
  // static const String mainTuLam ='/mainTuLam';
}

RouteFactory onGenerateRoutes() {
  return (RouteSettings settings) {
    if (settings.name == RouteName.splash) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SplashScreen(),
      );
    }
    if (settings.name == RouteName.storyBook) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const StoryBookScreen(),
      );
    }

    if (settings.name == RouteName.orderScreen) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) =>  BlocProvider(
          create: (context) => GetIt.I<OrderCubit>(),
          child: OrderScreen(
            selectedItems: settings.arguments as List<CartItem>,
          ),
        ),
      );
    }

    if (settings.name == RouteName.cartDetail) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BlocProvider(
          create: (_) => GetIt.I<CartCubit>(),
          child: const CartDetail(),
        ),
      );
    }
    if (settings.name == RouteName.intro) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const IntroScreen(),
      );
    }
    if (settings.name == RouteName.main) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => GetIt.I<ProductCubit>()),
            BlocProvider(create: (_) => GetIt.I<SearchCubit>()),
            BlocProvider(create: (_)=>GetIt.I<OrderCubit>()),
            // nếu có thêm cubit nào khác MainScreen cần thì add ở đây
          ],
          child: MainScreen(),
        ),
      );
    }
    if (settings.name == RouteName.productDetail) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => GetIt.I<ProductDetailCubit>()),
            BlocProvider(create: (_) => GetIt.I<ReviewCubit>()),
            BlocProvider(create: (_) => GetIt.I<CartCubit>()),
            // nếu có thêm cubit nào khác MainScreen cần thì add ở đây
          ],
          child: ProductDetail(product: settings.arguments as Product),
        ),
      );
    }
    if (settings.name == RouteName.searchResults) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BlocProvider(
          create: (_) => GetIt.I<SearchCubit>(),
          child: SearchResultsScreen(
            searchResults: settings.arguments as List<Product>,
          ),
        ),
      );
    }
    if (settings.name == RouteName.setting) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => SettingScreen(),
      );
    }

    if (settings.name == RouteName.userUpdateInfo) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const UserUpdateInfo(),
      );
    }

    if (settings.name == RouteName.homePage) {
      return MaterialPageRoute(
          settings: settings,
          builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => GetIt.I<ProductCubit>()),
                  BlocProvider(
                      create: (_) =>
                          GetIt.I<SearchCubit>()), // 👈 Thêm dòng này
                ],
                child: HomePageScreen(),
              ));
    }

    if (settings.name == RouteName.adminDashboard) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const AdminDashboardScreen(),
      );
    }
    // if (settings.name == RouteName.mainTuLam) {
    //   return MaterialPageRoute(
    //     settings: settings,
    //     builder: (context) => const HomePageTuLam(),
    //   );
    // }

    if (settings.name == RouteName.login) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BlocProvider(
          create: (_) => GetIt.I<LoginCubit>(),
          child: const LoginScreen(),
        ),
      );
    }

    if (settings.name == RouteName.signup) {
      return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
                create: (context) => GetIt.I<SignupCubit>(),
                child: const SignUpScreen(),
              ));
    }

    return MaterialPageRoute(
      builder: (_) => Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Text('No route found: ${settings.name}'),
        ),
      ),
    );
  };
}
