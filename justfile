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

    
    
