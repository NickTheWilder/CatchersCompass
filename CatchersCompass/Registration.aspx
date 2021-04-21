<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CatchersCompass.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Conor</title>
<style>
    html, body 
    {
	    margin:0; 
	    padding:0;
	    height:100%;
        width: 100%;
    }
    body
    {
        background-image: url("https://i.imgur.com/8RQmWzz.jpg");
        background-size: cover;
        background-repeat: no-repeat;
        font-family: 'Roboto', sans-serif;
        color: #ffffff;
        line-height: 1.4;
        font-weight: 100;
    }
    h1, p 
    { 
        margin:0 0 1em 
    }
    #header, #footer 
    {
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
    #footer 
    {
	    bottom:0;
	    top:auto;
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
    .button 
    {
          background-color: #4CAF50; 
          border: none;
          color: white;
          padding: 16px 32px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 16px;
          margin: 4px 2px;
          -webkit-transition-duration: 0.4s; 
          transition-duration: 0.4s;
          cursor: pointer;
    }
    .button1 
    {
        background-color: rgba(0, 0, 0, 0.0); 
        color: white; 
        border: 2px solid white;
        width: 150px;
        font-weight: bold;
    }
    .button1:hover 
    {
        background-color: rgba(20, 20, 20, 0.5);
        color: white;
    }
    #divbox
    {
        position: fixed;
        width: 50%;
        height: 40%;
        top: 50%;
        left: 65%;
        margin-left: -40%;
        margin-top: -10%;
        border: 2px dashed white;
        max-width: 100%;
        background-color: transparent;
        text-align: center;
        box-shadow: 5px 5px black;

    }
    #innerdivbox
    {
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
    }

    .auto-style1 {
        height: 25%;
    }

    .auto-style2 {
        width: 100%;
    }

    .auto-style3 {
        height: 26px;
    }

</style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
            <table style ="width:100%;">
                <tr style="width:100%;">
                    <td style="width:100%; align-content: center; text-align: center;">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CatcherDatabaseCon %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                        <img src="https://i.imgur.com/OVeGlE1.png" class="spin" width="190" height="190" /></td>
                </tr>
            </table>
        </div>
        <div id="divbox">
            <div id="innerdivbox">
                
                <table style="width:100%; height: 100%;">
                    <tr style="width: 33%; height: 25%;">
                        <td style="text-align: center">
                            <asp:Label ID="Label1" runat="server" Text="Username" Font-Bold="False" Font-Size="18px"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="UsernameText" runat="server" BackColor="#FADBE0" ForeColor="Black" BorderStyle="None" OnTextChanged="UsernameText_TextChanged" AutoPostBack="True" Font-Size="18px"></asp:TextBox>
                        </td>
                        <td>
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UsernameText" ErrorMessage="Username is required" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="width: 33%; ">
                        <td style="text-align: center" class="auto-style1">
                            <asp:Label ID="Label2" runat="server" Text="Email" Font-Bold="False" Font-Size="18px"></asp:Label>
                        </td>
                        <td style="text-align: left" class="auto-style1">
                            <asp:TextBox ID="EmailText" runat="server" TextMode="Email" BackColor="#FADBE0" ForeColor="Black" BorderStyle="None" OnTextChanged="EmailText_TextChanged" AutoPostBack="True" Font-Size="18px"></asp:TextBox>
                        </td>
                        <td class="auto-style1">
                            <table style="width:100%;">
                                <tr>
                                    <td class="auto-style3">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmailText" ErrorMessage="Email is required" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="width: 33%; height: 25%;">
                        <td style="text-align: center">
                            <asp:Label ID="Label3" runat="server" Text="Password" Font-Bold="False" Font-Size="18px"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="PasswordText" runat="server" TextMode="Password" BackColor="#FADBE0" ForeColor="Black" BorderStyle="None" Font-Size="18px"></asp:TextBox>
                        </td>
                        <td>
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PasswordText" ErrorMessage="Password is Required" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PasswordText" ControlToValidate="CPasswordText" ErrorMessage="Passwords must match" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="width: 33%; height: 25%;">
                        <td style="text-align: center">
                            <asp:Label ID="Label4" runat="server" Text="Confirm Password" Font-Bold="False" Font-Size="18px"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="CPasswordText" runat="server" TextMode="Password" BackColor="#FADBE0" ForeColor="Black" BorderStyle="None" Font-Size="18px"></asp:TextBox>
                        </td>
                        <td>
                            <table class="auto-style2">

                                <tr>
                                    <td>
                                        &nbsp;</td>
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
                    <td style="text-align: right;">
                        <asp:Button ID="Button2" runat="server" CssClass="button1" Height="60px" OnClick="Button1_Click" Text="Submit" Width="200px" Font-Size="16px" />
                    </td>

                    <td style="text-align: left;">

                        <asp:Button ID="Button3" runat="server" CssClass="button1" Height="60px" Width="200px" Font-Size="16px" Text="Back" CausesValidation="False" OnClick="Button3_Click" />

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
