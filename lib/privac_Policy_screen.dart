import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        centerTitle: true,
        title: Text("Gizlilik Sözleşmesi"),
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade400,
            borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.all(20),
        width: 360,
        height: 500,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Text(
              "IP adresiniz, sizi ve alışveriş sepetinizi tanımak ve açık demografik bilgilerinizin toplanması için kullanılacaktır. Sitemizin müşteri veri tabanına kayıt formunda kullanıcılarımız, İletişim bilgileri (isim, adres, telefon, e-posta adresi vb) gibi istenilen tüm bilgileri belirtmelidir. Bu formda aldığımız İletişim bilgilerini kullanıcılarımızın işlemleri için alan adı Bilgilerinde, acil durumlarda ve faturanızın teslimatında kullanmaktayız. Kullanıcılarımız isteklerine bağlı olarak sistemimizden kayıtlarını sildirebilirler. Alınan finansal bilgiler satın Alınan ürün ve hizmetlerin bedelinin tahsil edilmesinde ve diğer gerek duyulan durumlarda kullanılacaktır. Kişiye özel bilgiler kullanıcılarımızın sisteme girişlerinde ve diğer gerektiği Durumlarda kişinin kimliğinin doğrulanmasında kullanılacaktır. istatistiki bilgiler ve profil bilgileri ayrıca sitemizin içinde de toplanmaktadır. Bu bilgiler istenilen tüm durumlarda Kullanılabilir. Bu bilgiler ziyaretçi hareketlerinin izlenmesi, kişiye ozel içerik sağlanması Durumlarında kullanılacaktır.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      )),
    );
  }
}