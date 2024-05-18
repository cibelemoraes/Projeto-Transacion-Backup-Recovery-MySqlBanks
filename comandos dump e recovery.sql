# comandos via powershell - windows 10
# entrando no diretório
cd 'C:\Program files\mysql\MySQL Workbench 8.0 CE' 

# dump dos bancos de dados de ecommerce e company com os stored objects
.\mysqldump.exe -u root -p --column-statistics=0 --events --routines --triggers -B company ecommerce > databases_backup.sql 
# loading dos bancos de dados de ecommerce e company com os stored objects
Get-Content databases_backup.sql | .\mysql -u root -p -v

# dump apenas dos dados do ecommerce
.\mysqldump.exe -u root -p --column-statistics=0 --no-create-info --no-create-db -B ecommerce > ecommerce_just_data_backup.sql
# loading apenas dos dados do ecommerce
get-content ecommerce_just_data_backup.sql | .\mysql -u root -p -v ecommerce 

# dump do ecommerce sem os dados
.\mysqldump.exe -u root -p --column-statistics=0 --events --routines --triggers --no-data -B ecommerce > ecommerce_no_data_backup.sql
# loading apenas da estrutura do ecommerce
get-content ecommerce_no_data_backup.sql|.\mysql -u root -p -v ecommerce