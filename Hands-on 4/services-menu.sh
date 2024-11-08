#!/bin/bash
 
# Función para mostrar el menú
function show_menu() {
    echo "===== Services Menu ====="
    echo "1. Listar el contenido de un fichero (carpeta)"
    echo "2. Crear un archivo de texto con una línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar uso de 'awk'"
    echo "5. Mostrar uso de 'grep'"
    echo "6. Salir"
}
 
# Función para listar el contenido de una carpeta
function list_directory() {
    read -p "Introduce la ruta absoluta de la carpeta: " dir_path
    if [ -d "$dir_path" ]; then
        echo "Contenido de $dir_path:"
        ls "$dir_path"
    else
        echo "La ruta proporcionada no es válida."
    fi
}
 
# Función para crear un archivo de texto con una línea de texto
function create_text_file() {
    read -p "Introduce el nombre del archivo: " file_name
    read -p "Introduce la cadena de texto a almacenar: " text_line
    echo "$text_line" > "$file_name"
    echo "El archivo $file_name ha sido creado con el texto: '$text_line'"
}
 
# Función para comparar dos archivos de texto
function compare_files() {
    read -p "Introduce la ruta del primer archivo: " file1
    read -p "Introduce la ruta del segundo archivo: " file2
    if [ -f "$file1" ] && [ -f "$file2" ]; then
        diff "$file1" "$file2"
        if [ $? -eq 0 ]; then
            echo "Los archivos son iguales."
        else
            echo "Los archivos son diferentes."
        fi
    else
        echo "Uno o ambos archivos no existen."
    fi
}
 
# Función para mostrar el uso básico de 'awk'
function show_awk_usage() {
    echo "Uso de awk:"
    echo "Ejemplo: awk '{print \$1}' archivo.txt"
    echo "Este comando imprime la primera columna del archivo."
    echo "Introduce la ruta de un archivo para probar: "
    read file_path
    if [ -f "$file_path" ]; then
        awk '{print $1}' "$file_path"
    else
        echo "El archivo no existe."
    fi
}
 
# Función para mostrar el uso básico de 'grep'
function show_grep_usage() {
    echo "Uso de grep:"
    echo "Ejemplo: grep 'patrón' archivo.txt"
    echo "Este comando busca líneas que contengan 'patrón'."
    echo "Introduce el patrón a buscar: "
    read pattern
    echo "Introduce la ruta del archivo para buscar: "
    read file_path
    if [ -f "$file_path" ]; then
        grep "$pattern" "$file_path"
    else
        echo "El archivo no existe."
    fi
}
 
# Bucle principal del menú
while true; do
    show_menu
    read -p "Elige una opción: " option
    case $option in
        1) list_directory ;;
        2) create_text_file ;;
        3) compare_files ;;
        4) show_awk_usage ;;
        5) show_grep_usage ;;
        6) echo "Saliendo..."; exit ;;
        *) echo "Opción no válida. Intenta de nuevo." ;;
    esac
    echo ""
done
 
