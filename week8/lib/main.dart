import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'service.dart';
import 'model.dart';

final dio = Dio();
final pokemonInfo = PokemonInfo(dio);

void main() {
  runApp(const MyApp());
}

class  MyApp extends StatefulWidget {
const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _State();
}

class _State extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  String _inputText = '';
  String _pokemonInfo = '';
  String _pokemonImgUrlFrontDefault ='';
  String _pokemonImgUrlBackDefault = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.asset('assets/images/PokemonLogo.png', width:300, height: 300,),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '포켓몬 이름을 입력하세요',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: (){
                      _getPokemonImgUrl();
                      _fetchPokemonInfo();
                    },
                  )
                ),
                onChanged: (value){
                  setState(() {
                    _inputText = value;
                  });
              },
              ),
              if (_pokemonImgUrlBackDefault.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(_pokemonImgUrlFrontDefault, width: 100,height: 100),
                    Image.network(_pokemonImgUrlBackDefault, width: 100,height: 100)
                  ],)
              else
                Image.asset('assets/images/MonsterBall.png', width:200, height: 200,),
              Text(_pokemonInfo),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _fetchPokemonInfo() async {
    try {
      final Pokemon pokemon = await pokemonInfo.getPokemonInfo(_inputText);
      setState(() {
        _pokemonInfo = '도감번호: ${pokemon.id}번\n'
                       '이름: ${pokemon.name}\n'
                       '몸무게: ${pokemon.weight}kg\n';
      });
    }
    catch (error) {
      setState(() {
        _pokemonInfo = '포켓몬 정보를 찾을 수 없습니다.';
      });
    }
  }
  Future<void> _getPokemonImgUrl() async {
    try {
      final Pokemon pokemon = await pokemonInfo.getPokemonInfo(_inputText);
      setState(() {
        _pokemonImgUrlFrontDefault = '${pokemon.sprites.front_default}';
        _pokemonImgUrlBackDefault = '${pokemon.sprites.back_default}';
      });
    }
    catch (error) {
      setState(() {
        _pokemonImgUrlFrontDefault = "이미지 로드 실패!";
        _pokemonImgUrlBackDefault = "이미지 로드 실패!";
      });
    }
  }
}
