# bond_calcs

Формулы расчета цены облигации:

$$  %this formula is written in LaTeX format%
P =\left( \frac{c}{f} \right) * \left( \frac{a * f}{ \left(1 + y\right)^a } + \sum \limits_{i=1}^{n} \frac{1}{ \left(1 + y\right)^{ \frac{i}{f} + a } } \right) + \frac{1}{ \left(1 + y\right)^{m} } 
$$

$$  %this formula is written in LaTeX format% 
P =\frac{1 + c * m}{ \left(1 + y\right)^{m} } 
$$

Формулы расчета дюрации облигации:

$$ %this formula is written in LaTeX format% 
D = \frac{
    \left( \frac{c}{f} \right) * \left( \frac{ a * \left(a * f\right) }{ \left(1 + y\right)^a } + \sum \limits_{i=1}^{n} \frac{ \left( \frac{i}{f} + a \right) }{ \left(1 + y\right)^{ \frac{i}{f} + a } } \right) + \frac{m}{ \left(1 + y\right)^{m} }
}{
    \left( \frac{c}{f} \right) * \left( \frac{a * f}{ \left(1 + y\right)^a } + \sum \limits_{i=1}^{n} \frac{1}{ \left(1 + y\right)^{ \frac{i}{f} + a } } \right) + \frac{1}{ \left(1 + y\right)^{m} }
}
$$

$$ %this formula is written in LaTeX format% 
D = \frac{
    \left( \frac{ m * \left(1 + c * m\right) }{ \left(1 + y\right)^{m} } \right)
}{
    \left( \frac{1 + c * m}{ \left(1 + y\right)^{m} } \right)
}
$$
