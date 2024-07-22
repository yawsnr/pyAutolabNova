VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5376
   ClientLeft      =   60
   ClientTop       =   456
   ClientWidth     =   10968
   LinkTopic       =   "Form1"
   ScaleHeight     =   5376
   ScaleWidth      =   10968
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Batch 
      Caption         =   "Batch operation"
      Height          =   615
      Left            =   480
      TabIndex        =   27
      Top             =   2400
      Width           =   1455
   End
   Begin VB.CommandButton RunCM 
      Caption         =   "Run CM"
      Height          =   375
      Left            =   2640
      TabIndex        =   26
      Top             =   720
      Width           =   1815
   End
   Begin VB.Frame Frame1 
      Caption         =   "Manual control"
      Height          =   1935
      Left            =   480
      TabIndex        =   10
      Top             =   3120
      Width           =   5175
      Begin VB.CommandButton CurRngSel 
         Caption         =   "1µA"
         Height          =   255
         Index           =   6
         Left            =   3000
         TabIndex        =   23
         Top             =   1560
         Width           =   615
      End
      Begin VB.CommandButton CurRngSel 
         Caption         =   "10µA"
         Height          =   255
         Index           =   5
         Left            =   3000
         TabIndex        =   22
         Top             =   1320
         Width           =   615
      End
      Begin VB.CommandButton CurRngSel 
         Caption         =   "100µA"
         Height          =   255
         Index           =   4
         Left            =   3000
         TabIndex        =   21
         Top             =   1080
         Width           =   615
      End
      Begin VB.CommandButton CurRngSel 
         Caption         =   "1mA"
         Height          =   255
         Index           =   3
         Left            =   3000
         TabIndex        =   20
         Top             =   840
         Width           =   615
      End
      Begin VB.CommandButton CurRngSel 
         Caption         =   "10mA"
         Height          =   255
         Index           =   2
         Left            =   3000
         TabIndex        =   19
         Top             =   600
         Width           =   615
      End
      Begin VB.CommandButton CurRngSel 
         Caption         =   "100mA"
         Height          =   255
         Index           =   1
         Left            =   3000
         TabIndex        =   18
         Top             =   360
         Width           =   615
      End
      Begin VB.CommandButton CurRngSel 
         Caption         =   "1A"
         Height          =   255
         Index           =   0
         Left            =   3000
         TabIndex        =   17
         Top             =   120
         Width           =   615
      End
      Begin VB.CommandButton Command12 
         Caption         =   "Galvanostat"
         Height          =   375
         Left            =   1800
         TabIndex        =   16
         Top             =   720
         Width           =   1095
      End
      Begin VB.CommandButton Command11 
         Caption         =   "Potentiostat"
         Height          =   375
         Left            =   1800
         TabIndex        =   15
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Cell On"
         Height          =   375
         Left            =   120
         TabIndex        =   14
         Top             =   240
         Width           =   735
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Cell Off"
         Height          =   375
         Left            =   120
         TabIndex        =   13
         Top             =   720
         Width           =   735
      End
      Begin VB.CommandButton Command10 
         Caption         =   "Hspeed"
         Height          =   375
         Left            =   960
         TabIndex        =   12
         Top             =   720
         Width           =   735
      End
      Begin VB.CommandButton Command9 
         Caption         =   "Hstab"
         Height          =   375
         Left            =   960
         TabIndex        =   11
         Top             =   240
         Width           =   735
      End
   End
   Begin VB.CommandButton RunFRA 
      Caption         =   "Run FRA"
      Height          =   375
      Left            =   2640
      TabIndex        =   9
      Top             =   1200
      Width           =   1815
   End
   Begin VB.ListBox List1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.4
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4128
      Left            =   5880
      TabIndex        =   8
      Top             =   240
      Width           =   4575
   End
   Begin VB.CommandButton LoadData 
      Caption         =   "Load data"
      Height          =   615
      Left            =   480
      TabIndex        =   7
      Top             =   1680
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4680
      Top             =   720
   End
   Begin VB.CommandButton AbortButton 
      Caption         =   "Abort"
      Height          =   375
      Left            =   4560
      TabIndex        =   6
      Top             =   240
      Width           =   1095
   End
   Begin VB.CommandButton RunCV 
      Caption         =   "Run CV"
      Height          =   375
      Left            =   2640
      TabIndex        =   2
      Top             =   240
      Width           =   1815
   End
   Begin VB.CommandButton Disconnect 
      Caption         =   "Disconnect"
      Height          =   615
      Left            =   480
      TabIndex        =   1
      Top             =   960
      Width           =   1455
   End
   Begin VB.CommandButton Connect 
      Caption         =   "Connect"
      Height          =   615
      Left            =   480
      TabIndex        =   0
      Top             =   240
      Width           =   1455
   End
   Begin VB.Label Label5 
      Caption         =   "Label5"
      Height          =   375
      Left            =   7440
      TabIndex        =   25
      Top             =   4560
      Width           =   1455
   End
   Begin VB.Label Label4 
      Caption         =   "Label4"
      Height          =   375
      Left            =   6000
      TabIndex        =   24
      Top             =   4560
      Width           =   1335
   End
   Begin VB.Label Label3 
      Height          =   255
      Left            =   2640
      TabIndex        =   5
      Top             =   2640
      Width           =   3135
   End
   Begin VB.Label Label2 
      Height          =   255
      Left            =   2640
      TabIndex        =   4
      Top             =   2280
      Width           =   3135
   End
   Begin VB.Label Label1 
      Height          =   255
      Left            =   2640
      TabIndex        =   3
      Top             =   1920
      Width           =   3135
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim MyAutolab As IInstrument
Dim MyProcedure As Procedure
Dim MyCommand As Command
Dim bIsMeasuring As Boolean
Dim bFraMeasurement As Boolean
Dim Counter As Integer
Dim CountCheckEvent As Integer

