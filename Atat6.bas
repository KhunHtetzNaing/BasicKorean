Type=Activity
Version=6.3
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
dim t as Timer
End Sub

Sub Globals
Dim sc As ScrollView
Dim tx As Label
Dim bg As ColorDrawable
Dim Banner As AdView
Dim Interstitial As mwAdmobInterstitial
dim p as Phone
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.Title = "ㅂ အသတ္"
	bg.Initialize(Colors.RGB(250,250,250),1)
Activity.Background = bg

	tx.Initialize("")
	tx.Text = File.ReadString(File.DirAssets,"atat6.txt")
	tx.TextColor = Colors.Black
sc.Initialize(5000dip)
Activity.AddView(sc,0%x,0%y,100%x,100%y)
sc.Panel.AddView(tx,1%x,1%y,98%x,2500dip)
sc.Height = 3000dip

p.SetScreenOrientation(1)
	If p.SdkVersion > 19 Then
		Banner.Initialize("Banner","ca-app-pub-4173348573252986/9432437755")
		Banner.LoadAd
		Activity.AddView(Banner,0%x,90%y,100%x,50dip)
			
			Interstitial.Initialize("Interstitial","ca-app-pub-4173348573252986/9153236156")
			Interstitial.LoadAd
			
			t.Initialize("t",120000)
			t.Enabled = True
	End If
	
End Sub

Sub t_Tick
	If Interstitial.Status = Interstitial.Status_AdReadyToShow Then
		Interstitial.Show
	End If
	If Interstitial.Status = Interstitial.Status_Dismissed Then
		Interstitial.LoadAd
	End If
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
