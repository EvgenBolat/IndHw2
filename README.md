# Хавронич Евгений Алексеевич, БПИ226
---
## Вариант 35
### Условие:
Разработать программу, определяющую корень уравнения x4−x3−2.5 = 0 **методом хорд** с точностью от 0,001 до 0,00000001 в диапазоне [1;2]. Если диапазон некорректен, то подобрать корректный диапазон.
### Программы:
[Программы на ассемблере с комментариями размещены здесь](Files)
## Программа была написана на оценку 10.

### Требования на 10:
- Программа разбита на несколько единиц компиляции. Происходит вызов макросов из файлов [macrolib.s](Files/macrolib.s), [DoubleReadPrint.s](Files/DoubleReadPrint.s), [FuncLib.s](Files/FuncLib.s)
- Подпрограммы ввода–вывода составляють унифицированные модули, используемые повторно как в программе, осуществляющей ввод исходных данных ([WithTheInput.asm](Files/WithTheInput.asm)), так и в программе,осуществляющей тестовое покрытие ([TestProgram.asm](Files/TestProgram.asm)).

### Требования на 9:
- Добавлено в программу использование макросов для реализации
ввода и вывода данных. Используется библиотека [macrolib.s](Files/macrolib.s), из неё применяются print_str и newline.
- Обернул в макросы все уже ранее разработанные подпрограммы и оформил в виде библиотек [DoubleReadPrint.s](Files/DoubleReadPrint.s),[FuncLib.s](Files/FuncLib.s).
- Все макросы поддерживают повторное использование с различными массивами и другими параметрами.

### Требования на 8:
- Разработанные подпрограммы поддерживают многократное использование с различными наборами исходных данных, включая возможность подключения различных исходных и результирующих массивов. Это достигается передачей в качестве параметра регистра, который хранит указатель на массив
- Реализовано автоматизированное тестирование за счет создания
дополнительной тестовой программы [TestProgram.asm](Files/TestProgram.asm) , осуществляющей прогон подпрограммы обработки массивов с различными тестовыми данными (вместо ввода данных). От пользователя требуется лишь запустить файл, и выходные данные будут выведены в консоль после выполнения тестов. Осуществлён прогон тестов, обеспечивающих покрытие различных ситуаций. Результаты выполнения тестовой программы представлены в таблице ниже.
<table>
    <tr>
        <th>№ теста</th>
        <th>Какую ситуацию проверяет</th>
        <th>Введённая точность</th>
        <th>Полученный X </th>
    </tr>
    <tr>
        <td>1</td>
        <td>Точность равна правой границе диапозона</td>
        <td>0.001</td>
        <td>1.6048396218292138</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Точность чуть меньше правой границы диапозона</td>
        <td>0.0009</td>
        <td>1.6048396218292138</td>
    </tr>
    <tr>
        <td>3</td>
        <td>Произвольная точность из нужного диапозона</td>
        <td>0.000005</td>
        <td>1.6048428005867157</td>
    </tr>
    <tr>
        <td>4</td>
        <td>Точонсть чуть больше левой границы диапозона</td>
        <td>0.00000002</td>
        <td>1.6048428005867157</td>
    </tr>
    <tr>
        <td>5</td>
        <td>Точность равна правой границе диапозона</td>
        <td>0.00000001</td>
        <td>1.6048427993525602</td>
    </tr>
    <tr>
        <td>6</td>
        <td>Точность меньше правой границы диапозона</td>
        <td>0.000000009</td>
        <td>Accuracy should be in the range of 0.001 to 0.00000001</td>
    </tr>
</table>

