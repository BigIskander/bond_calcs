# bond_calcs

[In english](README.md)

Это макросы для рассчета цены облигации и дюрации облигации.

Я применял эти макросы для своих научных расчетов.

Макросы предназначены (написаны) для расчетов на данных с базы данных **Compustat** и написаны с учетом особенностей представления данных в этой базе.

Формула рассчета цены купонной облигации:

$$  %this formula is written in LaTeX format%
P =\left( \frac{c}{f} \right) * \left( \frac{a * f}{ \left(1 + y\right)^a } + \sum \limits_{i=1}^{n} \frac{1}{ \left(1 + y\right)^{ \frac{i}{f} + a } } \right) + \frac{1}{ \left(1 + y\right)^{m} } 
$$

Формула расчета цены облигации с выплатой купона при погашении:

$$  %this formula is written in LaTeX format% 
P =\frac{1 + c * m}{ \left(1 + y\right)^{m} } 
$$

Формул расчета дюрации купонной облигации:

$$ %this formula is written in LaTeX format% 
D = \frac{
    \left( \frac{c}{f} \right) * \left( \frac{ a * \left(a * f\right) }{ \left(1 + y\right)^a } + \sum \limits_{i=1}^{n} \frac{ \left( \frac{i}{f} + a \right) }{ \left(1 + y\right)^{ \frac{i}{f} + a } } \right) + \frac{m}{ \left(1 + y\right)^{m} }
}{
    \left( \frac{c}{f} \right) * \left( \frac{a * f}{ \left(1 + y\right)^a } + \sum \limits_{i=1}^{n} \frac{1}{ \left(1 + y\right)^{ \frac{i}{f} + a } } \right) + \frac{1}{ \left(1 + y\right)^{m} }
}
$$

Формула рассчета дюрации облигации с выплатой купона при погашении:

$$ %this formula is written in LaTeX format% 
D = \frac{
    \left( \frac{ m * \left(1 + c * m\right) }{ \left(1 + y\right)^{m} } \right)
}{
    \left( \frac{1 + c * m}{ \left(1 + y\right)^{m} } \right)
}
$$

Описание переменных:
...

[список моих научных публикаций](https://bigiskander.github.io/my_science_papers.html).