Dim MyCommandParameter As CommandParameter
Dim MyFraList As CommandParameterObjectList
Dim MyCommandParameterList As CommandParameterList

Dim MyFraCommand As FraCommand
Dim MyFraCommandList As FraCommandList

Dim MyFraDblLst As CommandParameterDoubleList
Dim GetOnce As Integer

Private Sub AbortButton_Click()
    MyProcedure.Abort
End Sub
Private Sub Batch_Click()
    
    Dim zProcName As String
    Dim zCMDataName As String
    Dim zCVDataName As String
    Dim zFRADataName As String
    Dim zAutoNum As String
    ReDim Time(1) As Double
    ReDim Potential(1) As Double
    ReDim Current(1) As Double
    ReDim freq(1) As Double
    ReDim Zs(1) As Double
    ReDim Zd(1) As Double
    ReDim Z(1) As Double
    ReDim Phi(1) As Double
    Dim i As Integer
    Dim j As Integer
            
   
    For j = 1 To 10
        zAutoNum = Format(j, "0000") + ".nox"
        zCMDataName = "C:\Autolab VB6\CM" + zAutoNum
        zCVDataName = "C:\Autolab VB6\CV" + zAutoNum
        zFRADataName = "C:\Autolab VB6\FRA" + zAutoNum
    
        'Chrono methods
        zProcName = "C:\Program Files\Metrohm Autolab\Autolab SDK 1.10\Standard Nova Procedures\Chrono amperometry.nox"
        Call DoCMMeasurement(zProcName, zCMDataName, Time(), Current())
        List1.Clear
        List1.AddItem ("Index Time  I")
        For i = 0 To UBound(Time)
            List1.AddItem (Format(i, "00000 ") + Format(Time(i) - Time(0), "0.000 ") + Format(Current(i), "0.000E+00"))
        Next i
                
        'Cyclic voltammetry
        zProcName = "C:\Program Files\Metrohm Autolab\Autolab SDK 1.10\Standard Nova Procedures\Cyclic voltammetry.nox"
        Call DoCVMeasurement(zProcName, zCVDataName, Potential(), Current())
        List1.Clear
        List1.AddItem ("Index E     I")
        For i = 0 To UBound(Potential)
            List1.AddItem (Format(i, "00000 ") + Format(Potential(i), "0.000 ") + Format(Current(i), "0.000E+00"))
        Next i
    
        'Impedance
        zProcName = "C:\Program Files\Metrohm Autolab\Autolab SDK 1.10\Standard Nova Procedures\FRA impedance potentiostatic.nox"
        Call DoFraExternalMeasurement(zProcName, zFRADataName, freq(), Z(), Phi(), Zs(), Zd())
        List1.Clear
        List1.AddItem "Index Frequency Zs        -Zd"
        For i = 0 To UBound(freq)
            List1.AddItem (Format(i, "0000  ") + Format(freq(i), "0.000E+00 ") + Format(Zs(i), "0.000E+00 ") + Format(Zd(i), "0.000E+00"))
        Next i
    Next j

End Sub

