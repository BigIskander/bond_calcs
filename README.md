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

*Formula to calculate the duration of coupon paying bond:*

$$ %this formula is written in LaTeX format% 
D = \frac{
    \left( \frac{c}{f} \right) * \left( \frac{ a * \left(a * f\right) }{ \left(1 + y\right)^a } + \sum \limits_{i=1}^{n} \frac{ \left( \frac{i}{f} + a \right) }{ \left(1 + y\right)^{ \frac{i}{f} + a } } \right) + \frac{m}{ \left(1 + y\right)^{m} }
}{
    \left( \frac{c}{f} \right) * \left( \frac{a * f}{ \left(1 + y\right)^a } + \sum \limits_{i=1}^{n} \frac{1}{ \left(1 + y\right)^{ \frac{i}{f} + a } } \right) + \frac{1}{ \left(1 + y\right)^{m} }
}
$$

*Formula to calculate the duration of bond paying only one coupon at maturity:*

$$ %this formula is written in LaTeX format% 
D = \frac{
    \left( \frac{ m * \left(1 + c * m\right) }{ \left(1 + y\right)^{m} } \right)
}{
    \left( \frac{1 + c * m}{ \left(1 + y\right)^{m} } \right)
}
$$

***Description of variables:***

*P* - bond price at issue (calculated as percent (part) of bond's nominal value)

*D* - bond duration at issue (calculated as percent (part) of bond's base period)

*c* - coupon rate (as percent (part) of bond's nominal value)

*f* - frequency of coupon payments (number of coupon payments in base period)

*a* - legth of first incomplety coupon period (calculated as percent (part) of base period)

*n* - number of complete coupn payments (or periods)

*m* - time to maturity of the bond (calculated as percent (part) of base period)

*y* - yield to maturity (calculated as percent (part) of bond's nominal value)

***Notes:***

1) Coupon rate is provided as already calculated value in Compustat database, however if need coupon rate can be calculated as:

$$ %this formula is written in LaTeX format%
c = \frac{ \sum c_i }{m}
$$

where *c* - coupon rate, $c_i$ - separate coupon payment (as percent (part) of nominal value), m - time to maturity (look higher)

2) Date of first coupon payment frequently is mentioned in **Compustat** database.

3) In **Compustat** database for all bonds nominal value is mentioned as 1.00 (or 100%). Bond price, coupon rate and yield to maturity represented as percent (part) of bond's nominal value.

4) The length of base period usually 1 year. However there are also bonds with different length of base period.

***How to use:***

1) In Microsoft Excel or in LibreOffice Calc open macros editor.

2) Import macros (file **bond_calcs.bas**) or as alternative, you can just copy and paste the content of **bond_calcs.bas** file into macros editor.

3) Use it as usual formula in Microsoft Excel or in LibreOffice Calc, i.e. write formula (function) in necessary cell of a table: 

    - `=CalcPrice(y; c; f; m; a)` or `=CALCPRICE(y; c; f; m; a)` - to calculate bond price
    - `=CalcDurat(y; c; f; m; a)` or `=CALCDURAT(y; c; f; m; a)` - to calculate bond duration
    - where instead of *y*, *c*, *f*, *m*, *a* put particular number (the description of variables look higher)
    - if bond pays only one coupon at maturity, then *f* put as *0* (number zero)
    - if date of first coupon payment is not mentioned, then *a* put as *0* (number zero)

