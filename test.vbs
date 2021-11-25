             Dim ObjXML, fileinput, Root, NodeList, Msg, name ' Deklaruojami kintamieji reikalingi atidaryti xml failui
             Dim Pirkejas,DokumentoSerija, DokumentoNr, SumaSuPVM, DokumentoData 'Deklaruojami kintamieji xml failo atributams
             Set ObjXML = CreateObject ("Microsoft.XMLDOM")   ' Sukuriamas objektas
             ObjXML.async = False
             fileinput = "C:\Test\SASKAITA SKIRTA TESTUOTI.xml" 'priskyriame xml faila kintamajam
				ObjXML.load(fileinput) 'fukcija užkraunanti xml failo duomenys			 
             Set Root = ObjXML.documentElement 
             Set NodeList = Root.getElementsByTagName("parameters")  'priskyriame kokiame segmente elementu ieškosime  
			 
			 For Each Elem In NodeList	' ciklas kurio pagalba pereinami visi elementai			 
                 Set Pirkejas = Elem.getElementsByTagName ("value") (0) 'Skliausteliuose rašomas skaičius, kuris nurodo atributą
                 Set DokumentoSerija = Elem.getElementsByTagName ("value") (6)  
                 Set DokumentoNr = Elem.getElementsByTagName ("value") (7)  
				 Set SumaSuPVM = Elem.getElementsByTagName ("value") (10)  
				 Set DokumentoData = Elem.getElementsByTagName ("value") (5) 
				 
				 'Msg kintamasis buvo naudojamas patikrinti ar atributam yra priskyriamos reikiamos reikšmės
                 Msg = "," & Pirkejas.Text & ","
                 Msg = Msg & DokumentoSerija.Text & "," 
                 Msg = Msg & DokumentoNr.Text & ","
				 Msg = Msg & SumaSuPVM.Text & ","
                 'MsgBox Msg
				 Msg1 = "Pirkejas, DokumentoSerija, DokumentoNr, SumaSuPVM"
				 'name kintamasis reikalingas sukurti pdf failui pavadinima
				 name = Pirkejas.Text & "_" & DokumentoSerija.Text & "_" & DokumentoNr.Text & "_" & SumaSuPVM.Text & "_" & DokumentoData.Text
				 
				 'kintamieji kuriems priskyriamos atitinkamos reikšmės
				 dim d, m, y
				 'Funkcija grazinanti datos diena
				 d=Day(DokumentoData.Text)
				 'Funkcija grazinanti datos menesi
				 m=Month(DokumentoData.Text)
				 'Funkcija grazinanti datos metus
				 y=Year(DokumentoData.Text)
			Next
			
			Dim objFso, Objtextwriter 'Deklaruojami kintamieji reikalingi kurti folderius, failus
			Set objFso = CreateObject("Scripting.FileSystemObject") ' Sukuriamas objektas leidžiantis naudotis atitinkamomis funkcijomis
			
			'41-69 eilutėje tikrinama ar c diske yra atitinkamas folderis ar failas
			If objFso.FolderExists("C:\Test") Then
			Else
			objFso.CreateFolder("C:\Test")
			MsgBox "Folder created successfully."
			End If
			Set Objtextwriter=objFso.CreateTextFile("C:\Test\SASKAITA SKIRTA TESTUOTI.pdf", true)
			Objtextwriter.WriteLine(Msg1)
			Objtextwriter.WriteLine(Msg)
			Objtextwriter.Close
			If objFso.FolderExists("C:\Test\Archyvas") Then
			Else
			objFso.CreateFolder("C:\Test\Archyvas")
			MsgBox "Folder created successfully."
			End If
			If objFso.FolderExists("C:\Test\Archyvas\" & y) Then
			Else
			objFso.CreateFolder("C:\Test\Archyvas\" & y & "\")
			End If
			If objFso.FolderExists("C:\Test\Archyvas\" & y & "\" & m) Then
			Else
			objFso.CreateFolder("C:\Test\Archyvas\" & y & "\" & m & "\")
			End If
			If objFso.FolderExists("C:\Test\Archyvas\" & y & "\" & m & "\" & d) Then
			Else
			objFso.CreateFolder("C:\Test\Archyvas\" & y & "\" & m & "\" & d & "\")
			End If
			If objFso.FolderExists("C:\Test\Archyvas\" & y & "\" & m & "\" & d & "\" & Pirkejas.Text) Then
			Else
			objFso.CreateFolder("C:\Test\Archyvas\" & y & "\" & m & "\" & d & "\" & Pirkejas.Text & "\")
			End If
			Set Objtextwriter=objFso.CreateTextFile("C:\Test\Archyvas\" & y & "\" & m & "\" & d & "\" & Pirkejas.Text & "\" & name & ".pdf", true)
			Objtextwriter.WriteLine(Msg1)
			Objtextwriter.WriteLine(Msg) 'Į faila įrašomi pasirinkti duomenys
			Objtextwriter.Close 'Išsaugomi pakeitimai
			Set Objtextwriter=objFso.CreateTextFile("C:\Test\Archyvas\path.txt", true)
			dim kint
			kint = ",,,,,C:\Test\Archyvas\" & y & "\" & m & "\" & d & "\" & Pirkejas.Text & "\" & name & ".pdf"
			Objtextwriter.WriteLine(kint)
			Objtextwriter.Close
			MsgBox ".pdf file created successfully."
			Set Objtextwriter=Nothing ' Objektas nebe naudojamas
			Set objFso=Nothing ' Objektas nebe naudojamas
			

  
			
			
			
