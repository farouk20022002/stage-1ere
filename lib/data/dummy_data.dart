import 'package:fro9/features/shop/models/banner_model.dart';
import 'package:fro9/features/shop/models/category_model.dart';
import 'package:fro9/routes/routes.dart';
import 'package:fro9/utils/constants/image_strings.dart';

class TDummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: 'Jewelery',
        image: TImages.jeweleryIcon,
        isFeatured: true),
    CategoryModel(
        id: '8',
        name: 'Sport Shoes',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '9',
        name: 'Track suits',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '10',
        name: 'Sports equipements',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '11',
        name: 'Bedroom furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '12',
        name: 'Kitchen furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '13',
        name: 'Office furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '14',
        name: 'Laptop',
        image: TImages.electronicsIcon,
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '15',
        name: 'Mobile',
        image: TImages.electronicsIcon,
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '16',
        name: 'Shirts',
        image: TImages.clothIcon,
        isFeatured: false,
        parentId: '3'),
  ];

  static final List<BannerModel> banners = [
    BannerModel(
        targetScreen: TRoutes.order, active: false, imageUrl: TImages.banner1),
    BannerModel(
        targetScreen: TRoutes.cart, active: true, imageUrl: TImages.banner2),
    BannerModel(
        targetScreen: TRoutes.favourites,
        active: true,
        imageUrl: TImages.banner3),
    BannerModel(
        targetScreen: TRoutes.search, active: true, imageUrl: TImages.banner4),
    BannerModel(
        targetScreen: TRoutes.settings,
        active: true,
        imageUrl: TImages.banner5),
    BannerModel(
        targetScreen: TRoutes.userAddress,
        active: true,
        imageUrl: TImages.banner6),
    BannerModel(
        targetScreen: TRoutes.checkout,
        active: false,
        imageUrl: TImages.banner8),
  ];
}
