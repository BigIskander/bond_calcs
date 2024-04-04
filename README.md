# bond_calcs

[На русском](README_RUS.md)

This is macros to calculate bond price and bond duration.

These macroses can be used with **Microsoft Excel** as well as with **LibreOffice Calc**.

I used these macroses for my scientific research. For those who interested, list of my scientific papers available by [this link](https://bigiskander.github.io/my_science_papers.html) (in Russian).

These macroses (created) written in order to be used with data from **Compustat** database and was written according with data representation specifics of this dtabase.

Below is the description of computational formulas and instruction how to use these macroses.

***Formulas:***

*Formula to calculate the price of coupon paying bond:*

$$  %this formula is written in LaTeX format%
P =\left( \frac{c}{f} \right) * \left( \frac{a * f}{ \left(1 + y\right)^a } + \sum \limits_{i=1}^{n} \frac{1}{ \left(1 + y\right)^{ \frac{i}{f} + a } } \right) + \frac{1}{ \left(1 + y\right)^{m} } 
$$

*Formula to calculate the price of bond paying only one coupon at maturity:*

$$  %this formula is written in LaTeX format% 
P =\frac{1 + c * m}{ \left(1 + y\right)^{m} } 
$$

*Формула расчета дюрации купонной облигации:*

$$ %this formula is written in LaTeX format% 
D = \frac{
    \left( \frac{c}{f} \right) * \left( \frac{ a * \left(a * f\right) }{ \left(1 + y\right)^a } + \sum \limits_{i=1}^{n} \frac{ \left( \frac{i}{f} + a \right) }{ \left(1 + y\right)^{ \frac{i}{f} + a } } \right) + \frac{m}{ \left(1 + y\right)^{m} }
}{
    \left( \frac{c}{f} \right) * \left( \frac{a * f}{ \left(1 + y\right)^a } + \sum \limits_{i=1}^{n} \frac{1}{ \left(1 + y\right)^{ \frac{i}{f} + a } } \right) + \frac{1}{ \left(1 + y\right)^{m} }
}
$$

*Формула расчета дюрации облигации с выплатой купона при погашении:*

$$ %this formula is written in LaTeX format% 
D = \frac{
    \left( \frac{ m * \left(1 + c * m\right) }{ \left(1 + y\right)^{m} } \right)
}{
    \left( \frac{1 + c * m}{ \left(1 + y\right)^{m} } \right)
}
$$

***Описание переменных:***

*P* - цена облигации при размещении (посчитанная как процент (доля) от номинала облигации)

*D* - дюрация облигации при размещении (посчитанная как процент (доля) от продолжительности базового периода)

*c* - coupon rate (в процентах (долях) от номинала облигации)

*f* - частота купонных платежей (число купонных платежей в базовый период)

*a* - продолжительность первого неполного купоннога периода (посчитанная как процент (доля) от продолжительности базового периода)

*n* - число полных купонных платежей (или периодов)

*m* - срок до погашения облигации (посчитанная как процент (доля) от продолжительности базового периода)

*y* - доходность к погашению (в процентах (долях) от номинала облигации)

***Примечания:***

1) Показатель coupon rate представляется в базе Compustat в уже рассчитанном виде, но при необходимости coupon rate можно посчитать как:

$$ %this formula is written in LaTeX format%
c = \frac{ \sum c_i }{m}
$$

где *c* - coupon rate, $c_i$ - отдельный купонный платеж (как процент (доля) от номинала), m - срок до погашения (смотрите выше)

2) Дата первого купонного платежа часто бывает указана в базе **Compustat**.

3) В базе **Compustat** для всех облигаций указан номинал равный 1.00 (или 100%). Цена облигации, coupon rate и доходность к погашению указываются, как процент (доля) от номинала.

4) Продолжительность базового периода, обычно составляет 1 год. Но могут встречаться облигации и с другой продолжительностю базового периода.

***Как использовать:***

1) В Microsoft Excel или в LibreOffice Calc открыть редактор макросов.

2) Импортировать макрос (файл **bond_calcs.bas**) или, как альтернативный вариант, можно скопировать и вставить содержимое файла **bond_calcs.bas** в редактор макросов.

3) Использовать как обычную формулу в Microsoft Excel или в LibreOffice Calc, т.е. в нужную ячейку таблицы прописать формулу (функцию):

    - `=CalcPrice(y; c; f; m; a)` или `=CALCPRICE(y; c; f; m; a)` - для расчета цены облигации
    - `=CalcDurat(y; c; f; m; a)` или `=CALCDURAT(y; c; f; m; a)` - для расчета дюрации облигации
    - где вместо *y*, *c*, *f*, *m*, *a* указать конкретные цифры (описание переменных смотрите выше)
    - если облигация с выплатой купона при погашении, то *f* указать как *0* (цифра ноль)
    - если дата первого купонного платежа не указана, то *a* указать как *0* (цифра ноль)
