

final createTable = '''
  CREATE TABLE filho(
   id INT PRIMARY KEY,
   nome VARCHAR(250) NOT NULL,
   dataNasc DATE NOT NULL,
   usuario VARCHAR(100) NOT NULL,
   senha VARCHAR (200) NOT NULL,
   sexo CHAR(1) NOT NULL
 )
''';

final insert1 = '''
  INSERT INTO filho (nome, dataNasc, usuario, senha, sexo)
  VALUES ('Carlos', '29/08/2008', 'carlos', '123', 'M')
''';

final insert2 = '''
  INSERT INTO filho (nome, dataNasc, usuario, senha, sexo)
  VALUES ('Natália', '21/09/2007', 'natalia', '123', 'F')
''';


 final lista = [
    {'nome':'Carlos','dataNasc':'29/08/2008', 'sexo':'M', },
    {'nome':'Natália','dataNasc':'21/09/2007', 'sexo':'F', }
  ];

