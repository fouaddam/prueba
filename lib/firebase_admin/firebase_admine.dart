
import 'package:prubas_home/classes/product.dart';

import '../classes/category.dart';

class FireBaseAdmin{


//aqui vamos a selecionar todos los productos de la coleccion productos de firebase
  static final productList=[
    Product("fashion1", "https://img.freepik.com/fotos-premium/joven-hermosa-mujer-rubia-blusa-marron-pantalones-sostiene-bolso-rosa_118342-50594.jpg?w=740", "400", "200", true),
    Product("fashion2", "https://img.freepik.com/foto-gratis/dos-jovenes-hermosas-rubias-sonrientes-mujeres-hipster-ropa-moda-verano-mujeres-despreocupadas-sexy-posando-junto-pared-azul-gafas-sol-modelos-positivos-volviendose-locos-abrazandose_158538-7649.jpg?w=740&t=st=1680510981~exp=1680511581~hmac=4d84494c3b449e26fbd2b972a3525f356fc3c8cdf3a881b1fac582cbdc455970", "100", "50", false),
    Product("fashion3", "https://img.freepik.com/foto-gratis/sexy-mujer-elegante-posando-calle_291049-1.jpg?w=360&t=st=1680340341~exp=1680340941~hmac=a7f7bd35640105f7cf3a17e65897d171e1943202adef14cb0e897c745230e5d9", "70", "40", false),
    Product("fashion4", "https://img.freepik.com/foto-gratis/impresionante-modelo-femenino-rizado-saltando-sobre-morado-retrato-interior-chica-delgada-vestido-amarillo-brillante_197531-10836.jpg?w=740&t=st=1680511164~exp=1680511764~hmac=358c0b7b43f9295be5a5e860a6ff8189de6805afdfb7e2c257d9635e6c347e74","400", "200", true),
    Product("fashion5", "https://img.freepik.com/foto-gratis/mujer-joven-traje-pie-junto-moto_1303-11931.jpg?w=740&t=st=1680510553~exp=1680511153~hmac=483ab9b571a74d10f82880a36197ea9b66501807c8d6ad673fa9141e21c4f58f", "100", "50", false),
  ];


  static final categoryList=[
        Category("Moda casual","240","https://ih1.redbubble.net/image.1618194531.3614/ssrco,classic_tee,womens,fafafa:ca443f4786,front_alt,square_product,600x600.jpg"),
        Category("Moda sport", "120", "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71rbRvh7l9L._AC_UX385_.jpg"),
        Category("Estilo clásico", "2", "https://i.pinimg.com/originals/cb/7c/48/cb7c486a7602030ef298ddae6ea4efaa.jpg")

  ];









}