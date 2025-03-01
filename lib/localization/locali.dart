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
          'signupTitle': 'Let’s create your account',
          'forgetPasswordTitle': 'Forget password',
          'forgetPasswordSubTitle':
              'Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
          'changeYourPasswordTitle': 'Password Reset Email Sent',
          'changeYourPasswordSubTitle':
              'Your Account Security is Our Priority! We\'ve Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.',
          'confirmEmail': 'Verify your email address!',
          'confirmEmailSubTitle':
              'Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.',
          'emailNotReceivedMessage':
              'Didn’t get the email? Check your junk/spam or resend it.',
          'yourAccountCreatedTitle': 'Your account successfully created!',
          'yourAccountCreatedSubTitle':
              'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!',
          // Product
          'popularProducts': 'Popular Products',
          'specialProducts': 'Special Products',
          'categories': 'Categories',
          // Home
          'homeAppbarTitle': 'Good day for shopping',
          'homeAppbarSubTitle': 'Taimoor Sikander',
          'homeSearchHint': 'Search for your favorite product',

          // Product Names
          'product1_name': 'Classic Vanilla Cake',
          'product2_name': 'Classic Chocolate Cake',
          'product3_name': 'Carrot Cake',
          'product4_name': 'Lemon Cake',
          'product5_name': 'Salted Caramel Cake',
          'product6_name': 'Cheesecake with Berries',
          'product7_name': 'Coffee Cake',
          'product8_name': 'Chocolate Mint Cake',
          'product9_name': 'Fresh Fruit Cake',
          'product10_name': 'Black Forest Cake',
          'product11_name': 'Kunafa with Cream',
          'product12_name': 'Pistachio Baklava',
          'product13_name': 'Nut Katayef',
          'product14_name': 'Coconut Basbousa',
          'product15_name': 'Um Ali',
          'product16_name': 'Pistachio Muhalabia',
          'product17_name': 'Zalabia',
          'product18_name': 'Ghraybeh',
          'product19_name': 'Nabulsi Kunafa',
          'product20_name': 'Date Maamoul',
          'product21_name': 'Italian Tiramisu',
          'product22_name': 'Chocolate Cupcakes',
          'product23_name': 'Apple Pie',
          'product24_name': 'Chocolate Loaf Cake',
          'product25_name': 'Banana Cake with Walnuts',
          'product26_name': 'Vanilla Caramel Cake',
          'product27_name': 'Chocolate Donuts',
          'product28_name': 'Vanilla Donuts',
          'product29_name': 'Salted Caramel Donuts',
          'product30_name': 'Strawberry Donuts',
          'product31_name': 'Banana Donuts',
          'product32_name': 'Coffee Donuts',
          'product33_name': 'Pistachio Donuts',
          'product34_name': 'Lotus Donuts',
          'product35_name': 'White Chocolate Donuts',
          'product36_name': 'Chocolate Cookies',
          'product37_name': 'Butter Cookies',
          'product38_name': 'Vanilla Cookies',
          'product39_name': 'Mint Chocolate Cookies',
          'product40_name': 'Walnut Cookies',
          'product41_name': 'Salted Caramel Cookies',
          'product42_name': 'White Chocolate Raspberry Cookies',
          'product43_name': 'Almond Cookies',
          'product44_name': 'Coconut Cookies',
          'product45_name': 'Coffee Cookies',
          'product46_name': 'Sugar-Free Chocolate Cake',
          'product47_name': 'Oatmeal Honey Cookies',
          'product48_name': 'Vegan Blueberry Cheesecake',
          'product49_name': 'Blueberry Parfait',
          'product50_name': 'Date Nut Balls',
          'product51_name': 'Gluten-Free Carrot Cake',
          'product52_name': 'Flourless Chocolate Cookies',
          'product53_name': 'Chia Pudding',
          'product54_name': 'Oatmeal Banana Cake',
          'product55_name': 'Chocolate Protein Balls',

          // Product Descriptions
          'product1_description':
              'Soft and smooth vanilla cake with delicious light buttercream.',
          'product2_description':
              'Rich and soft chocolate cake with hot chocolate sauce.',
          'product3_description':
              'Delicious carrot cake with coconut and cream cheese.',
          'product4_description':
              'Refreshing lemon cake with a lemon sugar glaze.',
          'product5_description':
              'Caramel cake with a layer of salted caramel.',
          'product6_description':
              'Creamy cheesecake with a layer of fresh berries.',
          'product7_description': 'Coffee cake with a layer of mocha.',
          'product8_description':
              'Chocolate cake with a refreshing mint flavor.',
          'product9_description': 'Fresh fruit cake with light cream.',
          'product10_description':
              'Chocolate cake with a layer of black cherries.',
          'product11_description': 'Crispy kunafa stuffed with fresh cream.',
          'product12_description':
              'Baklava stuffed with pistachios and covered with syrup.',
          'product13_description': 'Katayef stuffed with nuts and fried.',
          'product14_description':
              'Soft basbousa with coconut and delicious syrup.',
          'product15_description': 'Um Ali with cream, nuts, and raisins.',
          'product16_description':
              'Creamy muhalabia with a layer of pistachios.',
          'product17_description':
              'Crispy on the outside and soft on the inside, served with syrup or honey.',
          'product18_description':
              'Soft and crunchy ghraybeh made from semolina.',
          'product19_description': 'Crispy Nabulsi kunafa with cheese.',
          'product20_description':
              'Maamoul stuffed with dates and covered with powdered sugar.',
          'product21_description': 'Classic tiramisu with coffee and cocoa.',
          'product22_description': 'Chocolate cupcakes with buttercream.',
          'product23_description': 'Apple pie with cinnamon and brown sugar.',
          'product24_description': 'Soft chocolate loaf cake.',
          'product25_description': 'Banana cake with walnut pieces.',
          'product26_description': 'Vanilla cake with a layer of caramel.',
          'product27_description': 'Donuts covered with rich chocolate sauce.',
          'product28_description':
              'Donuts covered with vanilla sauce and sprinkles.',
          'product29_description': 'Donuts covered with salted caramel sauce.',
          'product30_description':
              'Donuts covered with strawberry sauce and cream.',
          'product31_description': 'Banana-flavored donuts with chocolate.',
          'product32_description': 'Coffee-flavored donuts with mocha.',
          'product33_description':
              'Donuts covered with pistachios and chocolate.',
          'product34_description':
              'Donuts covered with lotus sauce and caramel.',
          'product35_description': 'Donuts covered with white chocolate sauce.',
          'product36_description':
              'Soft chocolate cookies with chocolate chips.',
          'product37_description': 'Classic butter cookies with sugar.',
          'product38_description': 'Vanilla cookies with colored sugar.',
          'product39_description': 'Chocolate cookies with a mint flavor.',
          'product40_description': 'Walnut cookies with cinnamon.',
          'product41_description': 'Caramel cookies with sea salt.',
          'product42_description': 'White chocolate cookies with raspberries.',
          'product43_description': 'Almond cookies with chocolate.',
          'product44_description': 'Coconut cookies with chocolate.',
          'product45_description': 'Coffee cookies with chocolate.',
          'product46_description': 'Sugar-free chocolate cake with stevia.',
          'product47_description': 'Oatmeal cookies with natural honey.',
          'product48_description': 'Vegan cheesecake with fresh blueberries.',
          'product49_description': 'Blueberry parfait with Greek yogurt.',
          'product50_description': 'Date balls with nuts and coconut.',
          'product51_description': 'Gluten-free carrot cake.',
          'product52_description': 'Flourless chocolate cookies.',
          'product53_description': 'Chia pudding with fresh fruits.',
          'product54_description': 'Oatmeal cake with banana and honey.',
          'product55_description': 'Protein balls with dark chocolate.',

          // Product Categories
          'bread_category': 'Bread',
          'cake_category': 'Cake',
          'cookies_category': 'Cookies',
          'donut_category': 'Donut',
          'pastry_category': 'Pastry',
          'dessert_category': 'Dessert',

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
          'categories': 'أصناف',

          // Home
          'homeAppbarTitle': 'يوم جيد للتسوق',
          'homeAppbarSubTitle': 'مرحبًا بك',
          'homeSearchHint': 'ابحث عن المنتج المفضل لديك',

          'product1_name': 'الكيكة الفانيليا الكلاسيكية',
          'product2_name': 'كيكة الشوكولاتة الكلاسيكية',
          'product3_name': 'كيكة الجزر',
          'product4_name': 'كيكة الليمون',
          'product5_name': 'كيكة الكراميل المملحة',
          'product6_name': 'كيكة الجبنة بالتوت',
          'product7_name': 'كيكة القهوة',
          'product8_name': 'كيكة الشوكولاتة بالنعناع',
          'product9_name': 'كيكة الفواكه الطازجة',
          'product10_name': 'كيكة الكرز الأسود',
          'product11_name': 'الكنافة بالقشطة',
          'product12_name': 'البقلاوة بالفستق',
          'product13_name': 'القطايف بالمكسرات',
          'product14_name': 'البسبوسة بجوز الهند',
          'product15_name': 'أم علي',
          'product16_name': 'المهلبيّة بالفستق',
          'product17_name': 'اللقيمات',
          'product18_name': 'الغريبة بالسميد',
          'product19_name': 'الكنافة النابلسية',
          'product20_name': 'المعمول بالتمر',
          'product21_name': 'تيراميسو الإيطالي',
          'product22_name': 'كب كيك بالشوكولاتة',
          'product23_name': 'فطيرة التفاح',
          'product24_name': 'كعكة الرغيف بالشوكولاتة',
          'product25_name': 'كعكة الموز مع الجوز',
          'product26_name': 'كعكة الفانيليا مع الكراميل',
          'product27_name': 'دوناتس الشوكولاتة',
          'product28_name': 'دوناتس الفانيليا',
          'product29_name': 'دوناتس الكراميل المملح',
          'product30_name': 'دوناتس الفراولة',
          'product31_name': 'دوناتس الموز',
          'product32_name': 'دوناتس القهوة',
          'product33_name': 'دوناتس الفستق',
          'product34_name': 'دوناتس اللوتس',
          'product35_name': 'دوناتس الشوكولاتة البيضاء',
          'product36_name': 'كوكيز الشوكولاتة',
          'product37_name': 'كوكيز الزبدة',
          'product38_name': 'كوكيز الفانيليا',
          'product39_name': 'كوكيز الشوكولاتة بالنعناع',
          'product40_name': 'كوكيز الجوز',
          'product41_name': 'كوكيز الكراميل المملح',
          'product42_name': 'كوكيز الشوكولاتة البيضاء',
          'product43_name': 'كوكيز اللوز',
          'product44_name': 'كوكيز جوز الهند',
          'product45_name': 'كوكيز القهوة',
          'product46_name': 'كيكة الشوكولاتة الخالية من السكر',
          'product47_name': 'كوكيز الشوفان بالعسل',
          'product48_name': 'تشيز كيك نباتي',
          'product49_name': 'بارفيه التوت',
          'product50_name': 'كرات التمر بالمكسرات',
          'product51_name': 'كيكة الجزر الخالية من الجلوتين',
          'product52_name': 'كوكيز الشوكولاتة الخالية من الدقيق',
          'product53_name': 'بودنغ الشيا',
          'product54_name': 'كعكة الشوفان بالموز',
          'product55_name': 'كرات البروتين بالشوكولاتة',

          // Product Descriptions
          'product1_description':
              'كيكة فانيليا طرية وناعمة، مغطاة بكريمة زبدة لذيذة وخفيفة.',
          'product2_description':
              'كيكة شوكولاتة غنية وطرية، مغطاة بصوص الشوكولاتة الساخن.',
          'product3_description':
              'كيكة جزر لذيذة مع جوز الهند، مغطاة بجبنة الكريمة.',
          'product4_description': 'كيكة ليمون منعشة مع غلاف سكر ليموني.',
          'product5_description': 'كيكة كراميل مع طبقة من الكراميل المملح.',
          'product6_description': 'تشيز كيك كريمي مع طبقة من التوت الطازج.',
          'product7_description': 'كيكة قهوة مع طبقة من الموكا.',
          'product8_description': 'كيكة شوكولاتة مع نكهة النعناع المنعشة.',
          'product9_description': 'كيكة فواكه طازجة مع كريمة خفيفة.',
          'product10_description': 'كيكة شوكولاتة مع طبقة من الكرز الأسود.',
          'product11_description': 'كنافة مقرمشة محشوة بالقشطة الطازجة.',
          'product12_description': 'بقلاوة محشوة بالفستق ومغطاة بالقطر.',
          'product13_description': 'قطايف محشوة بالمكسرات ومقلية.',
          'product14_description': 'بسبوسة ناعمة مع جوز الهند وقطر لذيذ.',
          'product15_description': 'أم علي بالقشطة والمكسرات والزبيب.',
          'product16_description': 'مهلبيّة كريمية مع طبقة من الفستق.',
          'product17_description':
              'لقيمات مقرمشة من الخارج وطرية من الداخل، تقدم مع القطر أو العسل.',
          'product18_description': 'غريبة ناعمة ومقرمشة مصنوعة من السميد.',
          'product19_description': 'كنافة نابلسية مقرمشة مع الجبنة.',
          'product20_description': 'معمول محشو بالتمر ومغطى بالسكر البودرة.',
          'product21_description': 'تيراميسو كلاسيكي مع القهوة والكاكاو.',
          'product22_description': 'كب كيك شوكولاتة مع كريمة زبدة.',
          'product23_description': 'فطيرة تفاح بالقرفة والسكر البني.',
          'product24_description': 'كعكة رغيف شوكولاتة طرية.',
          'product25_description': 'كعكة موز مع قطع الجوز.',
          'product26_description': 'كعكة فانيليا مع طبقة من الكراميل.',
          'product27_description': 'دوناتس مغطاة بصوص الشوكولاتة الغنية.',
          'product28_description': 'دوناتس مغطاة بصوص الفانيليا والسبرينكلز.',
          'product29_description': 'دوناتس مغطاة بصوص الكراميل المملح.',
          'product30_description': 'دوناتس مغطاة بصوص الفراولة والكريمة.',
          'product31_description': 'دوناتس بنكهة الموز مع شوكولاتة.',
          'product32_description': 'دوناتس بنكهة القهوة مع الموكا.',
          'product33_description': 'دوناتس مغطاة بالفستق والشوكولاتة.',
          'product34_description': 'دوناتس مغطاة بصوص اللوتس والكراميل.',
          'product35_description': 'دوناتس مغطاة بصوص الشوكولاتة البيضاء.',
          'product36_description': 'كوكيز شوكولاتة طرية مع قطع شوكولاتة.',
          'product37_description': 'كوكيز زبدة كلاسيكية مع سكر.',
          'product38_description': 'كوكيز فانيليا مع سكر ملون.',
          'product39_description': 'كوكيز شوكولاتة مع نكهة النعناع.',
          'product40_description': 'كوكيز جوز مع القرفة.',
          'product41_description': 'كوكيز كراميل مع ملح البحر.',
          'product42_description': 'كوكيز شوكولاتة بيضاء مع التوت.',
          'product43_description': 'كوكيز لوز مع الشوكولاتة.',
          'product44_description': 'كوكيز جوز الهند مع الشوكولاتة.',
          'product45_description': 'كوكيز قهوة مع الشوكولاتة.',
          'product46_description': 'كيكة شوكولاتة خالية من السكر مع ستيفيا.',
          'product47_description': 'كوكيز شوفان مع العسل الطبيعي.',
          'product48_description': 'تشيز كيك نباتي بالتوت الطازج.',
          'product49_description': 'بارفيه التوت مع الزبادي اليوناني.',
          'product50_description': 'كرات التمر مع المكسرات وجوز الهند.',
          'product51_description': 'كيكة جزر خالية من الجلوتين.',
          'product52_description': 'كوكيز شوكولاتة خالية من الدقيق.',
          'product53_description': 'بودنغ الشيا مع الفواكه الطازجة.',
          'product54_description': 'كعكة شوفان مع الموز والعسل.',
          'product55_description': 'كرات بروتين مع الشوكولاتة الداكنة.',

          // Product Categories
          'bread_category': 'خبز',
          'cake_category': 'كيك',
          'cookies_category': 'بسكويت',
          'donut_category': 'دونات',
          'pastry_category': 'معجنات',
          'dessert_category': 'حلويات',
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
