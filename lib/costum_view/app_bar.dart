
Container(
width: MediaQuery.of(context).size.width*0.80,
height: MediaQuery.of(context).size.height*0.12,
margin: const EdgeInsets.only(
bottom: 10.0,left: 10.0,right: 10.0
),
decoration: BoxDecoration(
color:kBackgournd,
borderRadius: BorderRadius.circular(10)
),

child: Row(
children: [
/*Radio(
                        value:"",
                        groupValue: "",
                        activeColor :kRedColor,
                        onChanged: (String? value) {
                        },

                      ),*/
Container(
height: 80,
width: 80,
margin: const EdgeInsets.only(left: 15),
decoration: BoxDecoration(
color: kWihte,
borderRadius: BorderRadius.circular(100)
),
child: CachedNetworkImage(imageUrl: listProduct[index].productUrl,
fit: BoxFit.cover,
),

),

Padding(
padding: const EdgeInsets.only(left: 15,top: 10),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
listProduct[index].productName,
style: const TextStyle(
color: kRedColor,
fontSize: 16
),
),
const SizedBox(height: 10,),
Text("${listProduct[index].currentPrice} Euros",
style: kTextStyle.copyWith(color: kWihte,fontSize: 15),)

],
),
),
Padding(
padding: const EdgeInsets.symmetric(vertical: 8.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
Row(
children: [
SizedBox(
height: 30,
width: 30,
child: IconButton(
icon:  const Icon(Icons.delete,size: 25,color: kRedColor,),
onPressed: () {

setState(() {
listProduct.remove(index);
print(listProduct[index].productName);

print("Eliminadooooooo");
});
},
),
),
],
),
Row(
children: [
const SizedBox(width: 60,),
Container(
height: 35,
width: 35,
padding: const EdgeInsets.all(6),
decoration: BoxDecoration(
color: kWihte,
borderRadius: BorderRadius.circular(20),
boxShadow: [
BoxShadow(
color: Colors.red.withOpacity(0.5),
spreadRadius: 3,
blurRadius: 10
)
],
),
child: IconButton(
icon:  const Icon(FontAwesomeIcons.plus,size: 10,),
onPressed: () {
setState(() {
print("---------------------------$index");
_cartAmount++;
});
},
),
),
Padding(
padding: const EdgeInsets.all(8.0),
child: Positioned(
child: Container(
height: 20,
width: 20,
decoration: const BoxDecoration(
color: kRedColor,
shape: BoxShape.circle
),
alignment: Alignment.center,
child:Text(_cartAmount.toString()),
),
),
),

Container(
height: 35,
width: 35,
padding: const EdgeInsets.all(6),
decoration: BoxDecoration(
color: kWihte,
borderRadius: BorderRadius.circular(20),
boxShadow: [
BoxShadow(
color: Colors.red.withOpacity(0.5),
spreadRadius: 3,
blurRadius: 10
)
],
),
child:IconButton(
icon:  const Icon(FontAwesomeIcons.minus,size: 10,),
onPressed: () {
setState(() {

if(_cartAmount==1){
print("no puedes");
}else{
_cartAmount--;
}

});

},
),
),
],
),

],
),
)

],
),

);