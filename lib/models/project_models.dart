//Hastag class
import 'package:tech_blog/gen/assets.gen.dart';

//pooster Data
Map fakePosterData = {
  "imageAsset": Assets.images.programming.path,
  "writerName": "ملیکا عزیزی",
  "totalViews": "256",
  "articleName": "دوازده قدم برنامه نویسی که ...",
  "date": "چند روز پیش",
};

class HastagModel {
  late String title;
  late int inde;

  HastagModel({
    required this.title,
  });
}

//hashtags Model
List<HastagModel> hastagList = [
  HastagModel(title: "جاوا"),
  HastagModel(title: "کاتلین"),
  HastagModel(title: "وب"),
  HastagModel(title: "هوش مصنوعی"),
  HastagModel(title: "دارت"),
  HastagModel(title: "IOT"),
];

class BlogModels {
  late String id;
  late String imageUrl;
  late String title;
  late String writer;
  late String writerImageUrl;
  late String date;
  late String content;
  late String views;
  BlogModels({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.writer,
    required this.writerImageUrl,
    required this.date,
    required this.content,
    required this.views,
  });
}

List<BlogModels> blogList = [
  BlogModels(
      id: '1',
      imageUrl:
          "https://blockchain.oodles.io/wp-content/uploads/Solidity-Development-2.jpg",
      title: 'سالیدیتی چیست : معرفی زبان معروف سالیدیتی',
      writer: 'ملیکا عزیزی',
      writerImageUrl: '',
      date: '2 روز پیش',
      content:
          'چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.',
      views: '250'),
  BlogModels(
      id: '1',
      imageUrl:
          "https://randomwordgenerator.com/img/picture-generator/52e4d1424f5aa914f1dc8460962e33791c3ad6e04e5074417d2e72d2954ac5_640.jpg",
      title: 'سالیدیتی چیست : معرفی زبان معروف سالیدیتی',
      writer: 'فاطمه امیری',
      writerImageUrl: '',
      date: '2 روز پیش',
      content:
          'چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.',
      views: '190'),
  BlogModels(
      id: '1',
      imageUrl:
          "https://dajan.ir/wp-content/uploads/2024/01/ax-kartoni-bamazeh-11.jpg",
      title: 'سالیدیتی چیست : معرفی زبان معروف سالیدیتی',
      writer: 'مسعود زارع پور',
      writerImageUrl: '',
      date: '2 روز پیش',
      content:
          'چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.',
      views: '250'),
  BlogModels(
      id: '1',
      imageUrl: "https://ana.ir/files/fa/news/1402/9/29/411517_717.png",
      title: 'سالیدیتی چیست : معرفی زبان معروف سالیدیتی',
      writer: 'محمد امینی',
      writerImageUrl: '',
      date: '2 روز پیش',
      content:
          'چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.',
      views: '250'),
  BlogModels(
      id: '1',
      imageUrl:
          "https://dorpic.ir/wp-content/uploads/2021/12/%D8%AA%D8%B5%D9%88%DB%8C%D8%B1-%D8%B2%D9%85%DB%8C%D9%86%D9%87-%D9%BE%D8%B1%D9%88%D9%81%D8%A7%DB%8C%D9%84-%D8%AA%DA%A9%D9%86%D9%88%D9%84%D9%88%DA%98%DB%8C.webp",
      title: 'سالیدیتی چیست : معرفی زبان معروف سالیدیتی',
      writer: 'علی رسولی',
      writerImageUrl: '',
      date: '2 روز پیش',
      content:
          'چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.',
      views: '250'),
];

//podcasts model
class PodcastModel {
  late String id;
  late String imageUrl;
  late String title;
  PodcastModel({
    required this.id,
    required this.imageUrl,
    required this.title,
  });
}

List<PodcastModel> podcastList = [
  PodcastModel(
    id: '1',
    imageUrl:
        "https://dorpic.ir/wp-content/uploads/2021/12/%D8%AA%D8%B5%D9%88%DB%8C%D8%B1-%D8%B2%D9%85%DB%8C%D9%86%D9%87-%D9%BE%D8%B1%D9%88%D9%81%D8%A7%DB%8C%D9%84-%D8%AA%DA%A9%D9%86%D9%88%D9%84%D9%88%DA%98%DB%8C.webp",
    title: 'رادیو کدیاد',
  ),
  PodcastModel(
    id: '1',
    imageUrl: "https://ana.ir/files/fa/news/1402/9/29/411517_717.png",
    title: 'رموز',
  ),
  PodcastModel(
      id: '1',
      imageUrl:
          "https://dajan.ir/wp-content/uploads/2024/01/ax-kartoni-bamazeh-11.jpg",
      title: 'ورزش روزانه'),
  PodcastModel(
    id: '1',
    imageUrl: "https://img9.irna.ir/d/r2/2020/04/22/4/157085636.jpg",
    title: 'رادیو جادی',
  ),
  PodcastModel(
    id: '1',
    imageUrl: "https://img9.irna.ir/d/r2/2020/04/22/4/157085636.jpg",
    title: 'مهمان سرا',
  ),
  PodcastModel(
    id: '1',
    imageUrl:
        "https://blockchain.oodles.io/wp-content/uploads/Solidity-Development-2.jpg",
    title: 'صلوات شمار',
  ),
];
