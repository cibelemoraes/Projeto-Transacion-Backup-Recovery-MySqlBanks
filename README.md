# Projeto-Transacion-Backup-Recovery-MySqlBanks

PARTE 1 – TRANSAÇÕES 

Objetivo:  

Neste desafio você irá lidar com transações para executar modificações na base de dados. Sendo assim, vamos relembrar como executar uma transação. Primeiramente, é preciso desabilitar o autocommit do MySQL. Caso contrário, cada instrução SQL executada será confirmada. 

CODE 1

Essa primeira transação pode ser executada sem utilizar outros recursos como procedures. Dessa forma, você irá executar statements de consultas e modificações de dados persistidos no banco de dados via transações.  

 

CODE 2

PARTE 2 - TRANSAÇÃO COM PROCEDURE 

Você deverá criar outra transação, contudo, esta será definida dentro de uma procedure. Neste caso, assim como no exemplo em aula, deverá haver uma verificação de erro. Essa verificação irá acarretar um ROLLBACK, total ou parcial (SAVEPOINT). 

CODE 3

PARTE 3 – BACKUP E RECOVERY 

Objetivo: 

Neste etapa do desafio, você irá executar o backup do banco de dados e-commerce. Realize o backup e recovery do banco de dados; 

Utilize o mysqdump para realizar o backup e recovery do banco de dados e-commerce; 

Realize o backup de diferentes bancos de dados e inseria os recursos como: procedures, eventos e outros. 

Adicione o arquivo de backup ao github juntamente com o script; 