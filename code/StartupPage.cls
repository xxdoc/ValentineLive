VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "StartupPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'======================================
'   ҳ�������
    Dim Page As GPage
    Dim Step As Single, LTime As Long
'======================================

Public Sub Update()
    '��Ϸÿһ֡�Ĺ��̣����ƹ�������ڴ˴���
    
    Page.Clear 0 '��ջ���

    '================================================================
    '   ʾ������������
    '   Page.Writes "��������", 20,20, Color:=argb(255, 0, 0, 0)
    '================================================================
    
    Dim pro As Single, tpro As Single
    
    pro = (GetTickCount - LTime) / IIf(Step = 11, 1000, 200)
    tpro = 1
    If Step = 11 Then tpro = 1 - pro
    If pro > 1 Then
        If Step = 11 Then ECore.NewTransform transFadeIn, 1000, "GamePage"
        If Step = 10 Then SE.Play "battle.wav"
        If Step <= 6 Then SE.Play "switch.wav"
        If Step < 11 Then LTime = GetTickCount: pro = 1: Step = Step + 0.5
    End If
    
    If Step > 1 Then Page.DrawImage "h2.png", GW / 2 - 100 * tpro, GH / 2 - 50 * tpro, alpha:=IIf(Step < 2, IIf(GetTickCount Mod 200 < 100, 1, 0), 1), pos:=posOnCenter
    If Step > 2 Then Page.DrawImage "h3.png", GW / 2 + 100 * tpro, GH / 2 - 50 * tpro, alpha:=IIf(Step < 3, IIf(GetTickCount Mod 200 < 100, 1, 0), 1), pos:=posOnCenter
    If Step > 3 Then Page.DrawImage "h4.png", GW / 2 - 100 * tpro, GH / 2, alpha:=IIf(Step < 4, IIf(GetTickCount Mod 200 < 100, 1, 0), 1), pos:=posOnCenter
    If Step > 4 Then Page.DrawImage "h5.png", GW / 2 + 100 * tpro, GH / 2, alpha:=IIf(Step < 5, IIf(GetTickCount Mod 200 < 100, 1, 0), 1), pos:=posOnCenter
    If Step > 5 Then Page.DrawImage "h6.png", GW / 2 - 100 * tpro, GH / 2 + 50 * tpro, alpha:=IIf(Step < 6, IIf(GetTickCount Mod 200 < 100, 1, 0), 1), pos:=posOnCenter
    If Step > 6 Then Page.DrawImage "h7.png", GW / 2 + 100 * tpro, GH / 2 + 50 * tpro, alpha:=IIf(Step < 7, IIf(GetTickCount Mod 200 < 100, 1, 0), 1), pos:=posOnCenter
    If Step > 0 Then Page.DrawImage "h1.png", GW / 2, GH / 2 - 100 * tpro, alpha:=IIf(Step < 1, IIf(GetTickCount Mod 200 < 100, 1, 0), 1), pos:=posOnCenter

End Sub
Public Sub Wheel(Direction As Integer, Depth As Single)
    '�������¼�
    'Direction:����Depth�����
End Sub
Public Sub AnimationMsg(id As String, msg As String)
    '������Ϣ����
End Sub
Public Sub Enter()
    'ҳ������¼�
    LTime = GetTickCount
End Sub
Public Sub Leave()
    'ҳ���뿪�¼�
End Sub
Public Sub Gotfocus()
    '����ȡ�ý����¼�
End Sub
Public Sub Lostfocus()
    '����ʧȥ�����¼�
End Sub
Public Sub AnimationDone(id As Integer)
    '�������Ž����¼�
    'id�������Ķ���ID
End Sub
Private Sub Class_Initialize()
    '����ҳ�������
    Set Page = New GPage
    Page.Create Me
    '������Ϸ��Դ
    Page.Res.NewImages App.path & "\assets", 0.35
    '����ҳ��
    ECore.Add Page, "StartupPage"
    
    '===============================================
    '   �����Ҫ���Ӷ�����������ڴ˴�
    
    '===============================================
End Sub