Private Sub Connect_Click()
    Set MyAutolab = New Instrument
    MyAutolab.HardwareSetupFile = "C:\Program Files\Metrohm Autolab\Autolab SDK 1.10\Hardware Setup Files\PGSTAT302N\HardwareSetup.FRA32M.xml"
    MyAutolab.AutolabConnection.EmbeddedExeFileToStart = "C:\Program Files\Metrohm Autolab\Autolab SDK 1.10\Hardware Setup Files\adk.x"
    
    'To connect the instrument, fill in the proper Autolab s/n	
    MyAutolab.Connect "AUT8xxxx", True
    MsgBox "Connected to Autolab...."
    Timer1.Enabled = True
End Sub

Private Sub Command10_Click()
    MyAutolab.EI.Bandwidth = EIBandwidth_High_Speed
End Sub

Private Sub Command11_Click()
    MyAutolab.EI.Mode = EIMode_Potentiostatic
End Sub

Private Sub Command12_Click()
    MyAutolab.EI.Mode = EIMode_Galvanostatic
End Sub

Private Sub Command2_Click()
    MyAutolab.EI.CellOnOff = EICellOnOff_On
End Sub

Private Sub Command3_Click()
    MyAutolab.EI.CellOnOff = EICellOnOff_Off
End Sub

Private Sub Disconnect_Click()
    Timer1.Enabled = False
    MyAutolab.Disconnect
End Sub

Private Sub RunCM_Click()
    
    Dim zProcName As String
    Dim zDataName As String
    ReDim Time(1) As Double
    ReDim Potential(1) As Double
    Dim i As Integer
            
    List1.Clear
    
    zProcName = "C:\Program Files\Metrohm Autolab\Autolab SDK 1.10\Standard Nova Procedures\Chrono amperometry.nox"
    zDataName = "C:\Autolab VB6\CM 0001.nox"
    
    Call DoCMMeasurement(zProcName, zDataName, Time(), Potential())
        
    List1.AddItem ("Index Time  I")
    For i = 0 To UBound(Time)
        List1.AddItem (Format(i, "00000 ") + Format(Time(i) - Time(0), "0.000 ") + Format(Potential(i), "0.000E+00"))
    Next i
   
End Sub

Private Sub RunCV_Click()
    
    Dim zProcName As String
    Dim zDataName As String
    ReDim Current(1) As Double
    ReDim Potential(1) As Double
    Dim i As Integer
            
    List1.Clear
    
    zProcName = "C:\Program Files\Metrohm Autolab\Autolab SDK 1.10\Standard Nova Procedures\Cyclic voltammetry.nox"
    zDataName = "C:\Autolab VB6\CV 0001.nox"
    
    Call DoCVMeasurement(zProcName, zDataName, Potential(), Current())
        
    List1.AddItem ("Index E     I")
    For i = 0 To UBound(Potential)
        List1.AddItem (Format(i, "00000 ") + Format(Potential(i), "0.000 ") + Format(Current(i), "0.000E+00"))
    Next i

End Sub

Private Sub RunFRA_Click()

    Dim zProcName As String
    Dim zDataName As String
    ReDim freq(1) As Double
    ReDim Zs(1) As Double
    ReDim Zd(1) As Double
    ReDim Z(1) As Double
    ReDim Phi(1) As Double
    Dim i As Integer
    
    List1.Clear
    
    zDataName = "C:\Autolab VB6\FRA 0001.nox"
    zProcName = "C:\Program Files\Metrohm Autolab\Autolab SDK 1.10\Standard Nova Procedures\FRA impedance potentiostatic.nox"
    
    Call DoFraExternalMeasurement(zProcName, zDataName, freq(), Z(), Phi(), Zs(), Zd())

    List1.AddItem "Index Frequency Zs        -Zd"
    For i = 0 To UBound(freq)
        List1.AddItem (Format(i, "0000  ") + Format(freq(i), "0.000E+00 ") + Format(Zs(i), "0.000E+00 ") + Format(Zd(i), "0.000E+00"))
    Next i

End Sub

Private Sub DoCMMeasurement(ByVal zProcedureName As String, ByVal zDataName As String, Time() As Double, Potential() As Double)
    
    Dim MyCMCommand As Command
    Dim MyList As CommandParameterDoubleList
    ReDim Time(1) As Double
    ReDim Potential(1) As Double
            
    Set MyProcedure = MyAutolab.LoadProcedure(zProcedureName)
    
    MyProcedure.Measure
    
    bIsMeasuring = True
    Label1.Caption = "Is measuring...."
    While MyProcedure.IsMeasuring
        DoEvents
    Wend
    
    MyProcedure.SaveAs zDataName
        
    Label1.Caption = "Ready..."
    bIsMeasuring = False
    
    Set MyCMCommand = MyProcedure.Commands("Record signals (>1 ms)")
    Set MyList = MyCMCommand.signals("WE(1).Potential")
    Potential = MyList.Value
    Set MyList = MyCMCommand.signals("Time")
    Time = MyList.Value

