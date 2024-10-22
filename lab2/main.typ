#import "../conf.typ" : conf
#show: conf.with(
  title: [],
  type: "pract",
  info: (
      author: (
        name: [Толстова Роберта Сергеевича],
        faculty: [КНиИТ],
        group: "251",
        sex: "male"
      ),
      inspector: (
        degree: "Cтарший преподаватель",
        name: "Е. М. Черноусова"
      )
  ),
  settings: (
    title_page: (
      enabled: true
    ),
    contents_page: (
      enabled: true
    )
  )
)

= Исходный код программ
== Задание 1


== Задание 2


= Ответы на контрольные вопросы
== В какой регистр надо поместить код выводимого символа? Какой код DOS-функции используется для вывода отдельного символа на экран?
Код выводимого символа помещается в регистр `DL`. Это стандартный регистр, который используется для передачи данных в функцию вывода символов.
Код DOS-функции для вывода отдельного символа на экран -- это #raw(lang: "asm", "02h"). При вызове этой функции через прерывание #raw(lang: "asm", "int 21h") содержимое регистра `DL` интерпретируется как символ, который будет выведен на экран.

== Какая операция позволяет получить для цифры её код в кодовой таблице?
Для получения кода цифры в кодовой таблице ASCII используется операция сложения с символом #raw(lang: "asm", "'0'"). Например, если у вас есть число в регистре, вы можете добавить к нему значение ASCII символа #raw(lang: "asm", "'0'") (которое равно 48 в десятичной системе). Это преобразует число от 0 до 9 в соответствующий ASCII-код:

```asm
add ax, '0' ; Преобразование числа в ASCII
```

== Объясните назначение процедуры. Как определяются начало и конец процедуры?
Назначение процедуры заключается в том, чтобы выполнять определённые действия или задачи, которые могут быть повторно использованы в программе. Процедуры помогают структурировать код, делают его более читаемым и облегчают отладку.

Начало процедуры определяется ключевым словом proc, за которым следует имя процедуры. Конец процедуры обозначается ключевым словом endp. Например:

```asm
myProcedure proc
    ; тело процедуры
myProcedure endp
```

== Ваша программа состоит из главной процедуры и процедур-подпрограмм. Каким может быть взаимное расположение главной процедуры и подпрограмм?
Главная процедура может располагаться как перед подпрограммами, так и после них. Это зависит от предпочтений программиста и структуры программы. Важно лишь правильно организовать вызовы процедур, чтобы компилятор мог их найти.

== Как процессор использует стек при работе с любой процедурой?
При вызове процедуры адрес возврата (то есть адрес следующей инструкции после вызова) помещается в стек. Это позволяет процессору вернуться к правильному месту после завершения выполнения процедуры. Стек работает по принципу "последний пришёл — первый вышел" (LIFO). Когда процедура завершается, адрес возврата извлекается из стека, и управление передаётся обратно в программу.

== С помощью какой команды вызывается процедура? Как меняется значение регистра SP после вызова процедуры? Приведите пример из вашей таблицы трассировки.
Процедура вызывается с помощью команды call. При выполнении этой команды значение регистра SP (Stack Pointer) уменьшается на размер адреса возврата (обычно на 2 байта для 16-битных адресов). Например:

```asm
call myProcedure ; SP уменьшается на 2
```

Если перед вызовом SP равен 0x1000, то после вызова он станет 0x0FFE.

== После какой команды процедуры из стека извлекается адрес возврата?
Адрес возврата извлекается из стека после выполнения команды ret. Эта команда не только возвращает управление обратно по адресу, который был сохранён в стеке, но также увеличивает указатель стека SP на размер адреса возврата:

```asm
ret ; Извлечение адреса возврата из стека
```

Эти ответы должны дать вам полное понимание работы с процедурами и основами ассемблера TASM. Если у вас есть дополнительные вопросы или нужна помощь с конкретными аспектами, не стесняйтесь спрашивать!