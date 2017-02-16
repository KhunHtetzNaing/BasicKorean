Type=Activity
Version=6.5
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
Dim t As Timer
End Sub

Sub Globals
Dim sc As ScrollView
Dim tx As Label
Dim bg As ColorDrawable
Dim Banner As AdView
Dim Interstitial As InterstitialAd
Dim p As Phone
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.Title = "ㄹအသတ္္"
	bg.Initialize(Colors.RGB(250,250,250),1)
Activity.Background = bg

	tx.Initialize("")
	tx.Text = File.ReadString(File.DirAssets,"atat4.txt")
	tx.TextColor = Colors.Black
sc.Initialize(5000dip)
Activity.AddView(sc,0%x,0%y,100%x,100%y)
sc.Panel.AddView(tx,1%x,1%y,98%x,2500dip)
sc.Height = 3000dip
	p.SetScreenOrientation(1)
	Banner.Initialize("Banner","ca-app-pub-4173348573252986/4342648557")
	Banner.LoadAd
	Activity.AddView(Banner,0%x,100%y - 50dip,100%x,50dip)
	Log(Banner)
			
	Interstitial.Initialize("Interstitial","ca-app-pub-4173348573252986/8354045753")
	Interstitial.LoadAd
			
	t.Initialize("t",30000)
	t.Enabled = True
End Sub

Sub t_Tick
	If Interstitial.Ready Then Interstitial.Show Else Interstitial.LoadAd
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
