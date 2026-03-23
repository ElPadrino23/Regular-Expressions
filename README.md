# Evidencia 1: Implementación de Analisis Lexico
### Nombre: Luis Fernando Martinez Barragan | Matrícula: A01613426

## Descripción

El lenguaje que elegí es el lenguaje "Elfico", también conocido como Quenya, que Omniglot.com es una lengua construida creada por J. R. R. Derivada del ingles antiguo, el Finlandes y el latin. Talkien lo creo para los Elfos en su ficción de la Tierra Media. 

Las palabras a modelar son las siguientes: 

- Amil - palabra Quenya para 'Madre'
- An - 'Largo'
- Anarya - palabra para 'Dia del Sol', este hace referencia al segundo dia elfico.
- Anca - palabra que significa 'Mandibulas'
- And - 'Largo'

Segun FasterCapital (2025), El uso de un Automata Finito es la manera mas sencilla de reconocer patrones, y existen dos tipos: DFA y NFA. Un DFA (Automata Finito Determinista) solo puede ir a un estado y el NFA puede ir a varios estados con la misma entrada.

Para este proyecto decidi utilizar un DFA, ya que el objetivo es aceptar solo estas cinco palabras por lo que se puede seguir un solo camino para cada palabra y no se necesita un NFA. Ademas la ambiguedad de un NFA lo haria algo complicado de implementar. 

## Modelos

Solo genere un automata para este lenguaje, ya que este representa las cinco palabras. El automata solo es válido para el siguiente alfabeto:

**Σ = {A, m, i, l, n, a, r, y, c, d}**

Cualquier carácter que no esté en el alfabeto y que no aparezca explícitamente en el autómata no es aceptado.

![Automata Quenya](Quenya.png)

Otra forma de representar el automata es mediante una expresión regular. MongoDB (2025) menciona que ls expresiones regulares son patrones que se utilizan para hacer coincidir combinaciones de caracteres en cadenas. Entonces teniendolo en cuenta, el automata que diseñe se puede expresar de esta manera:

(^A)((mil)|(n(ε|arya|ca|d)))


## Implementación
 
Usé el autómata para crear una base de conocimiento en Prolog. La base de conocimiento tiene el estado actual, el siguiente estado y el símbolo que provoca la transición, modelado de la siguiente manera:
 
```prolog
grafo(estado_actual, estado_siguiente, simbolo).
```
 
También hay una regla adicional que define los estados de aceptación. Mi autómata tiene cinco estados de aceptación:
 
```prolog
final(c).
```
 
El resto del código tiene una regla auxiliar que llama a la regla recursiva:
 
```prolog
verificar(Palabra) :-
```
 
El caso base:
 
```prolog
validar([], Estado) :-
```
 
Y la regla recursiva:
 
```prolog
validar([Letra | Resto], Estado) :-
```
 
Todo esto se encuentra en el archivo `elven.pl`. Si la palabra está en el lenguaje retorna `true`, si no retorna `false`.
 
## Pruebas
 
Para correr el programa, primero abrir `elven.pl` en Prolog. Para abrir el archivo ejecutar `["ruta/elven.pl"].`
 
**Pruebas exitosas** — deben retornar `true`:
 
```
amil.
an.
anarya.
anca.
and_word.
```
 
**Pruebas fallidas** — deben retornar `false`:
 
```
amil_false.
hello.
anary.
ami.
anc.
```
 
Para probar una palabra diferente, ejecutar `verificar([lista-de-letras]).` donde cada letra va separada por coma.
 
Ejemplo: para probar la palabra `hello` ejecutar: `verificar([h, e, l, l, o]).`

## Análisis

**Complejidad temporal**

El programa usa recursión e itera sobre la base de conocimiento verificando cada hecho una vez, similar a un ciclo for. El caso base se alcanza cuando la lista está vacía, por lo que la complejidad asintótica es **O(n)**. No hay ningún ciclo anidado, por lo que la solución es eficiente.

**DFA vs NFA**

Ya expliqué por qué elegí el DFA: simplicidad. Aunque el NFA podría ser más fácil al diseñar el autómata, tendría que traducirse a DFA para programarlo. Como el lenguaje de cinco palabras es sencillo, usar DFA desde el inicio es lo más inteligente.

**Otros lenguajes de programación**

En Python, JavaScript o C++ se usaría un diccionario/arreglo con un ciclo for en lugar de recursión, pero todos tendrían la misma complejidad O(n). La diferencia principal es que en esos lenguajes se necesita crear una clase e instanciarla. Prolog es más limpio y elegante para este tipo de problema porque al ser un lenguaje lógico, la base de conocimiento representa el autómata de forma directa sin tanto código adicional.

## Referencias

Expresiones regulares - JavaScript | MDN. (2024). https://developer.mozilla.org/es/docs/Web/JavaScript/Guide/Regular_expressions

Quenya. Omniglot.com. Recuperado el 18 de marzo de 2026, de https://www.omniglot.com/conscripts/tengwar.htm

Fandom.com. Recuperado el 18 de marzo de 2026, de https://lotr.fandom.com/wiki/Quenya

NFA vs  DFA  desentranar las diferencias en los modelos de automata finitos - FasterCapital. (2025) FasterCapital. https://fastercapital.com/es/contenido/NFA-vs--DFA--desentranar-las-diferencias-en-los-modelos-de-automata-finitos.html#Comprender-los-modelos-de-aut-mata-finitos

Geeks for Geeks. (30 de noviembre, 2023). Regular Expression (RegEx) in Python with Examples. https://www.geeksforgeeks.org/regular-expression-python-examples/

Wikipedia. (19 de enero, 2024). Quenya. https://en.wikipedia.org/wiki/Quenya

