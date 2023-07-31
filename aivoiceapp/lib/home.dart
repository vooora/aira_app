import 'package:aivoiceapp/textbox.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  String lastWords = '';

  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1F1F1F),
        elevation: 0,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.menu)
        ),
      ),
      backgroundColor: const Color(0xFF1F1F1F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
              child: Text(
                'Aira',
                style: TextStyle(
                  color: Color.fromRGBO(174, 174, 174, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
          ),
          const Image(
            image: AssetImage("lib/assets/aira.png")
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 289,
              height: 112,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(174, 174, 174, 1),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'How can I be of\nassistance?',
                  style: TextStyle(
                    color: Color.fromRGBO(174, 174, 174, 1),
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top:50),
            child: TextBox(text: 'ChatGPT')
          ),
          const Padding(
            padding: EdgeInsets.only(top:20),
            child: TextBox(text: 'Dall-E')
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            startListening();
          }
          else if(speechToText.isListening){
            stopListening();
          }
          else{
            initSpeechToText();
          }
        },
        backgroundColor: const Color.fromRGBO(252, 161, 41, 1),
        child: const Icon(Icons.mic),
      ),
    );
  }
}