End Sub


Private Sub DoCVMeasurement(ByVal zProcedureName As String, ByVal zDataName As String, Potential() As Double, Current() As Double)
    
    Dim MyCVCommand As Command
    Dim MyList As CommandParameterDoubleList
    Dim MyCVParameter As CommandParameterDouble
    Dim MyCVParInt As CommandParameterInt
    Dim ScanRate As Double
    Dim nStopCross As Integer
    ReDim Current(1) As Double
    ReDim Potential(1) As Double
    Set MyProcedure = MyAutolab.LoadProcedure(zProcedureName)
    
    Set MyCVCommand = MyProcedure.Commands("FHCyclicVoltammetry2")
    Set MyCVParameter = MyCVCommand.CommandParameters("Scanrate")
    ScanRate = MyCVParameter.Value
    MyCVParameter.Value = 0.5
    
    Set MyCVParInt = MyCVCommand.CommandParameters("NrOfStopCrossings")
    nStopCross = MyCVParInt.Value
    MyCVParInt.Value = 4

    MyProcedure.Measure
    
    bIsMeasuring = True
    Label1.Caption = "Is measuring...."
    While MyProcedure.IsMeasuring
        DoEvents
    Wend
    
    MyProcedure.SaveAs zDataName
        
    Label1.Caption = "Ready..."
    bIsMeasuring = False
    
    Set MyCVCommand = MyProcedure.Commands("FHCyclicVoltammetry2")
    Set MyList = MyCVCommand.signals("WE(1).Current")
    Current = MyList.Value
    Set MyList = MyCVCommand.signals("SetpointApplied")
    Potential = MyList.Value

End Sub

Private Sub DoFraExternalMeasurement(ByVal zProcedureName As String, ByVal zDataName As String, Frequency() As Double, ZMeas() As Double, PhiMeas() As Double, ZsMeas() As Double, ZdMeas() As Double)
    
    Dim MyFraDataCommand As Command
    ReDim Frequency(1) As Double
    ReDim ZsMeas(1) As Double
    ReDim ZdMeas(1) As Double
    ReDim ZMeas(1) As Double
    ReDim PhiMeas(1) As Double

    Set MyProcedure = MyAutolab.LoadProcedure(zProcedureName)
    
    'To retreive data during measurment (Timer1_Timer)
    Set MyFraCommandList = MyProcedure.FraCommands
    Set MyFraCommand = MyFraCommandList.Item("!!Hidden command, this should not be displayed")
    Set MyCommand = MyFraCommand                            'Due to inheritance in .NET code

    MyProcedure.Measure

    bIsMeasuring = True
    bFraMeasurement = True
    Label1.Caption = "Is measuring...."
    While MyProcedure.IsMeasuring
        DoEvents
    Wend
    
    MyProcedure.SaveAs zDataName
    
    Label1.Caption = "Ready..."
    bFraMeasurement = False
    bIsMeasuring = False
    
    Set MyFraDataCommand = MyProcedure.Commands("FRA measurement potentiostatic")
    Set MyFraList = MyFraDataCommand.signals("Frequency")
    Frequency = MyFraList.Value
    Set MyFraList = MyFraDataCommand.signals("H_Real")
    ZsMeas = MyFraList.Value
    Set MyFraList = MyFraDataCommand.signals("H_Imaginary")
    ZdMeas = MyFraList.Value
    Set MyFraList = MyFraDataCommand.signals("H_Modulus")
    ZMeas = MyFraList.Value
    Set MyFraList = MyFraDataCommand.signals("H_Phase")
    PhiMeas = MyFraList.Value

End Sub

Private Sub Command9_Click()
    MyAutolab.EI.Bandwidth = EIBandwidth_High_Stability
End Sub

Private Sub CurRngSel_Click(Index As Integer)

    Select Case Index
        Case 0
            MyAutolab.EI.CurrentRange = EICurrentRange_CR07_1A
        Case 1
            MyAutolab.EI.CurrentRange = EICurrentRange_CR08_100mA
        Case 2
            MyAutolab.EI.CurrentRange = EICurrentRange_CR09_10mA
        Case 3
            MyAutolab.EI.CurrentRange = EICurrentRange_CR10_1mA
        Case 4
            MyAutolab.EI.CurrentRange = EICurrentRange_CR11_100uA
        Case 5
            MyAutolab.EI.CurrentRange = EICurrentRange_CR12_10uA
        Case 6
            MyAutolab.EI.CurrentRange = EICurrentRange_CR13_1uA
    End Select

