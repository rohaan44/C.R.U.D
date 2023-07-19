import 'package:crud/contact.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController nameControler = TextEditingController();
  TextEditingController contactControler = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);
  
  var selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50),
          width: 300,
          child: TextField(
            controller: nameControler,
            decoration: InputDecoration(
              hintText: "Name",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ),
        ),
        Container(
        height: 20,
        ),
         Container(
          width: 300,
          child: TextField(
            controller: contactControler,
            keyboardType: TextInputType.number,
            maxLength: 11,
            decoration: InputDecoration(
              hintText: "Number",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height:40,width: 100,
              child: ElevatedButton(
              onPressed: (){String name = nameControler.text.trim();
                String contact = contactControler.text.trim();
                if(name.isNotEmpty && contact.isNotEmpty){
                  setState(() {
                    nameControler.text ="";
                    contactControler.text="";
                    contacts.add(Contact(name: name, contact: contact)); 
                  });
                  }}, child: const Text("Save",style: TextStyle(fontSize: 20),)),),
              SizedBox(width: 30,),
            Container(height:40,width: 100,
            
            //update
            
              child: ElevatedButton(onPressed: (){
                String name = nameControler.text.trim();
                String contact = contactControler.text.trim();
                if(name.isNotEmpty && contact.isNotEmpty){
                  setState(() {
                    nameControler.text ="";
                    contactControler.text="";
                    contacts[selectedIndex].name=name; 
                    contacts[selectedIndex].name=contact;

                    selectedIndex=-1; 
                  });
                  }
              }, child: const Text("Update",style: TextStyle(fontSize: 20),)),)
          ],
        ),
        SizedBox(height: 50,),
        contacts.isEmpty? const Text("No Contacts Yet..!",style: TextStyle(fontSize: 20,color: Colors.black),):
        Expanded(
          child: ListView.builder(
            itemCount: contacts.length,
            itemBuilder:(context,index)=>getRow(index) ),
        )

      ],
    );
  }
  
 Widget getRow(int index){
  return Card(
    child: ListTile(
      trailing: Container(
        width: 80,
        child: Row(children: [
          IconButton(onPressed: (){
            nameControler.text=contacts[index].name;
            contactControler.text=contacts[index].contact;
            setState(() {
              selectedIndex=index;

            });
          }, icon: Icon(Icons.edit)),
          IconButton(onPressed: (){
            setState(() {
              contacts.removeAt(index);
            });
          }, icon: Icon(Icons.delete))
        ],),
      ),
      leading: CircleAvatar(
        backgroundColor: index%2==0?Colors.deepPurple: Colors.blue,
        foregroundColor: Colors.white,
        child: Text(contacts[index].name[0],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(contacts[index].name,style: TextStyle(fontSize: 20),),
        Text(contacts[index].contact,style: TextStyle(fontSize: 20),)
      ],),
    ),
  );
 }
}
