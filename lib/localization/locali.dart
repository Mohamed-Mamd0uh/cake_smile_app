import 'package:get/get.dart';

class TranslationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // Global Texts
          'and': 'and',
          'skip': 'Skip',
          'next': 'Next',
          'getStarted': 'Get Started',
          'done': 'Done',
          'submit': 'Submit',
          'appName': 'Cake & Smile',
          'tContinue': 'Continue',
          'welcome': 'Welcome',
          'showAll': 'Show All',

          'stock': 'Stock',
          'price': 'Price',
          'description': 'Description',
          'reviews': 'Reviews',
          'weight': 'Weight',
          'Size': 'Size',
          'checkout': 'CheckOut',
          'Small': 'Small',
          'Medium': 'Medium',
          'Large': 'Large',
/*



 */
          //============== Settings ===============
          'account': 'Account',
          'settings': 'Settings',
          'settingsAccount': 'Account Settings',
          'logout': 'Logout',
          'profile': 'Profile',
          'orders': 'Orders',
          'address': 'Address',
          'payment': 'Payment',
          'privacy': 'Privacy',
          'terms': 'Terms',
          'help': 'Help',
          'about': 'About',
          'contact': 'Contact',
          'faq': 'FAQ',
          'security': 'Security',
          'myCart': 'My Cart',
          'bankAccount': 'Bank Account',
          'myCoupons': 'My Coupons',
          'accountPrivacy': 'Account Privacy',
          'appSetting': 'App Setting',
          'notifications': 'Notifications',
          'myOrders': 'My Orders',
          'myAddresses': 'My Addresses',
          'myPayments': 'My Payments',
          'language': 'Language',
          'changeLanguage': 'Change app language',
          'setDeliveryAddress': 'Set shopping delivery address',
          'orderStatus': 'In-progress and completed orders',
          'couponList': 'List of all the discounted coupons',
          'notificationSettings': 'Set any kind of notifications message',
          'dataUsage': 'Manage data usage and connected accounts',
          'navHome': 'Home',
          'navCart': 'Cart',
          'navFavorites': 'Favorites',
          'navAccount': 'Account',
          'cartTitle': 'Shopping Cart',
          'emptyCart': 'Your cart is empty',
          'total': 'Total',
          'size': 'Size',
          'addToCart': 'Add to Cart',
          'paymentSuccessful': 'Payment Successful',
          'orderShipped': 'Your item will be shipped soon!',
          'selectWeight': 'Select Weight',
          'selectQuantity': 'Select Quantity',
          'selectVariation': 'Select Variation',
          'outOfStock': 'Selected product is out of stock.',
          'warning': 'Warning!',
          'productAdded': 'Your product has been added to the cart',
          'favoritesTitle': 'Favorites',
          'emptyFavorites': 'No products in favorites',

          // OnBoarding Texts
          'onBoardingTitle1': 'Welcome to Cake & Smile',
          'onBoardingTitle2': 'Discover Delicious Cakes',
          'onBoardingTitle3': 'Deliver at your door step',

          'onBoardingSubTitle1':
              "Your Gateway to Exceptional Taste Experiences",
          'onBoardingSubTitle2':
              "Indulge in a World of Unique Flavors & Artful Creations",
          'onBoardingSubTitle3': "Freshness Delivered with Care, Right to You",

          'onboardingDescription1':
              "Begin your journey with Cake & Smile, where every bite is a blend of premium quality, freshness, and a wide variety of flavors that turn every occasion into a sweet memory.",
          'onboardingDescription2':
              "Explore our diverse collection of cakes crafted with passion, from classic favorites to innovative designs that satisfy every craving and celebrate every moment.",
          'onboardingDescription3':
              "Enjoy the convenience of our fast and reliable delivery service. Wherever you are, we bring our freshly baked cakes to your door, ensuring every bite is as delightful as if you were in our store.",

          // Authentication Forms
          'firstName': 'First Name',
          'lastName': 'Last Name',
          'email': 'E-Mail',
          'password': 'Password',
          'newPassword': 'New Password',
          'username': 'Username',
          'phoneNo': 'Phone Number',
          'rememberMe': 'Remember Me',
          'forgetPassword': 'Forget Password?',
          'signIn': 'Sign In',
          'signUp': 'Sign Up',
          'createAccount': 'Create Account',
          'orSignInWith': 'or sign in with',
          'orSignUpWith': 'or sign up with',
          'iAgreeTo': 'I agree to',
          'privacyPolicy': 'Privacy Policy',
          'termsOfUse': 'Terms of use',
          'verificationCode': 'Verification Code',
          'resendEmail': 'Resend Email',
          'resendEmailIn': 'Resend email in',
          'alreadyHaveAccount': "Already have an account?",

          // Authentication Headings
          'loginTitle': 'Welcome back,',
          'loginSubTitle':
              'Discover Limitless Choices and Unmatched Convenience.',
          'signupTitle': "Let's create your account",
          'forgetPasswordTitle': 'Forget password',
          'forgetPasswordSubTitle':
            " Don't worry sometimes people can forget too, enter your email and we will send you a password reset link.",
          'changeYourPasswordTitle': 'Password Reset Email Sent',
          'changeYourPasswordSubTitle':
              "Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.",
          'confirmEmail': 'Verify your email address!',
          'confirmEmailSubTitle':
              'Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.',
          'emailNotReceivedMessage':
              "Didn't get the email? Check your junk/spam or resend it.",
          'yourAccountCreatedTitle': 'Your account successfully created!',
          'yourAccountCreatedSubTitle':
              'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!',
          // Product
          'popularProducts': 'Popular Products',
          'specialProducts': 'Special Products',
          'categories': 'Categories',
          'allCategories': 'All Categories',
          // Home
          'homeAppbarTitle': 'Good day for shopping',
          'homeAppbarSubTitle': 'Taimoor Sikander',
          'homeSearchHint': 'Search for your favorite product',

          // Product Names

          // Product Categories
          'cakes': 'Cakes',
          'oriental': 'Oriental',
          'western': 'Western',
          'donuts': 'Donuts',
          'cookies': 'Cookies',
          'healthy': 'Healthy',
          // ========== الفئات الرئيسية ==========
          'cakes_tag': 'Cakes',
          'oriental_tag': 'Oriental Desserts',
          'western_tag': 'Western Desserts',
          'donuts_tag': 'Donuts',
          'cookies_tag': 'Cookies',
          'healthy_tag': 'Healthy Desserts',

          // ========== تاجات الكيكات ==========
          'vanilla_tag': 'Vanilla',
          'chocolate_tag': 'Chocolate',
          'carrot_tag': 'Carrot',
          'lemon_tag': 'Lemon',
          'caramel_tag': 'Caramel',
          'cheesecake_tag': 'Cheesecake',
          'coffee_tag': 'Coffee',
          'mint_tag': 'Mint',
          'fruit_tag': 'Fresh Fruit',
          'cherry_tag': 'Cherry',

          // ========== تاجات الحلويات الشرقية ==========
          'kunafa_tag': 'Kunafa',
          'cream_tag': 'Cream',
          'baklava_tag': 'Baklava',
          'pistachio_tag': 'Pistachio',
          'katayef_tag': 'Katayef',
          'nuts_tag': 'Nuts',
          'basbousa_tag': 'Basbousa',
          'coconut_tag': 'Coconut',
          'um_ali_tag': 'Um Ali',
          'muhalabia_tag': 'Muhalabia',
          'zalabia_tag': 'Zalabia',
          'honey_tag': 'Honey',
          'ghraybeh_tag': 'Ghraybeh',
          'semolina_tag': 'Semolina',
          'maamoul_tag': 'Maamoul',
          'dates_tag': 'Dates',

          // ========== تاجات الحلويات الغربية ==========
          'tiramisu_tag': 'Tiramisu',
          'cupcakes_tag': 'Cupcakes',
          'apple_pie_tag': 'Apple Pie',
          'loaf_cake_tag': 'Loaf Cake',
          'banana_tag': 'Banana',
          'walnuts_tag': 'Walnuts',

          // ========== تاجات الدوناتس ==========
          'strawberry_tag': 'Strawberry',
          'lotus_tag': 'Lotus',
          'white_chocolate_tag': 'White Chocolate',

          // ========== تاجات البسكويت ==========
          'butter_tag': 'Butter',
          'almond_tag': 'Almond',
          'cinnamon_tag': 'Cinnamon',
          'sea_salt_tag': 'Sea Salt',
          'raspberry_tag': 'Raspberry',

          // ========== تاجات الحلويات الصحية ==========
          'sugar_free_tag': 'Sugar-Free',
          'oatmeal_tag': 'Oatmeal',
          'vegan_tag': 'Vegan',
          'parfait_tag': 'Parfait',
          'protein_tag': 'Protein',
          'chia_tag': 'Chia',
          'gluten_free_tag': 'Gluten-Free',
          'flourless_tag': 'Flourless',
        },
        'ar_AR': {
          // Global Texts
          'and': 'و',
          'skip': 'تخطي',
          'next': 'التالي',
          'getStarted': 'ابدأ',
          'done': 'تم',
          'submit': 'إرسال',
          'appName': 'Cake & Smile',
          'tContinue': 'متابعة',
          'welcome': 'مرحباً بك',
          'showAll': 'عرض الكل',
          'stock': 'المخزون',
          'price': 'السعر',
          'description': 'الوصف',
          'reviews': 'التقييمات',
          'weight': 'الوزن',
          'Size': 'الحجم',
          'checkout': 'الدفع',
          'Small': 'صغير',
          'Medium': 'متوسط',
          'Large': 'كبير',

          //============== Settings ===============

          'account': 'حسابي',
          'settings': 'الإعدادات',
          'settingsAccount': 'اعدادات الحساب',

          'logout': 'تسجيل الخروج',
          'profile': 'الملف الشخصي',
          'orders': 'الطلبات',
          'address': 'العناوين',
          'payment': 'الدفع',
          'privacy': 'الخصوصية',
          'terms': 'الشروط',
          'help': 'المساعدة',
          'about': 'عننا',
          'contact': 'اتصل بنا',
          'faq': 'الأسئلة الشائعة',
          'security': 'الامان',
          'myCart': 'السلة',
          'bankAccount': 'الحساب المصرفي',
          'myCoupons': 'الكوبونات',
          'accountPrivacy': 'خصوصية الحساب',
          'appSetting': 'إعدادات التطبيق',
          'notifications': 'الإشعارات',
          'myOrders': 'طلباتي',
          'myAddresses': 'العناوين',
          'myPayments': 'الدفعات',
          'loadData': 'تحميل البيانات',
          'geolocation': 'الجغرافيا',
          'language': 'اللغة',
          'changeLanguage': 'تغيير لغة التطبيق',
          'setDeliveryAddress': 'تعيين عنوان التوصيل للتسوق',
          'orderStatus': 'الطلبات قيد التنفيذ والمكتملة',
          'couponList': 'قائمة جميع الكوبونات المخفضة',
          'notificationSettings': 'تعيين أي نوع من رسائل الإشعارات',
          'dataUsage': 'إدارة استخدام البيانات والحسابات المتصلة',
          'navHome': 'الرئيسية',
          'navCart': 'السلة',
          'navFavorites': 'المفضلة',
          'navAccount': 'حسابي',
          'cartTitle': 'سلة المشتريات',
          'emptyCart': 'سلة المشتريات فارغة',
          'total': 'الإجمالي',
          'size': 'الحجم',
          'addToCart': 'أضف إلى السلة',
          'paymentSuccessful': 'تم الدفع بنجاح',
          'orderShipped': 'سيتم شحن طلبك قريباً!',
          'selectWeight': 'اختر الوزن',
          'selectQuantity': 'اختر الكمية',
          'selectVariation': 'اختر المتغير',
          'outOfStock': 'المنتج المحدد غير متوفر في المخزون.',
          'warning': 'تحذير!',
          'productAdded': 'تمت إضافة منتجك إلى السلة',
          'favoritesTitle': 'المفضلة',
          'emptyFavorites': 'لا توجد منتجات في المفضلة',

          // OnBoarding Texts
          'onBoardingTitle1': 'مرحبًا بكم في Cake & Smile',
          'onBoardingTitle2': 'اكتشف الكعك اللذيذ',
          'onBoardingTitle3': 'التوصيل إلى باب منزلك',

          'onBoardingSubTitle1': "بوابتك لتجارب تذوق استثنائية",
          'onBoardingSubTitle2':
              "انغمس في عالم من النكهات الفريدة والتصميمات الفنية المبتكرة",
          'onBoardingSubTitle3': "نضارة تصل إليك بعناية، حيثما تكون",
          'onboardingDescription1':
              "ابدأ رحلتك مع Cake & Smile، حيث كل قضمة مزيج من الجودة الفائقة والنضارة وتنوع النكهات التي تحوّل كل مناسبة إلى ذكرى حلوة.",
          'onboardingDescription2':
              "اكتشف تشكيلتنا المتنوعة من الكعك المصنوع بشغف، بدءًا من النكهات الكلاسيكية المحبوبة إلى التصاميم المبتكرة التي تلبي كل الرغبات وتخلد كل لحظة.",
          'onboardingDescription3':
              "استمتع براحة خدمة التوصيل السريعة والموثوقة. أينما كنت، نقدم كعكنا الطازج إلى باب منزلك، مع ضمان أن كل قضمة لذيذة كما لو كنت في متجرنا.",

          // Authentication Forms
          'firstName': 'الاسم الأول',
          'lastName': 'اسم العائلة',
          'email': 'البريد الإلكتروني',
          'password': 'كلمة المرور',
          'newPassword': 'كلمة مرور جديدة',
          'username': 'اسم المستخدم',
          'phoneNo': 'رقم الهاتف',
          'rememberMe': 'تذكرني',
          'forgetPassword': 'نسيت كلمة المرور؟',
          'signIn': 'تسجيل الدخول',

          'signUp': 'تسجيل حساب',
          'createAccount': 'إنشاء حساب',
          'orSignInWith': 'أو تسجيل الدخول باستخدام',
          'orSignUpWith': 'أو التسجيل باستخدام',
          'iAgreeTo': 'أوافق على',
          'privacyPolicy': 'سياسة الخصوصية',
          'termsOfUse': 'شروط الاستخدام',
          'verificationCode': 'رمز التحقق',
          'resendEmail': 'إعادة إرسال البريد الإلكتروني',
          'resendEmailIn': 'إعادة إرسال البريد الإلكتروني في',
          'alreadyHaveAccount': "هل لديك حساب بالفعل؟",

          // Authentication Headings
          'loginTitle': 'مرحبًا بعودتك،',
          'loginSubTitle': 'اكتشف خيارات لا حدود لها وراحة غير مسبوقة.',
          'signupTitle': 'دعنا ننشئ حسابك',
          'forgetPasswordTitle': 'نسيت كلمة المرور',
          'forgetPasswordSubTitle':
              'لا تقلق، أحيانًا ينسى الناس أيضًا، أدخل بريدك الإلكتروني وسنرسل لك رابط إعادة تعيين كلمة المرور.',
          'changeYourPasswordTitle':
              'تم إرسال البريد الإلكتروني لإعادة تعيين كلمة المرور',
          'changeYourPasswordSubTitle':
              'أمان حسابك هو أولويتنا! لقد أرسلنا لك رابطًا آمنًا لتغيير كلمة المرور بشكل آمن والحفاظ على حسابك محميًا.',
          'confirmEmail': 'تحقق من عنوان بريدك الإلكتروني!',
          'confirmEmailSubTitle':
              'تهانينا! حسابك في انتظارك: تحقق من بريدك الإلكتروني للبدء في التسوق وتجربة عروض لا مثيل لها.',
          'emailNotReceivedMessage':
              'لم تستلم البريد الإلكتروني؟ تحقق من المجلد غير المرغوب فيه/البريد المزعج أو أعد الإرسال.',
          'yourAccountCreatedTitle': 'تم إنشاء حسابك بنجاح!',
          'yourAccountCreatedSubTitle':
              'مرحبًا بك في وجهة التسوق النهائية: تم إنشاء حسابك، أطلق العنان لمتعة التسوق عبر الإنترنت السلس!',

          // Product
          'popularProducts': 'المنتجات الشائعة',
          'specialProducts': 'منتجاتنا المميزة',
          'categories': 'الفئات',
          'allCategories': 'جميع الفئات',

          // Home
          'homeAppbarTitle': 'يوم جيد للتسوق',
          'homeAppbarSubTitle': 'مرحبًا بك',
          'homeSearchHint': 'ابحث عن المنتج المفضل لديك',

          // Product Categories
          'cakes': 'كيكات',
          'oriental': 'حلويات شرقية',
          'western': 'حلويات غربية',
          'donuts': 'دوناتس',
          'cookies': 'بسكويت',
          'healthy': 'حلويات صحية',
          // ========== الفئات الرئيسية ==========
          'cakes_tag': 'كيكات',
          'oriental_tag': 'حلويات شرقية',
          'western_tag': 'حلويات غربية',
          'donuts_tag': 'دوناتس',
          'cookies_tag': 'بسكويت',
          'healthy_tag': 'حلويات صحية',

          // ========== تاجات الكيكات ==========
          'vanilla_tag': 'فانيليا',
          'chocolate_tag': 'شوكولاتة',
          'carrot_tag': 'جزر',
          'lemon_tag': 'ليمون',
          'caramel_tag': 'كراميل',
          'cheesecake_tag': 'تشيز كيك',
          'coffee_tag': 'قهوة',
          'mint_tag': 'نعناع',
          'fruit_tag': 'فواكه',
          'cherry_tag': 'كرز',

          // ========== تاجات الحلويات الشرقية ==========
          'kunafa_tag': 'كنافة',
          'cream_tag': 'قشطة',
          'baklava_tag': 'بقلاوة',
          'pistachio_tag': 'فستق',
          'katayef_tag': 'قطايف',
          'nuts_tag': 'مكسرات',
          'basbousa_tag': 'بسبوسة',
          'coconut_tag': 'جوز الهند',
          'um_ali_tag': 'أم علي',
          'muhalabia_tag': 'مهلبيّة',
          'zalabia_tag': 'لقيمات',
          'honey_tag': 'عسل',
          'ghraybeh_tag': 'غريبة',
          'semolina_tag': 'سميد',
          'maamoul_tag': 'معمول',
          'dates_tag': 'تمر',

          // ========== تاجات الحلويات الغربية ==========
          'tiramisu_tag': 'تيراميسو',
          'cupcakes_tag': 'كب كيك',
          'apple_pie_tag': 'فطيرة تفاح',
          'loaf_cake_tag': 'كعكة رغيف',
          'banana_tag': 'موز',
          'walnuts_tag': 'جوز',

          // ========== تاجات الدوناتس ==========
          'strawberry_tag': 'فراولة',
          'lotus_tag': 'لوتس',
          'white_chocolate_tag': 'شوكولاتة بيضاء',

          // ========== تاجات البسكويت ==========
          'butter_tag': 'زبدة',
          'almond_tag': 'لوز',
          'cinnamon_tag': 'قرفة',
          'sea_salt_tag': 'ملح بحر',
          'raspberry_tag': 'توت',

          // ========== تاجات الحلويات الصحية ==========
          'sugar_free_tag': 'خالي من السكر',
          'oatmeal_tag': 'شوفان',
          'vegan_tag': 'نباتي',
          'parfait_tag': 'بارفيه',
          'protein_tag': 'بروتين',
          'chia_tag': 'شيا',
          'gluten_free_tag': 'خالي من الجلوتين',
          'flourless_tag': 'خالي من الدقيق',
        },
      };
}