End Sub

Private Sub Form_Load()

    bIsMeasuring = False
    bFraMeasurement = False

End Sub

Private Sub Timer1_Timer()
    'Dim MyFraCommandParameter As CommandParameter
    Dim idx As Integer
    ReDim FreqRT(1) As Double
    ReDim Z(1) As Double
    ReDim Phi(1) As Double
    ReDim Time(1) As Double
    ReDim Eres(1) As Double
    ReDim Ires(1) As Double
    Dim i As Integer
    
    Timer1.Enabled = False
    If bIsMeasuring Then
        If bFraMeasurement Then
            'CountCheckEvent = CountCheckEvent + 1
            Label4.Caption = Str(CountCheckEvent)
            If MyFraCommandList.Event Then
                'Wait for change event. This must be done like this otherwise system failure
                If GetOnce Then
                    Counter = Counter + 1
                    Label5.Caption = Str(Counter)
                    
                    Set MyFraDblLst = MyCommand.signals("Frequency")
                    FreqRT = MyFraDblLst.Value
                    Set MyFraDblLst = MyCommand.signals("H_Modulus")
                    Z = MyFraDblLst.Value
                    Set MyFraDblLst = MyCommand.signals("H_Phase")
                    Phi = MyFraDblLst.Value
                               
                    'Time = MyFraCommand.TimeData
                    'Eres = MyFraCommand.EResolution
                    'Ires = MyFraCommand.IResolution
                    
                    idx = UBound(FreqRT)
                    If idx > -1 Then
                        Label2.Caption = Format(FreqRT(idx), "#######.### Hz")
                        Label3.Caption = "Z=" + Format(Z(idx), "#.###E+## Ohm") + "   -Phase=" + Format(Phi(idx), "##.### Degrees")
                    End If
                    
                    GetOnce = False
                    'Erase Time, Eres, Ires, FreqRT, Z, Phi
                End If
            Else
                GetOnce = True
            End If
        Else
            Label2.Caption = "E = " + Format(MyAutolab.EI.Setpoint, "0.000 V")
            Label3.Caption = "I = " + Format(MyAutolab.EI.Current, "0.000E+00 A")
        End If
    Else
        MyAutolab.EI.Sampler.Sample
        Label2.Caption = "E = " + Format(MyAutolab.EI.Potential, "0.000 V")
        Label3.Caption = "I = " + Format(MyAutolab.EI.Current, "0.000E+00 A")
    End If
    Timer1.Enabled = True

End Sub

Private Sub LoadData_Click()

    Dim MyLoadCommand As Command
    Dim MyList As CommandParameterDoubleList
    ReDim Current(1) As Double
    ReDim Potential(1) As Double
    ReDim freq(1) As Double
    ReDim Zs(1) As Double
    ReDim Zd(1) As Double
    ReDim Z(1) As Double
    ReDim Phi(1) As Double
    Dim i As Integer

    Set MyProcedure = MyAutolab.LoadProcedure("C:\Autolab VB6\FRA 0001.nox")
    
    Set MyLoadCommand = MyProcedure.Commands("FRA measurement potentiostatic")
    Set MyFraList = MyLoadCommand.signals("Frequency")
    freq = MyFraList.Value
    Set MyFraList = MyLoadCommand.signals("Z'")
    Zs = MyFraList.Value
    Set MyFraList = MyLoadCommand.signals("-Z''")
    Zd = MyFraList.Value
    Set MyFraList = MyLoadCommand.signals("Z")
    Z = MyFraList.Value
    Set MyFraList = MyLoadCommand.signals("-Phase")
    Phi = MyFraList.Value
    
    Dim MyParam As CommandParameterDoubleList
    ReDim FrSng(1) As Double
    Set MyLoadCommand = MyProcedure.Commands("FRA single frequency")
    Set MyParam = MyLoadCommand.signals("Frequency")
    FrSng = MyParam.Value
    
    List1.AddItem "Index Frequency Zs        -Zd"
    For i = 0 To UBound(freq)
        List1.AddItem (Format(i, "0000  ") + Format(freq(i), "0.000E+00 ") + Format(Zs(i), "0.000E+00 ") + Format(Zd(i), "0.000E+00"))
    Next i

End Sub

