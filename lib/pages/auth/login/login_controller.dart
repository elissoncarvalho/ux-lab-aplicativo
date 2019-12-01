import 'package:uxlab/models/endereco.dart';
import 'package:uxlab/models/cliente.dart';

class LoginController {
  // Criando Cliente Imaginario
  final Cliente cliente = Cliente(
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
    sexo: 'feminino',
    telefone: '(37) 99158-9173',
  );

  // Status Autentica(Cliente cliente) {
  //   if (cliente.cpf.isNotEmpty) {
  //     if (this.cliente.cpf != cliente.cpf) {
  //       return Status(
  //         status: 'error',
  //         titulo: 'Ops!',
  //         descricao: 'Não encontramos CPF correspondente.',
  //       );
  //     }
  //   } else if (cliente.email.isNotEmpty) {
  //     if (this.cliente.email != cliente.email) {
  //       return Status(
  //         status: 'error',
  //         titulo: 'Ops!',
  //         descricao: 'Não encontramos Email correspondente.',
  //       );
  //     }
  //   }

  //   if (this.cliente.senha != cliente.senha) {
  //     return Status(
  //       status: 'error',
  //       titulo: 'Ops!',
  //       descricao: 'A senha não corresponde com a base de dados.',
  //     );
  //   }

  //   return Status(
  //     status: 'success',
  //     titulo: 'Sucesso',
  //     descricao: 'Login autenticado com sucesso!',
  //   );
  // }
}
