import 'dart:io';



//funcao para o calculo da media
void funcao_media(Quantidade_nota, tirando_nota, media, lista_notas, media_aprovacao, lista_media) {
  

  //função que pegará as primeiras notas da lista (de acordo com a quantidade informada)
  tirando_nota = lista_notas.getRange(0, Quantidade_nota);
  double soma = 0.0;

  //laço para a listar quebrar e somar todas as notas
  for(double elas in tirando_nota){
    soma = soma + elas;
  }

  //com a soma feita, hora de dividir
  double media = soma / Quantidade_nota;
  
  //verificacao das medias, se elas passam de 5 ou não
  if (media >= media_aprovacao) lista_media.add('${media.toString()}. Situação: APROVADO! :)');
  else lista_media.add('${media.toString()}. Situação: REPROVADO :(');
  

  //limpagem da lista para que ao reiniciar o laço, as outras novas notas sejam computadas e a média seja feita.
  lista_notas.removeRange(0, Quantidade_nota);
}

void main() {
  print("INFORME O NOME DOS 10 ALUNOS:");
  
  print("Quantas notas serão computadas para o cálculo da média");
  //  variável para guardar a quantidades de notas que o usuários deverá informar
  int Quantidade_notas = int.parse(stdin.readLineSync()!); 

//variáveis globais
  String? nome_aluno;
  double? nota_aluno;
  const media_aprovacao = 5.0;
  double media = 0.0;

// Listas
  List lista_alunos = [];
  List lista_notas = [];
  List lista_media = [];
  List<double> tirando_nota = [];

  //laço para perguntar o nome do aluno e guardar a informação no array
  for (int i = 1; i <= 10; i++) {
    print("aluno ${i}:");
    nome_aluno = stdin.readLineSync()!;
    lista_alunos.add(nome_aluno);

    //laço para o usuário informar as notas e guardar as informações no array
    for (int x = 1; x <= Quantidade_notas; x++) {
      print("Nota ${x} do ${nome_aluno}:");
      nota_aluno = double.parse(stdin.readLineSync()!);
      lista_notas.add(nota_aluno);
    }

    //função para o cálculo da média
    funcao_media(Quantidade_notas,tirando_nota, media, lista_notas, media_aprovacao, lista_media);

    
  }


  //variavel para a continuacao da pesquisa do usuário
  int continuacao = 1;
  
  //laço para a continuacao, se um número diferente for informado, o laço será interrompido
  while (continuacao == 1) {
    print("Qual aluno você quer procurar para ver suas notas?");
    print(lista_alunos);

    String? procurar_aluno = stdin.readLineSync()!;

    //lista para guardar nota e média
    List nome_e_media = [];

    //laço para a verificação do aluno na lista 
    for (var z = 0; z <= 9; z++){

      //adicionando o aluno na nova lista conforme o processo do laço
      nome_e_media.add('${lista_alunos[z]}: Sua média final: ${lista_media[z]}');

          
      if (lista_alunos.contains(procurar_aluno) == true) {
      
      //verificacao do aluno na lista e se a posição (de acordo com o nmr do laço) corresponde ao que foi solicitado
        if(lista_alunos[z] == procurar_aluno){
          print(nome_e_media[z]);
          break;
        }
        //se não tiver, continue o processo do laço
        else continue;
      } else {
        //se não atender ao que foi pedido, o laço será encerrado e o aluno não esteve presente na lista
        print("Esse aluno não está");
        break;
      }
    }
    //input para a continuacao
    print('Deseja continuar? Se sim, aperte a tecla (1). Se não, aperte a tecla (0).');
    continuacao = int.parse(stdin.readLineSync()!);
  }
}