- Для дополнительной проверки корректности вычислений осуществлены аналогичные тестовые прогоны с использованием существующих библиотек и языка программирования высокого
уровня C++ (см. [CppCode.cpp](Files/CppCode/Code.cpp)). Для этого была взята реализация данного метода, описанная на странице данного метода в [WikiPedia](https://ru.wikipedia.org/wiki/%D0%9C%D0%B5%D1%82%D0%BE%D0%B4_%D1%85%D0%BE%D1%80%D0%B4#%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F)

Результаты выполнения тестовой программы на языке С++, а также разность значений в сравнении с тестовой программой на RISK-V по представлены в таблице ниже.

<table>
    <tr>
        <th>№ теста</th>
        <th>Какую ситуацию проверяет</th>
        <th>Введённая точность</th>
        <th>Полученный X в C++ файле </th>
        <th>Полученный X в RISK-V файле </th>
        <th>Разность значений в сравнении с результатом аналогичного теста в программе RISK-V </th>
        <th>Удовлетворяет ли разность значений заданной точности (должна получиться меньше заданной точности) </th>
    </tr>
    <tr>
        <td>1</td>
        <td>Точность равна правой границе диапозона</td>
        <td>0.001</td>
        <td>1.6048503172221644</td>
        <th>1.6048396218292138</th>
        <th>0.0000106953929506</th>
        <th>Да</th>
    </tr>
    <tr>
        <td>2</td>
        <td>Точность чуть меньше правой границы диапозона</td>
        <td>0.0009</td>
        <td>1.6048503172221644</td>
        <th>1.6048396218292138</th>
        <th>0.0000106953929506</th>
        <th>Да</th>
    </tr>
    <tr>
        <td>3</td>
        <td>Произвольная точность из нужного диапозона</td>
        <td>0.000005</td>
        <td>1.6048427993525115</td>
        <th>1.6048428005867157</th>
        <th>0.0000000012342042</th>
        <th>Да</th>
    </tr>
    <tr>
        <td>4</td>
        <td>Точонсть чуть больше левой границы диапозона</td>
        <td>0.00000002</td>
        <td>1.6048427993525115</td>
        <th>1.6048428005867157</th>
        <th>0.0000000012342042</th>
        <th>Да</th>
    </tr>
    <tr>
        <td>5</td>
        <td>Точность равна правой границе диапозона</td>
        <td>0.00000001</td>
        <td>1.6048427993525115</td>
        <th>1.6048427993525602</th>
        <th>0.0000000000000487</th>
        <th>Да</th>
    </tr>
    <tr>
        <td>6</td>
        <td>Точность меньше правой границы диапозона</td>
        <td>0.000000009</td>
        <td>-</td>
        <th>-</th>
        <th>-</th>
        <th>-</th>
    </tr>
</table>

### Требования на 6-7:
- В программе использовались подпрограммы с передачей
аргументов через параметры, отображаемые на стек. 
    - В inputSize никакие параметры не передавались. 
    - В inputArray и SumOfEvenIndexes оба параметра сохраняются на стек. 
    - В ArrayFromElemLessSum все 4 параметра сохраняются на стек.
    - В printArray параметр сохраняется на стек.
    - Во всех подпрограммах на стеке сразу же сохранялся ra, а позже возвращался.
- Внутри подпрограмм используются локальные переменные, которые при компиляции отображауются на стек.
    - В inputSize сохраняется одна и единственная локальная переменная.
    - в inputArray локальных переменных нет, используются лишь параметры на стеке.
    - в SumOfEvenIndexes сохраняются все 3 локальные переменные. Остаток не требует сохранения, так как используется сразу после вычисления и более не нужен на всём шаге.
    - в ArrayFromElemLessSum сохряняется одна и единственная локальная переменная.
    - в printArray нет локальных переменных – используется сохранённые на стеке параметры.
- В местах вызова функции в файле [WithTheInput.asm](Files/WithTheInput.asm) , где пользователь сам вводит с консоли данные, добавлены комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата. Также отмечены, какая переменная или результат какого выражения соответствует тому или иному фактическому параметру.

### Требования на 4-5:
- Приведено решение задачи на ассемблере.
- Ввод данных осуществляется с клавиатуры.
- Вывод данных осуществляется на дисплей.
- В программе присутствоуют комментарии, поясняющие сложные моменты в коде.

## Общий алгоритм программы.
1. Вызов **inputSize**. В качестве аргумента получаем регистр, куда будет передан размер массива. В этом макросе происходит вызов ввода целого числа, и если число попадает в отрезок [1,10], то макрос успешно завершает свою работу и выполнение программы продолжается дальше. Если не попадает, то программа завершается и выводится сообщение о причине завершения программы.
2. Вызов **inputArray**. В него передаётся размер массива, который мы получили ранее, и указатель на массив, который будет заполняться. В макросе происходит вызов ввода целого числа столько раз, сколько передали в качестве размера массива.
3. Вызов **printArray**. Аргументы аналогичны тем, что передавались в inputArray. В макросе происходит вывод элементов массива в консоль через пробел.
4. Вызов **SumOfEvenIndexes**. Первые аргументы аналогичны передававшимся в последних двух описанных функциях, также передаётся регистр, в который будет записана сумма элементов массива, расположенных на чётных индексах. Учтено переполнение в левую и правую сторону: если это может случиться, то выполнение программы завершается с выводом в консоль текста о том, что произошло переполнение.
5. Вызов **ArrayFromElemLessSum**. Аргументы: сумма элементов на чётных индексах массива А, размер массива А, указатель на массив А, указатель на массив B, регистр, куда запишется размер заполненного массива B. В данном макросе происходит запись элементов массива А в массив B, которые меньше переданной в качестве первого аргумента суммы. Из макроса в последний параметр записывается размер заполненного массива.
6. вызов **inputArray**. Выводим получившийся массив B.
**Примечание: в качестве чётных мест из условия варианта считаются чётные индексы массива. Счёт индексов считается с нуля.**

### Таблица прогона полного тестового покрытия

<table>
    <tr>
        <th>№ теста</th>
        <th>Какую ситуацию проверяет</th>
        <th>Размер массива</th>
        <th>Массив А</th>
        <th>Сумма элементов на чётных местах</th>
        <th>Массив B</th>
    </tr>
    <tr>
        <td>1</td>
        <td>Размер < 1</td>
        <td>-1</td>
        <td>The number of elements must be from 1 to 10 inclusive!</td>
        <td>-</td>
        <td>--</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Размер > 10</td>
        <td>11</td>
        <td>The number of elements must be from 1 to 10 inclusive!</td>
        <td>-</td>
        <td>-</td>
    </tr>
    <tr>
        <td>3</td>
        <td>Размер массива 1</td>
        <td>1</td>
        <td>-8</td>
        <td>8</td>
        <td>Array is empty</td>
    </tr>
    <tr>
        <td>4</td>
        <td>Размер 10 элементов</td>
        <td>10</td>
        <td>4 1243 -232 45321 -332 34582 1233 -3 0 1</td>
        <td>673</td>
        <td>4 -232 -332 -3 0 1</td>
    </tr>
    <tr>
        <td>5</td>
        <td>10 элементов и переполнение вправо</td>
        <td>10</td>
        <td>2147483645 -2 2 -3 1 -2342 -3 3 -12331 1233442</td>
        <td>There's been an overflow!</td>
        <td>-</td>
    </tr>
    <tr>
        <td>6</td>
        <td>10 элементов и переполнение влево</td>
        <td>10</td>
        <td>-2147483645 2 -2 3 -4 12321 33233 -323 12343 -3234</td>
        <td>There's been an overflow!</td>
        <td>-</td>
    </tr>
    <tr>
        <td>7</td>
        <td>Все элементы меньше или равны сумме</td>
        <td>5</td>
        <td>-3 0 -4 -11 -4</td>
        <td>-11</td>
        <td>Array is empty</td>
    </tr>
    <tr>
        <td>8</td>
        <td>Сумма элементов равна левой границе</td>
        <td>4</td>
        <td>-2147483645 2 -3 4</td>
        <td>-2147483648</td>
        <td>Array is empty</td>
    </tr>
    <tr>
        <td>9</td>
        <td>Сумма элементов равна правой границе</td>
        <td>4</td>
        <td>2147483645 3 2 -323523</td>
        <td>2147483647</td>
        <td>2147483645 3 2 -323523</td>
    </tr>
    <tr>
        <td>10</td>
        <td>Сумма элементов чуть больше левой границы</td>
        <td>4</td>
        <td>-2147483645 -2 2 4</td>
        <td>-2147483643</td>
        <td>-2147483645</td>
    </tr>
    <tr>
        <td>11</td>
        <td>Сумма элементов чуть меньше правой границы</td>
        <td>4</td>
        <td>2147483645 3234 -3 -234342</td>
        <td>2147483642</td>
        <td>3234 -3 -234342</td>
    </tr>
    <tr>
        <td>12</td>
        <td>Все элементы 0</td>
        <td>6</td>
        <td>0 0 0 0 0 0</td>
        <td>0</td>
        <td>Array is empty</td>
    </tr>
     <tr>
        <td>13</td>
        <td>Случайный массив</td>
        <td>7</td>
        <td>124234 -2332 -2 0 33424 1 -4</td>
        <td>157652</td>
        <td>124234 -2332 -2 0 33424 1 -4</td>
    </tr>
</table>

![](https://i.pinimg.com/564x/bc/1e/46/bc1e46bf01876a546a0b602003752a94.jpg)
