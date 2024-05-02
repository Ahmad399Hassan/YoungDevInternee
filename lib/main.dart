import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_calculator/my_componants/componants.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
   MyApp({super.key});



  @override
  State<MyApp> createState() => _MyAppState();
}
var userInput='';
var answer = '';
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Expanded(
                  child:  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   
                   Align(
                     alignment: Alignment.bottomRight,
                       child: Text(userInput.toString(),style:  const TextStyle(fontSize: 30,color: Colors.white,),)),
                    const SizedBox(height: 5,),
                    Text(answer.toString(),style:  const TextStyle(fontSize: 30,color: Colors.white),),
                  
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(title: 'AC', onPress: (){
                            userInput = '';
                            answer='';
                            setState(() {

                            });
                          },),
                          MyButton(title: '+/-', onPress: (){
                            userInput += '+/-';
                            setState(() {

                            });
                          },),
                          MyButton(title: '%', onPress: (){
                            userInput += '%';
                            setState(() {

                            });
                          },),
                          MyButton(title: '/',onPress: (){
                            userInput += '/';
                            setState(() {

                            });
                          },color: const Color(0xffffa00a),)
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '7', onPress: (){
                            userInput += '7';
                            setState(() {

                            });
                          },),
                          MyButton(title: '8', onPress: (){
                            userInput += '8';
                            setState(() {

                            });
                          },),
                          MyButton(title: '9', onPress: (){
                            userInput +='9';
                            setState(() {

                            });
                          },),
                          MyButton(title: 'X',onPress: (){
                            userInput +='x';
                            setState(() {

                            });
                          },color: const Color(0xffffa00a),)
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '4', onPress: (){
                            userInput +='4';
                            setState(() {

                          });},),
                          MyButton(title: '5', onPress: (){
                            userInput +='5';
                            setState(() {

                            });
                          },),
                          MyButton(title: '6', onPress: (){
                            userInput +='6';
                            setState(() {

                            });
                          },),
                          MyButton(title: '-',onPress: (){
                            userInput +='-';
                            setState(() {

                            });
                          },color: const Color(0xffffa00a),)
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '1', onPress: (){
                            userInput +='1';
                            setState(() {

                            });},),
                          MyButton(title: '2', onPress: (){
                            userInput +='2';
                            setState(() {

                            });
                          },),
                          MyButton(title: '3', onPress: (){
                            userInput +='3';
                            setState(() {

                            });
                          },),
                          MyButton(title: '+',onPress: (){
                            userInput +='+';
                            setState(() {

                            });
                          },color: const Color(0xffffa00a),)
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '0', onPress: (){
                            userInput +='0';
                            setState(() {

                            });
                          },),
                          MyButton(title: '.', onPress: (){
                            userInput +='.';
                            setState(() {

                            });
                          },),
                          MyButton(title: 'DEL', onPress: (){
                            userInput = userInput.substring(0, userInput.length -1);
                            setState(() {

                            });
                          },),
                          MyButton(title: '=',onPress: (){
                            equalPres();
                            setState(() {

                            });
                          },color: const Color(0xffffa00a),)
                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );


  }
  void equalPres(){

    String finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel =ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

class EvaluationType {
}

class ContextModel {
}

class Expression {
  double evaluate(real, ContextModel contextModel) {}
}

class Parser {
  Expression parse(String finalUserInput) {}
}

  


