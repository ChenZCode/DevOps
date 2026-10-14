default:
    just --list

build:
    gcc -Wall main.c -o exe

run: build
    ./exe

bonjour name:
    echo "Hello, {{name}}"

createRepoInit nameRepo:
    git init {{nameRepo}}
    git pull

status:
    git status

modifFile nameFile content:
    echo "{{content}}" >> {{nameFile}}

workflow nameRepo content nameFile commitContent:
    git init {{nameRepo}}
    git status
    echo "{{content}}" >> {{nameFile}}
    git add.
    git commit -m {{commitContent}}
    git pull
    git push

clean:
    rm -r tmp.txt


createDatabase user myDatabase:
    mysql -u {{user}} -p
    mysql -e "CREATE DATABASE IF NOT EXISTS {{myDatabase}}";

createTable user myDatabase myTable idColumn nameColumn:
    mysql -u {{user}} -p
    mysql -e USE {{myDatabase}};
    CREATE TABLE IF NOT EXISTS {{myTable}} ({{idColumn}} INT PRIMARY KEY, {{nameColumn}} VARCHAR(50));


insertEntity user myDatabase myTable idColumn nameColumn idValue nameValue:
    mysql -u {{user}} -p
    mysql -e "USE {{myDatabase}}; CREATE TABLE IF NOT EXISTS {{myTable}} ({{idColumn}} INT PRIMARY KEY, {{nameColumn}} VARCHAR(50));"
    mysql -e "USE {{myDatabase}}; INSERT INTO {{myTable}} ({{idColumn}}, {{nameColumn}}) VALUES ({{idValue}}, '{{nameValue}}');"
