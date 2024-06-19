Rem Attribute VBA_ModuleType=VBAModule
Option VBASupport 1

'function calculates Price of the bond as percent from Nominal price (value 0.01 equals 1%)
'it is assumed that Nominal equals 1.00
'y - yield (percent per base period) (value 0.01 equals 1%)
'g - coupon rate (total coupon payment in one base period as percent from nominal price) (value 0.01 equals 1%)
'f - frequency, i.e. number of payments in one base period (equals 0 - for bond with only one coupon in the matrurity date)
'M - maturity as number of base periods
'fp - period of time before first payment (as percent from base period, equals 0 if no such period is mentioned)
Public Function CalcPrice(y As Double, g As Double, f As Integer, M As Double, Optional fp As Double = 0) As Double
    If f > 0 Then
        'full number of periods
        n = Int(f * M)
        'pay time adjustment
        a = M - (n / f)
        'first payment
        b = 1
        If fp > 0 Then
            s = (fp * f) / ((1 + y) ^ fp)
            If Round(fp, 2) > Round(a, 2) Then
                b = 1 + Round(fp * f, 0)
            End If
        Else
            s = (a * f) / ((1 + y) ^ a)
        End If
        'another payments
        For i = b To n
            s = s + 1 / ((1 + y) ^ (i / f + a))
        Next
        Cal = (g / f) * s + 1 / ((1 + y) ^ M)
    Else
        'pay at maturity bond
        Cal = (1 + g * M) / ((1 + y) ^ M)
    End If
    CalcPrice = Cal
End Function

'function calculates Duration of the bond as percent from base period (value 0.01 equals 1%)
'it is assumed that Nominal equals 1.00
'y - yield (percent per base period) (value 0.01 equals 1%)
'g - coupon rate (total coupon payment in one base period as percent from nominal price) (value 0.01 equals 1%)
'f - frequency, i.e. number of payments in one base period (equals 0 - for bond with only one coupon in the matrurity date)
'M - maturity as number of base periods
'fp - period of time before first payment (as percent from base period, equals 0 if no such period is mentioned)
Public Function CalcDurat(y As Double, g As Double, f As Integer, M As Double, Optional fp As Double = 0) As Double
    If f > 0 Then
        'full number of periods
        n = Int(f * M)
        'pay time adjustment
        a = M - (n / f)
        'first payment
        b = 1
        If fp > 0 Then
            s = (fp * (fp * f)) / ((1 + y) ^ fp)
            If Round(fp, 2) > Round(a, 2) Then
                b = 1 + Round(fp * f, 0)
            End If
        Else
            s = (a * (a * f)) / ((1 + y) ^ a)
        End If
        'another payments
        For i = b To n
            s = s + (i / f + a) / ((1 + y) ^ (i / f + a))
        Next
        Top = (g / f) * s + M / ((1 + y) ^ M)
    Else
        'pay at maturity bond
        Top = M * (1 + g * M) / ((1 + y) ^ M)
    End If
    P = CalcPrice(y, g, f, M, fp)
    CalcDurat = Top / P
End Function

Sub FindYields()
    Set xlm = Application.InputBox(Prompt:="Select Yield Column [First Cell only]", Title:="Yield", Type:=8)
    Set ylm = Application.InputBox(Prompt:="Select Sq. Price_diff Column [First Cell only]", Title:="Sq. Price_diff", Type:=8)
    num = Application.InputBox(Prompt:="Num of Bonds", Title:="Num of Bonds", Type:=1)
    If num > 0 And xlm.Row = ylm.Row And xlm.Column <> ylm.Column Then
        For i = 0 To num - 1
            SolverReset
            SolverOptions precision:=0.0001
            SolverOk SetCell:=Cells(ylm.Row + i, ylm.Column), _
            MaxMinVal:=2, _
            ValueOf:="0", _
            ByChange:=Cells(xlm.Row + i, xlm.Column)
            SolverSolve userFinish:=True
            SolverFinish KeepFinal:=1
        Next
    Else
        MsgBox ("Error!!!")
    End If
End Sub


