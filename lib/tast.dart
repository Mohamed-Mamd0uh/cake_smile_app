import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/bakery/models/product_model.dart';
import 'tast2.dart';
import 'tast3.dart';
// import 'utils/dummy_data/dummy_data.dart';
import 'package:cake_and_smile/features/bakery/controllers/product_detail_controller.dart';

class Tast extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      'name': 'كيكات',
      'image': 'assets/images/catgorey_images/Cakes.jpg',
      'description': 'استمتع بتشكيلة واسعة من الكيكات الطازجة.',
    },
    {
      'name': 'حلويات شرقية',
      'image': 'assets/images/catgorey_images/OrientalDesserts.jpg',
      'description': 'اكتشف مذاق الحلويات الشرقية الأصيلة.',
    },
    {
      'name': 'حلويات غربية',
      'image': 'assets/images/catgorey_images/WesternDesserts.jpg',
      'description': 'تذوق أفضل الحلويات الغربية.',
    },
    {
      'name': 'دوناتس',
      'image': 'assets/images/catgorey_images/Donuts.jpg',
      'description': 'دوناتس طازجة ولذيذة!',
    },
    {
      'name': 'بسكويت وكوكيز',
      'image': 'assets/images/catgorey_images/Biscuits&Cookies.jpg',
      'description': 'بسكويت وكوكيز مقرمشة ولذيذة.',
    },
    {
      'name': 'حلويات صحية',
      'image': 'assets/images/catgorey_images/HealthyDesserts.jpg',
      'description': 'حلويات لذيذة وصحية!',
    },
  ];
  Tast({super.key});

  @override
  Widget build(BuildContext context) {
    final products = initializeDummyData();
    // Get.put(ProductDetailController(products[0]));
    return Scaffold(
      appBar: AppBar(
        title: Text('فئات الحلويات'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // Get.to(() => ProductPage());
              // Get.toNamed('/product', arguments: products[0]);
            },
            child: Text('Go to Product Details')),
      ),
      // body: ListView.builder(
      //   itemCount: categories.length,
      //   itemBuilder: (context, index) {
      //     return CategoryCard(
      //       name: categories[index]['name']!,
      //       image: categories[index]['image']!,
      //       description: categories[index]['description']!,
      //     );
      //   },
      // ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  const CategoryCard(
      {super.key,
      required this.name,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => Tast2(
        //       products: initializeDummyData(),
        //     ));
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 
//   List<Product> initializeDummyData() {
//     return [
//       // Cake Products

//       Product(
//         id: 'cake_001',
//         name: 'الكيكة الفانيليا الكلاسيكية',
//         description:
//             'كيكة فانيليا طرية وناعمة، مغطاة بكريمة زبدة لذيذة وخفيفة.',
//         price: 25.00,
//         category: 'cakes_category',
//         imageUrl: 'assets/images/products/cakes/vanilla_cake.jpg',
//       ),
//       Product(
//         id: 'cake_002',
//         name: 'كيكة الشوكولاتة الكلاسيكية',
//         description: 'كيكة شوكولاتة غنية وطرية، مغطاة بصوص الشوكولاتة الساخن.',
//         price: 30.00,
//         category: 'cakes_category',
//         imageUrl: 'assets/images/products/cakes/chocolate_cake.jpg',
//       ),
//       Product(
//         id: 'cake_003',
//         name: 'كيكة الجزر',
//         description: 'كيكة جزر لذيذة مع جوز الهند، مغطاة بجبنة الكريمة.',
//         price: 28.00,
//         category: 'cakes_category',
//         imageUrl: 'assets/images/products/cakes/carrot_cake_1.jpg',
//       ),
//       Product(
//         id: 'cake_004',
//         name: 'كيكة الليمون',
//         description: 'كيكة ليمون منعشة مع غلاف سكر ليموني.',
//         price: 22.00,
//         category: 'cakes_category',
//         imageUrl: 'assets/images/products/cakes/lemon_cake.jpg',
//       ),
//       Product(
//         id: 'cake_005',
//         name: 'كيكة الكراميل المملحة',
//         description: 'كيكة كراميل مع طبقة من الكراميل المملح.',
//         price: 32.00,
//         category: 'cakes_category',
//         imageUrl: 'assets/images/products/cakes/salted_caramel_cake.jpg',
//       ),
//       Product(
//         id: 'cake_006',
//         name: 'كيكة الجبنة بالتوت',
//         description: 'تشيز كيك كريمي مع طبقة من التوت الطازج.',
//         price: 35.00,
//         category: 'cakes_category',
//         imageUrl: 'assets/images/products/cakes/cheesecake_berries.jpg',
//       ),
//       Product(
//         id: 'cake_007',
//         name: 'كيكة القهوة',
//         description: 'كيكة قهوة مع طبقة من الموكا.',
//         price: 27.00,
//         category: 'cakes_category',
//         imageUrl: 'assets/images/products/cakes/coffee_cake_1.jpg',
//       ),
//       Product(
//         id: 'cake_008',
//         name: 'كيكة الشوكولاتة بالنعناع',
//         description: 'كيكة شوكولاتة مع نكهة النعناع المنعشة.',
//         price: 29.00,
//         category: 'cakes_category',
//         imageUrl: 'assets/images/products/cakes/chocolate_mint_cake.jpg',
//       ),
//       Product(
//         id: 'cake_009',
//         name: 'كيكة الفواكه الطازجة',
//         description: 'كيكة فواكه طازجة مع كريمة خفيفة.',
//         price: 26.00,
//         category: 'cakes_category',
//         imageUrl: 'assets/images/products/cakes/fresh_fruit_cake.jpg',
//       ),
//       Product(
//         id: 'cake_010',
//         name: 'كيكة الكرز الأسود',
//         description: 'كيكة شوكولاتة مع طبقة من الكرز الأسود.',
//         price: 31.00,
//         category: 'cakes_category',
//         imageUrl: 'assets/images/products/cakes/black_forest_cake.jpg',
//       ),
//       //========================//

//       // Oriental Desserts
//       Product(
//         id: 'oriental_001',
//         name: 'الكنافة بالقشطة',
//         description: 'كنافة مقرمشة محشوة بالقشطة الطازجة.',
//         price: 20.00,
//         category: 'oriental_category',
//         imageUrl: 'assets/images/products/oriental/kunafa_cream.jpg',
//       ),
//       Product(
//         id: 'oriental_002',
//         name: 'البقلاوة بالفستق',
//         description: 'بقلاوة محشوة بالفستق ومغطاة بالقطر.',
//         price: 18.00,
//         category: 'oriental_category',
//         imageUrl: 'assets/images/products/oriental/baklava_pistachio.jpg',
//       ),
//       Product(
//         id: 'oriental_003',
//         name: 'القطايف بالمكسرات',
//         description: 'قطايف محشوة بالمكسرات ومقلية.',
//         price: 15.00,
//         category: 'oriental_category',
//         imageUrl: 'assets/images/products/oriental/katayef_nuts.jpg',
//       ),
//       Product(
//         id: 'oriental_004',
//         name: 'البسبوسة بجوز الهند',
//         description: 'بسبوسة ناعمة مع جوز الهند وقطر لذيذ.',
//         price: 12.00,
//         category: 'oriental_category',
//         imageUrl: 'assets/images/products/oriental/basbousa.jpg',
//       ),
//       Product(
//         id: 'oriental_005',
//         name: 'أم علي',
//         description: 'أم علي بالقشطة والمكسرات والزبيب.',
//         price: 16.00,
//         category: 'oriental_category',
//         imageUrl: 'assets/images/products/oriental/um_ali.jpg',
//       ),
//       Product(
//         id: 'oriental_006',
//         name: 'المهلبيّة بالفستق',
//         description: 'مهلبيّة كريمية مع طبقة من الفستق.',
//         price: 14.00,
//         category: 'oriental_category',
//         imageUrl: 'assets/images/products/oriental/muhalabia_pistachio.jpg',
//       ),
//       Product(
//         id: 'oriental_007',
//         name: 'اللقيمات',
//         description:
//             'لقيمات مقرمشة من الخارج وطرية من الداخل، تقدم مع القطر أو العسل.',
//         price: 10.00,
//         category: 'oriental_category',
//         imageUrl: 'assets/images/products/oriental/zalabia.jpg',
//       ),
//       Product(
//         id: 'oriental_008',
//         name: 'الغريبة بالسميد',
//         description: 'غريبة ناعمة ومقرمشة مصنوعة من السميد.',
//         price: 8.00,
//         category: 'oriental_category',
//         imageUrl: 'assets/images/products/oriental/ghraybeh.jpg',
//       ),
//       Product(
//         id: 'oriental_009',
//         name: 'الكنافة النابلسية',
//         description: 'كنافة نابلسية مقرمشة مع الجبنة.',
//         price: 22.00,
//         category: 'oriental_category',
//         imageUrl: 'assets/images/products/oriental/kunafa_cream.jpg',
//       ),
//       Product(
//         id: 'oriental_010',
//         name: 'المعمول بالتمر',
//         description: 'معمول محشو بالتمر ومغطى بالسكر البودرة.',
//         price: 12.00,
//         category: 'oriental_category',
//         imageUrl: 'assets/images/products/oriental/maamoul.jpg',
//       ),

//       //========================//
//       // Western Desserts
//       // Product(
//       //   id: 'western_001',
//       //   name: 'تشيز كيك بالتوت',
//       //   description: 'تشيز كيك كريمي مع طبقة من التوت الطازج.',
//       //   price: 35.00,
//       //   category: 'western_category',
//       //   imageUrl: 'assets/images/products/western/cheesecake_berries.jpg',
//       // ),
//       Product(
//         id: 'western_002',
//         name: 'تيراميسو الإيطالي',
//         description: 'تيراميسو كلاسيكي مع القهوة والكاكاو.',
//         price: 28.00,
//         category: 'western_category',
//         imageUrl: 'assets/images/products/western/Italian_tiramisu.jpg',
//       ),
//       Product(
//         id: 'western_003',
//         name: 'كب كيك بالشوكولاتة',
//         description: 'كب كيك شوكولاتة مع كريمة زبدة.',
//         price: 5.00,
//         category: 'western_category',
//         imageUrl: 'assets/images/products/western/chocolate_cupcakes.jpg',
//       ),
//       // Product(
//       //   id: 'western_004',
//       //   name: 'كريب بالفواكه',
//       //   description: 'كريب مع الفواكه الطازجة والكريمة.',
//       //   price: 15.00,
//       //   category: 'western_category',
//       //   imageUrl: 'assets/images/products/western/fruit_crepe.jpg',
//       // ),
//       Product(
//         id: 'western_005',
//         name: 'فطيرة التفاح',
//         description: 'فطيرة تفاح بالقرفة والسكر البني.',
//         price: 22.00,
//         category: 'western_category',
//         imageUrl: 'assets/images/products/western/apple_pie.jpg',
//       ),
//       Product(
//         id: 'western_006',
//         name: 'كعكة الرغيف بالشوكولاتة',
//         description: 'كعكة رغيف شوكولاتة طرية.',
//         price: 18.00,
//         category: 'western_category',
//         imageUrl: 'assets/images/products/western/chocolate_loaf_cake.jpg',
//       ),
//       // Product(
//       //   id: 'western_007',
//       //   name: 'كعكة الجبنة بالفراولة',
//       //   description: 'كعكة جبنة مع طبقة من الفراولة الطازجة.',
//       //   price: 25.00,
//       //   category: 'western_category',
//       //   imageUrl: 'assets/images/products/western/strawberry_cheesecake.jpg',
//       // ),
//       Product(
//         id: 'western_008',
//         name: 'كعكة الموز مع الجوز',
//         description: 'كعكة موز مع قطع الجوز.',
//         price: 20.00,
//         category: 'western_category',
//         imageUrl: 'assets/images/products/western/banana_cake_with_walnuts.jpg',
//       ),
//       Product(
//         id: 'western_009',
//         name: 'كعكة الفانيليا مع الكراميل',
//         description: 'كعكة فانيليا مع طبقة من الكراميل.',
//         price: 24.00,
//         category: 'western_category',
//         imageUrl: 'assets/images/products/western/vanilla_caramel_cake.jpg',
//       ),
//       // Product(
//       //   id: 'western_010',
//       //   name: 'كعكة الشوكولاتة بالنعناع',
//       //   description: 'كعكة شوكولاتة مع نكهة النعناع المنعشة.',
//       //   price: 26.00,
//       //   category: 'western_category',
//       //   imageUrl: 'assets/images/products/western/chocolate_mint_cake.jpg',
//       // ),

//       //==========dounts==============//
//       Product(
//         id: 'donut_001',
//         name: 'دوناتس الشوكولاتة',
//         description: 'دوناتس مغطاة بصوص الشوكولاتة الغنية.',
//         price: 3.00,
//         category: 'donuts_category',
//         imageUrl: 'assets/images/products/donuts/chocolate_donuts.jpg',
//       ),
//       Product(
//         id: 'donut_002',
//         name: 'دوناتس الفانيليا',
//         description: 'دوناتس مغطاة بصوص الفانيليا والسبرينكلز.',
//         price: 3.00,
//         category: 'donuts_category',
//         imageUrl: 'assets/images/products/donuts/vanilla_donuts.jpg',
//       ),
//       Product(
//         id: 'donut_003',
//         name: 'دوناتس الكراميل المملح',
//         description: 'دوناتس مغطاة بصوص الكراميل المملح.',
//         price: 3.50,
//         category: 'donuts_category',
//         imageUrl: 'assets/images/products/donuts/salted_caramel_donuts.jpg',
//       ),
//       Product(
//         id: 'donut_004',
//         name: 'دوناتس الفراولة',
//         description: 'دوناتس مغطاة بصوص الفراولة والكريمة.',
//         price: 3.50,
//         category: 'donuts_category',
//         imageUrl: 'assets/images/products/donuts/strawberry_donuts.jpg',
//       ),
//       Product(
//         id: 'donut_005',
//         name: 'دوناتس الموز',
//         description: 'دوناتس بنكهة الموز مع شوكولاتة.',
//         price: 3.00,
//         category: 'donuts_category',
//         imageUrl: 'assets/images/products/donuts/banana_donuts.jpg',
//       ),
//       Product(
//         id: 'donut_006',
//         name: 'دوناتس القهوة',
//         description: 'دوناتس بنكهة القهوة مع الموكا.',
//         price: 3.50,
//         category: 'donuts_category',
//         imageUrl: 'assets/images/products/donuts/coffee_donuts.jpg',
//       ),
//       // Product(
//       //   id: 'donut_007',
//       //   name: 'دوناتس الجبنة',
//       //   description: 'دوناتس محشوة بجبنة الكريمة.',
//       //   price: 4.00,
//       //   category: 'donuts_category',
//       //   imageUrl: 'assets/images/products/donuts/cheese_donut.jpg',
//       // ),
//       Product(
//         id: 'donut_008',
//         name: 'دوناتس الفستق',
//         description: 'دوناتس مغطاة بالفستق والشوكولاتة.',
//         price: 4.00,
//         category: 'donuts_category',
//         imageUrl: 'assets/images/products/donuts/pistachio_donuts.jpg',
//       ),
//       Product(
//         id: 'donut_009',
//         name: 'دوناتس اللوتس',
//         description: 'دوناتس مغطاة بصوص اللوتس والكراميل.',
//         price: 3.50,
//         category: 'donuts_category',
//         imageUrl: 'assets/images/products/donuts/lotus_donuts_with_caramel.jpg',
//       ),
//       Product(
//         id: 'donut_010',
//         name: 'دوناتس الشوكولاتة البيضاء',
//         description: 'دوناتس مغطاة بصوص الشوكولاتة البيضاء.',
//         price: 3.50,
//         category: 'donuts_category',
//         imageUrl: 'assets/images/products/donuts/white_chocolate_donuts.jpg',
//       ),

//       //==========Biscuits & Cookies==============//

//       Product(
//         id: 'cookie_001',
//         name: 'كوكيز الشوكولاتة',
//         description: 'كوكيز شوكولاتة طرية مع قطع شوكولاتة.',
//         price: 2.00,
//         category: 'cookies_category',
//         imageUrl:
//             'assets/images/products/cookies/oatmeal_chocolate_chip_cookies.jpg',
//       ),
//       Product(
//         id: 'cookie_002',
//         name: 'كوكيز الزبدة',
//         description: 'كوكيز زبدة كلاسيكية مع سكر.',
//         price: 1.50,
//         category: 'cookies_category',
//         imageUrl: 'assets/images/products/cookies/butter_cookies.jpg',
//       ),
//       Product(
//         id: 'cookie_003',
//         name: 'كوكيز الفانيليا',
//         description: 'كوكيز فانيليا مع سكر ملون.',
//         price: 1.50,
//         category: 'cookies_category',
//         imageUrl: 'assets/images/products/cookies/vanilla_sugar_cookies.jpg',
//       ),
//       Product(
//         id: 'cookie_004',
//         name: 'كوكيز الشوكولاتة بالنعناع',
//         description: 'كوكيز شوكولاتة مع نكهة النعناع.',
//         price: 2.00,
//         category: 'cookies_category',
//         imageUrl:
//             'assets/images/products/cookies/mint_chocolate_chip_cookies.jpg',
//       ),
//       Product(
//         id: 'cookie_005',
//         name: 'كوكيز الجوز',
//         description: 'كوكيز جوز مع القرفة.',
//         price: 2.00,
//         category: 'cookies_category',
//         imageUrl: 'assets/images/products/cookies/cinnamon_walnut_cookies.jpg',
//       ),
//       Product(
//         id: 'cookie_006',
//         name: 'كوكيز الكراميل المملح',
//         description: 'كوكيز كراميل مع ملح البحر.',
//         price: 2.50,
//         category: 'cookies_category',
//         imageUrl: 'assets/images/products/cookies/salted_caramel_cookies.jpg',
//       ),
//       Product(
//         id: 'cookie_007',
//         name: 'كوكيز الشوكولاتة البيضاء',
//         description: 'كوكيز شوكولاتة بيضاء مع التوت.',
//         price: 2.00,
//         category: 'cookies_category',
//         imageUrl:
//             'assets/images/products/cookies/white_chocolate_raspberry_cookies.jpg',
//       ),
//       Product(
//         id: 'cookie_008',
//         name: 'كوكيز اللوز',
//         description: 'كوكيز لوز مع الشوكولاتة.',
//         price: 2.00,
//         category: 'cookies_category',
//         imageUrl: 'assets/images/products/cookies/chocolate_almond_cookies.jpg',
//       ),
//       Product(
//         id: 'cookie_009',
//         name: 'كوكيز جوز الهند',
//         description: 'كوكيز جوز الهند مع الشوكولاتة.',
//         price: 2.00,
//         category: 'cookies_category',
//         imageUrl:
//             'assets/images/products/cookies/chocolate_coconut_cookies.jpg',
//       ),
//       Product(
//         id: 'cookie_010',
//         name: 'كوكيز القهوة',
//         description: 'كوكيز قهوة مع الشوكولاتة.',
//         price: 2.50,
//         category: 'cookies_category',
//         imageUrl: 'assets/images/products/cookies/coffee_chocolate_cookies.jpg',
//       ),
// //==========Healthy Desserts==============//

//       Product(
//         id: 'healthy_001',
//         name: 'كيكة الشوكولاتة الخالية من السكر',
//         description: 'كيكة شوكولاتة خالية من السكر مع ستيفيا.',
//         price: 25.00,
//         category: 'healthy_category',
//         imageUrl:
//             'assets/images/products/healthy/sugar_free_chocolate_cake.jpg',
//       ),
//       Product(
//         id: 'healthy_002',
//         name: 'كوكيز الشوفان بالعسل',
//         description: 'كوكيز شوفان مع العسل الطبيعي.',
//         price: 2.50,
//         category: 'healthy_category',
//         imageUrl: 'assets/images/products/healthy/oatmeal_honey_cookies.jpg',
//       ),
//       Product(
//         id: 'healthy_003',
//         name: 'تشيز كيك نباتي',
//         description: 'تشيز كيك نباتي بالتوت الطازج.',
//         price: 30.00,
//         category: 'healthy_category',
//         imageUrl:
//             'assets/images/products/healthy/vegan_blueberry_cheesecake.jpg',
//       ),
//       Product(
//         id: 'healthy_004',
//         name: 'بارفيه التوت',
//         description: 'بارفيه التوت مع الزبادي اليوناني.',
//         price: 15.00,
//         category: 'healthy_category',
//         imageUrl:
//             'assets/images/products/healthy/blueberry_parfait_with_greek_yogurt.jpg',
//       ),
//       Product(
//         id: 'healthy_005',
//         name: 'كرات التمر بالمكسرات',
//         description: 'كرات التمر مع المكسرات وجوز الهند.',
//         price: 10.00,
//         category: 'healthy_category',
//         imageUrl: 'assets/images/products/healthy/date_nut_balls.jpg',
//       ),
//       Product(
//         id: 'healthy_006',
//         name: 'كيكة الجزر الخالية من الجلوتين',
//         description: 'كيكة جزر خالية من الجلوتين.',
//         price: 22.00,
//         category: 'healthy_category',
//         imageUrl: 'assets/images/products/healthy/gluten_free_carrot_cake.jpg',
//       ),
//       Product(
//         id: 'healthy_007',
//         name: 'كوكيز الشوكولاتة الخالية من الدقيق',
//         description: 'كوكيز شوكولاتة خالية من الدقيق.',
//         price: 2.50,
//         category: 'healthy_category',
//         imageUrl:
//             'assets/images/products/healthy/flourless_chocolate_cookies.jpg',
//       ),
//       Product(
//         id: 'healthy_008',
//         name: 'بودنغ الشيا',
//         description: 'بودنغ الشيا مع الفواكه الطازجة.',
//         price: 12.00,
//         category: 'healthy_category',
//         imageUrl: 'assets/images/products/healthy/chia_pudding.jpg',
//       ),
//       Product(
//         id: 'healthy_009',
//         name: 'كعكة الشوفان بالموز',
//         description: 'كعكة شوفان مع الموز والعسل.',
//         price: 18.00,
//         category: 'healthy_category',
//         imageUrl: 'assets/images/products/healthy/oatmeal_banana_cake.jpg',
//       ),
//       Product(
//         id: 'healthy_010',
//         name: 'كرات البروتين بالشوكولاتة',
//         description: 'كرات بروتين مع الشوكولاتة الداكنة.',
//         price: 3.00,
//         category: 'healthy_category',
//         imageUrl: 'assets/images/products/healthy/chocolate_protein_balls.jpg',
//       ),
//     ];
//   }

