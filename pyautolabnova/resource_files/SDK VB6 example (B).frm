VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3444
   ClientLeft      =   60
   ClientTop       =   456
   ClientWidth     =   5100
   LinkTopic       =   "Form1"
   ScaleHeight     =   3444
   ScaleWidth      =   5100
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Celloff 
      Caption         =   "Cell off"
      Height          =   735
      Left            =   1320
      TabIndex        =   1
      Top             =   1800
      Width           =   1935
   End
   Begin VB.CommandButton Cellon 
      Caption         =   "Cell on"
      Height          =   735
      Left            =   1320
      TabIndex        =   0
      Top             =   720
      Width           =   1935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim MyAutolab As New Instrument

Private Sub Form_Load()

    MyAutolab.HardwareSetupFile = "C:\Program Files\Metrohm Autolab\Autolab SDK 1.10\Hardware Setup Files\PGSTAT302N\HardwareSetup.FRA32M.xml"
    MyAutolab.AutolabConnection.EmbeddedExeFileToStart = "C:\Program Files\Metrohm Autolab\Autolab SDK 1.10\Hardware Setup Files\adk.x"
    'To connect the instrument, fill in the proper Autolab s/n	
    MyAutolab.Connect "AUT8xxxx", True

End Sub

Private Sub Form_Unload(Cancel As Integer)
    
    MyAutolab.Disconnect

End Sub

Private Sub Celloff_Click()

    MyAutolab.EI.CellOnOff = EICellOnOff_Off

End Sub

Private Sub Cellon_Click()
    
    MyAutolab.EI.CellOnOff = EICellOnOff_On
    
End Sub
