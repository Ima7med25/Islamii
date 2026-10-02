class SebhaEntity {
  final String text;
  SebhaEntity({required this.text});

  static List<SebhaEntity> getSebha() => [
    SebhaEntity(text: 'سبحان الله'),
    SebhaEntity(text: 'الحمد لله'),
    SebhaEntity(text: 'الله اكبر'),
    SebhaEntity(text: 'لا إله إلا الله'),
    SebhaEntity(text: 'سبحان الله وبحمده'),
    SebhaEntity(text: 'سبحان الله والحمد لله'),
    SebhaEntity(text: 'سبحان الله العظيم وبحمده'),
    SebhaEntity(text: 'سبحان الله وبحمده سبحان الله العظيم'),
    SebhaEntity(text: 'سبحان الله والحمد لله ولا اله الا الله و الله اكبر'),
    SebhaEntity(
      text:
          'لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير',
    ),
    SebhaEntity(text: 'لا حول ولا قوة إلا بالله'),
    SebhaEntity(text: 'اللهم اغفر لي ولوالدي وللمؤمنين والمؤمنات'),
    SebhaEntity(text: 'اللهم ارزقنا الجنة وما قرب إليها من قولٍ أو عمل'),
  ];
}
