# Evidencia 1: IImplementacion del Analisis Lexico
Luis Fernando Martinez Barragan - A01613426

## Descripcion
El lenguaje que escogi es conocido como Quenya, este fue inventado por J.R.R y utilizado en sus libros como "El Hobbit" y "El señor de los anillos". Ademas de esto, es un lenguaje elfico, Tolkien se baso en el ingles antiguo, el Finlandes y el latin. 

Las palabras que escogi para modelar, fueron las siguientes: 

1. Amil - word for 'Mother'
2. An - 'long'.
3. Anarya - Quenya meaning 'Sun's-day', the second day of the Elvish week.
4. Anca - Quenya word for 'Jaws'.
5. And - 'long'.


## Model of the Solution

These are the three  automata I generated for this language:

The first automaton  is used to represent all the numbers that start from 1


![NFA1](automata.png)
 
The second automaton is used to represent all the numbers that start from 2 and 3 

![NFA2](automata.png)

The third automaton is used when …. Etc… 

I decided to use three different automata because it is easier to do this way, however using NFA I have to transform them to DFA to be able to program the latter or to migrate them to a RE more easily rather than try to guess them. To do that, I followed the method proposed by (Sun et al 2054).  

The resulting automaton was:

![NFA3](automata.png)

The presented automata are equivalent to the following regular expressions:

NDA 1 -> RE 1:
{[1,2,3]*}

NDA 2 -> RE 2:
{[2,3]*}

NDA 1 -> RE 1:
{[132cc3,3]+-}

## Implementation

For my implementation of a lexical analysis, I followed the regular expressions as can be seen in the regex.py file.
To use the file you need to put the input in the format of a string “1222344”  and the program should return yes if the string is accepted or no if the string is not part of the language.

some examples of inputs and outputs are: 
 
  1123125  -> no

  112312  -> yes

  11  -> yes

  1222123125  -> no

## Tests

The file tests.py contains all the cases tested for regular expressions. 

## Analysis

The **complexity** of my model is in general n, where n  is the length of the string to be processed. Here is my proof by induction or hand analysis time complexity:


     for i < n
       if i in n
        i ++
       end
….  


I used the regex library from Python which internally according to the API documentation uses the algorithms from Unix to better parse... etc ... this means that my time complexity in general remains as O(n) 

My first approach to the **solution** was to use an automaton in prolog which is also a natural solution however following the recommendations I found in  (sun et al, 2054)  I preferred the Regular Expression because it is faster in the context of ... etc ... havinf an overall time of  O(log n)



## References

Quenya. Omniglot.com. Recuperado el 18 de marzo de 2026, de https://www.omniglot.com/conscripts/tengwar.htm

Fandom.com. Recuperado el 18 de marzo de 2026, de https://lotr.fandom.com/wiki/Quenya

NFA vs  DFA  desentranar las diferencias en los modelos de automata finitos - FasterCapital. (s. f.). FasterCapital. https://fastercapital.com/es/contenido/NFA-vs--DFA--desentranar-las-diferencias-en-los-modelos-de-automata-finitos.html#Comprender-los-modelos-de-aut-mata-finitos
