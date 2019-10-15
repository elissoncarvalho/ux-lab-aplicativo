import 'package:uxlab/Models/Endereco.dart';
import 'package:uxlab/Models/Status.dart';
import 'package:uxlab/Models/Usuario.dart';

class LoginController {

  // Criando Usuario Imaginario
  final Usuario usuario = Usuario(
    nome: 'Maria Luisa',
    email: 'maria@email.com',
    cpf: '123.123.123-32',
    dataNascimento: DateTime.parse('2012-02-27'),
    endereco: Endereco(
      bairro: 'Flavio de Oliveira',
      cep: 35560000,
      cidade: 'Santo Antônio do Monte',
      complemento: 'Casa na Esquina',
      endereco: 'Rua José do Colto Pereira',
      numero: 09,
      pais: 'Brasil',
      uf: 'Minas Gerais',
    ),
    senha: 'admin',
    sexo: 'Feminino',
    telefone: '(37) 99158-9173',
  );

  Status Autentica(Usuario usuario) {
    
    if(usuario.cpf.isNotEmpty){
      if (this.usuario.cpf != usuario.cpf) {
        return Status(
          status: 'error',
          titulo: 'Ops!',
          descricao: 'Não encontramos CPF correspondente.',
        );
      }
    } else if (usuario.email.isNotEmpty) {
      if (this.usuario.email != usuario.email) {
        return Status(
          status: 'error',
          titulo: 'Ops!',
          descricao: 'Não encontramos Email correspondente.',
        );
      }
    } 

    if (this.usuario.senha != usuario.senha) {
      return Status(
        status: 'error',
        titulo: 'Ops!',
        descricao: 'A senha não corresponde com a base de dados.',
      );
    }

    return Status(
      status: 'success',
      titulo: 'Sucesso',
      descricao: 'Login autenticado com sucesso!',
    );   
  }  
}