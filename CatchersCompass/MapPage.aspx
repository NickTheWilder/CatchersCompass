<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MapPage.aspx.cs" Inherits="CatchersCompass.MapPage" %>

<!DOCTYPE html>
<script runat="server">

    protected void ButtonLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>A Basic Map</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style>
     /*change color of background window*/
    .gm-style-iw {
        height: 400px;
        width: 350px;
    }
    .iw-flexboxcontainer {
        height: 100vh;
        background-color: #b1c5d4;
        border-radius: 10px;
        display: flex;
        flex-wrap: wrap;
        align-content:flex-start;
    }
    .iw-headerbox {
        width: 90%;
        margin-left: 5%;
        margin-right: 5%;
        background-color: #71879a;
        border-radius: 25px;
        border-style: solid;
        border-width: 5px;
        border-color: white;
        text-align: center;
        height: 10%;
        margin-top: 5%;
    }
    .iw-header {
        margin: 0;
        position: relative;
        top: 50%;
        -ms-transform: translateY(-50%);
        transform: translateY(-50%);
        color: white;
        font-size: 2.5vh;
        font-weight: bold;
        text-shadow: 2px 2px #000;
    }
    .iw-img-box{
        margin-left: 4%;
        width: 40%;
        height: 20%;
        background-image: url('https://i.imgur.com/EaLtz3Y.jpg'); 
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        border-radius: 25px;
        border-style: solid;
        border-width: 5px;
        border-color: white;
        margin-top:5%;
    }
    .iw-desc-box{
        margin-left: 4%;
        width: 40%;
        background-color: #71879a;
        border-radius: 25px;
        border-style: solid;
        border-width: 5px;
        border-color: white;
        margin-top: 5%;
        font-weight: bold;
        color: white;
        font-size: 1.5vh;
        text-align: justify;
    }
    .iw-desc-box-header{
        text-align: center;
        margin-top: 2.5%;
        color: white;
        font-weight: bold;
        font-size: 2.5vh;
        text-shadow: 2px 2px #000;
    }
    #FishStatDisplay
    {
        text-align: center;
        width: 90%;
        color: white;
        font-size: 1.5vh;
        font-weight: bold;
        margin-left: 5%;
        margin-right: 5%;
        text-shadow: 0px 0px #000;
    }

    p
    {
        color: white;
        margin-left: 5%;
        margin-right: 5%;
    }
    body 
    {
	    background-color: dodgerblue;
        background-image: url("https://i.imgur.com/h0Snuxd.jpg");
        background-repeat: no-repeat;
        background-position: center;
        font-family: 'Roboto', sans-serif;
    }
    #mapbox
    {
        position: fixed;
        width: 75%;
        height: 90%;
        margin-left: 21%;
        margin-top: 2.5%;
        background-color: white;
        border-color: black;
        border-style: solid;
        border-width: 2px;
        box-shadow: 3px 3px #000000;
    }
    #infobox
    {
        position: fixed;
        width: 19%;
        height: 90%;
        margin-top: 2.5%;
        margin-left: 1%;
        background-color: white;
        border-color: black;
        border-style: solid;
        border-width: 2px;
        box-shadow: 3px 3px #000000;
        min-width: 210px;
        background-image: url("https://cdn.discordapp.com/attachments/618494310090014722/651277088514637824/1159342-popular-white-background-wallpaper-iphone-1080x1920-download_copy.jpg");_
    }
    #menubox
    {
        position: relative;
        top: 20%;
        height: 80%;
        width: 100%;
    }
    .spin
    {
        border-radius: 50%;
        -webkit-transition: -webkit-transform .8s ease-in-out;
        transition:         transform .8s ease-in-out;
    }
    .spin:hover 
    {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
    }
    .menubutton {
        background-color: transparent;
        color: black;
    }

    .menubutton.hover {
        background-color: #4CAF50;
        color: white;
        background-color: dodgerblue;
    }

    .fill-width 
    {
         flex: 1;
    }
    .auto-style1 
    {
         width: 50%;
    }
    .auto-style2 
    {
         width: 50%;
    }
    .auto-style3 
    {
        color: dimgray;
        font-weight: bold;
        text-align: center;
        height: 40px;
    }
    .auto-style4 
    {
        width: 50%;
    }
    #windowbox
    {
        width: 250px;
        height: 400px;
        background-color: royalblue;
        color: white;
    }
    </style>
    <script>
        function initMap() {
            var mapOptions = {
                zoom: 10,
                center: new google.maps.LatLng(27.77, -97.291),
                mapTypeId: 'roadmap',
                panControl: false,
                zoomControl: true,
                mapTypeControl: true,
                scaleControl: false,
                streetViewControl: false,
                overviewMapControl: false,
                rotateControl: false,
                fullscreenControl: false
            };
            var map = new google.maps.Map(document.getElementById('googleMap'), mapOptions);

            $.ajax({
                type: "GET",
                async: true,
                url: "/Fish.xml",
                dataType: "xml",
                success:
                    function (xml) {
                        var places = xml.documentElement.getElementsByTagName("Fish");
                        for (var i = 0; i < places.length; i++) {
                            var lat = places[i].getElementsByTagName("FishLatitude")[0].childNodes[0].nodeValue;
                            var long = places[i].getElementsByTagName("FishLongitude")[0].childNodes[0].nodeValue;
                            var bio = "Fisherman: " + places[i].getElementsByTagName("FishFisherman")[0].childNodes[0].nodeValue + "  Fish: " + places[i].getElementsByTagName("FishSpecies")[0].childNodes[0].nodeValue;
                            var latLng = new google.maps.LatLng(lat, long);
                            var image = 'https://i.imgur.com/FK4G53R.png';
                            var cont = '<div class="iw-content">'
                                + '<div class=iw-flexboxcontainer>'
                                + '<div class=iw-headerbox>'
                                + '<div class=iw-header>'
                                + places[i].getElementsByTagName("FishFisherman")[0].childNodes[0].nodeValue
                                + " Caught a "
                                + places[i].getElementsByTagName("FishSpecies")[0].childNodes[0].nodeValue
                                + '<table id="FishStatDisplay"><tr><td> Weight: ' + places[i].getElementsByTagName("FishWeight")[0].childNodes[0].nodeValue + ' lbs'
                                + '</td><td> Length: ' + places[i].getElementsByTagName("FishLength")[0].childNodes[0].nodeValue + ' in'
                                + '</td></tr></table>'
                                + '</div>'
                                + '</div>'
                                + '<div class="iw-img-box">'
                                + '</div>'
                                + '<div class="iw-desc-box">'
                                + '<div class="iw-desc-box-header">'
                                + "Fishing Tales"
                                + '</div><p>'
                                + places[i].getElementsByTagName("FishDescription")[0].childNodes[0].nodeValue
                                + '</p></div>'
                                + '</div>';
                            var marker = new google.maps.Marker({
                                position: latLng,
                                map: map,
                                title: bio,
                                icon: image,
                                content: cont,
								animation: google.maps.Animation.DROP
                            });   

                            var infoWindow = new google.maps.InfoWindow();
                            google.maps.event.addListener(marker, 'click', function () {
                                infoWindow.setContent(this.content);
                                infoWindow.open(this.getMap(), this);
                            });
                        }
                    }
            });

            //Gets location on click
            google.maps.event.addListener(map, 'click', function (e) {
                var num = e.latLng.lat();
                var num1 = e.latLng.lng();
                num = num.toFixed(6);
                num1 = num1.toFixed(6);
                document.getElementById('Label2').innerHTML = num;
                document.getElementById("lbl2").value = num;
                document.getElementById('Label1').innerHTML = num1;
                document.getElementById("lbl1").value = num1;
            });

            function getComment(marker, infowindow) {
                var message = "Hello";
                infowindow.setContent(message);
                infowindow.open(map, marker);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="lbl1" runat="server" />
        <input type="hidden" id="lbl2" runat="server" />
        <div id="infobox">
            <table style="width: 100%">
                <tr style="width: 20%; height: 40px;">
                    <td style="width:100%; align-content: center; text-align: center;"><img src="https://i.imgur.com/OVeGlE1.png" class="spin" width="150" height="150" /></td>
                </tr>
                <tr style="width: 20%; height: 40px;">
                </tr>
                <tr></tr>
                <tr></tr>
                <tr style="width: 100%; height: 40px;">
                    <td style="text-align: center;" class="auto-style4">
                        <asp:Label ID="LabelDesc" runat="server" Text="To set marker on the map click on the map to set the coordinates, fill out the form below, and then click submit when done!" Font-Bold="True" Font-Italic="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr style="height: 40px;" >
                    <td class="auto-style1">
                        <asp:Label ID="SpeciesLabel" runat="server" Text="Species:" style="text-align: left;"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="SpeciesBox" width="80%" style="position: relative;" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height: 40px;">
                    <td class="auto-style1">
                        <asp:Label ID="LengthLabel" runat="server" Text="Length: " style="text-align: left;"></asp:Label>
                        <asp:Label ID="InLabel" runat="server" Text="(in)" ForeColor="#999999"></asp:Label>
                    <td class="auto-style2">
                        <asp:TextBox ID="LengthBox" width="80%" style="position: relative;" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height: 40px;">
                    <td class="auto-style1">
                        
                        <asp:Label ID="WeightLabel" runat="server" Text="Weight: " style="text-align: left;"></asp:Label>
                        
                        <asp:Label ID="PoundLabel" runat="server" Text="  (lbs)" ForeColor="#999999"></asp:Label>
                        
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="WeightBox" width="80%" style="position: relative;" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height: 40px;">
                    <td class="auto-style1">
                        
                        <asp:Label ID="DescriptionLabel" runat="server" Text="Description:" style="text-align: left;"></asp:Label>
                        
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="DescriptionBox" width="80%" style="position: relative;" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:40px;">
                    <td class="auto-style1">
                        <asp:Label ID="DescriptionLabel0" runat="server" Text="Lat &amp; Long:" style="text-align: left;"></asp:Label>  
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="width: 20%; ">
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Unselected"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="Unselected"></asp:Label>
                    </td>
                </tr>
                <tr style="height: 40px;">
                    <td style="text-align: center; " class="auto-style4">
                        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Submit_Click" Width="130px" Height="25px"/>
                    </td>
                    <td style="text-align: center; " class="auto-style4">

                        <asp:Button ID="ButtonLogout" runat="server" Height="25px" Text="Logout" Width="130px" OnClick="ButtonLogout_Click" CausesValidation="False" />

                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div id="mapbox">
        <div id="googleMap" style="width:100%;height:100%;"></div>
    </div>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASPpPzFRSvZNqTIbJ-dRAObwTScTNoEpI&callback=initMap"></script>
</body>
</html>
