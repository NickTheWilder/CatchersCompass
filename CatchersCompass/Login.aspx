<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CatchersCompass.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style>
    html, body {
	    margin:0; 
	    padding:0;
	    height:100%;
        width: 100%;
    }
    body {
        background-image: url("https://i.imgur.com/8RQmWzz.jpg");
        background-size: cover;
        background-repeat: no-repeat;
        font-family: 'Roboto', sans-serif;
        color: #ffffff;
        line-height: 1.4;
        font-weight: 100;
    }
    h1, p { 
        margin:0 0 1em 
    }
    #header, #footer {
	    position:fixed;
	    width:100%;
	    left:0;
	    top:0;
	    background-image:  url("https://i.imgur.com/CRRHF1v.jpg");
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
	    height:100px;
    }
    #footer {
	    bottom:0;
	    top:auto;
    }
    .spin {
        border-radius: 50%;
        -webkit-transition: -webkit-transform .8s ease-in-out;
        transition:         transform .8s ease-in-out;
    }
    .spin:hover {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
    }
    .button1 {
        background-color: rgba(0, 0, 0, 0.0); 
        color: white; 
        border: 2px solid white;
        width: 150px;
        font-weight: bold;
    }
    .button1:hover {
        background-color: rgba(20, 20, 20, 0.5);
        color: white;
    }
    #loginform {
        position: fixed;
        width: 30%;
        height: 25%;
        top: 50%;
        left: 81%;
        margin-left: -30%;
        margin-top: -9%;
        border: 2px dashed white;
        max-width: 100%;
        background-color: transparent;
        text-align: center;
        box-shadow: 5px 5px black;

    }
    #innerloginform {
        position: relative;
        width: 96%;
        height: 91%;
        margin-left: 1.5%;
        margin-top: 1.5%;
        background-image: url(https://i.imgur.com/CRRHF1v.jpg);
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        max-width: 100%;
        border: 2px solid white;
        min-width: 35%;
    }
    #missionstate {
        position: fixed;
        width: 30%;
        height: 25%;
        top: 50%;
        left: 49%;
        margin-left: -30%;
        margin-top: -9%;
        border: 2px dashed white;
        max-width: 100%;
        background-color: transparent;
        text-align: center;
        box-shadow: 5px 5px black;
    }
    #innermissionstate {
        position: absolute;
        font-weight: normal;
        width: 96%;
        height: 91%;
        margin-left: 1.5%;
        margin-top: 1.5%;
        background-image: url(https://i.imgur.com/CRRHF1v.jpg);
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        max-width: 100%;
        border: 2px solid white;
        text-align: center;
        overflow-y: auto;
    }
    #login {
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        font-weight: bold;
        color: white; 
        border: 2px solid white;
        width: 300px;
        background-image: url(https://i.imgur.com/CRRHF1v.jpg);
        min-width: 35%;
    }
     
</style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div id="header">
            <table style ="width:100%;">
                <tr style="width:100%;">
                    <td style="width:100%; align-content: center; text-align: center;"><img src="https://i.imgur.com/OVeGlE1.png" class="spin" width="190" height="190" /></td>
                </tr>
            </table>
        </div>
        <div id="missionstate">
              <div id ="innermissionstate">
                      <br />
                      A website designed by TAMUCC Computer Science students for fishermen in an attempt to make finding the perfect fishing spot a more convienent experience.
                      <br />
                      <br />
                      Login if you've got an account, register if you dont!
              </div>
        </div>
        <div id="loginform">
            <div id="innerloginform">
                <table style="width:100%; height: 100%;">
                    <tr style="width: 33%; height: 50%;">
                        <td style="text-align: center; width: 30%;">
                            <asp:Label ID="Label1" runat="server" Text="Username" Font-Bold="False" Font-Size="18px"></asp:Label>
                        </td>
                        <td style="text-align: center; width: 70%;">
                            <asp:TextBox ID="UsernameText" runat="server" width="80%" style="position: relative;" BackColor="#FADBE0" ForeColor="Black" BorderStyle="None" Font-Size="18px" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width=100%;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UsernameText" Display="Dynamic" ErrorMessage="Enter a username" ForeColor="Tomato" Font-Bold="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="text-align: center; width: 30%;">
                        <td style="text-align: center">
                            <asp:Label ID="Label2" runat="server" Text="Password" Font-Bold="False" Font-Size="18px"></asp:Label>
                        </td>
                        <td style="text-align: center; width: 70%;">
                            <asp:TextBox ID="PasswordText" runat="server" width="80%" style="position: relative;" TextMode="Password" BackColor="#FADBE0" ForeColor="Black" BorderStyle="None" Font-Size="18px" ></asp:TextBox>
                        </td>
                        </tr>
                        <tr>
                        <td>
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordText" Display="Dynamic" ErrorMessage="Enter a password" ForeColor="Tomato" Font-Bold="True"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Label ID="LoginValid" runat="server" ForeColor="Tomato" Text="Invalid login" Visible="False" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="footer">
            <table style="width:100%">
                <tr style="width: 100%;">
                    <td style="width: 50%; text-align: right;">
                        <asp:Button ID="Button2" runat="server" CssClass="button1" Text="Submit" Height="60px" Width="200px" Font-Size="16px" OnClick="Button2_Click" CausesValidation="False" />
                    </td>
                    <td style="width: 50%; text-align: left;">
                        <asp:Button ID="Button1" runat="server" CssClass="button1" Height="60px" OnClick="Button1_Click" Text="Register" Width="200px" Font-Size="16px" CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CatcherDatabaseCon %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
    </form>
</body>
</html>
