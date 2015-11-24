<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DodajApartament.aspx.cs" Inherits="DodajApartament" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .textDA
        {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2 align="left" style="color: #0000FF">
        Dodaj nowy apartament
        
        </h2>
    <fieldset class="accountInfo">
        <legend>Uzupełnij parametry apartamentu</legend>
    <p>
        <asp:Label ID="OpisLabel" runat="server" Text="Opis">Opis apartamentu:</asp:Label>&nbsp&nbsp
        <asp:TextBox ID="Opis" runat="server" CssClass="textDA" Height="20px" 
            Width="547px" ></asp:TextBox>
        
    </p>
    <p>
        <asp:Label ID="LokalizacjaLabel" runat="server" Text="Lokalizacja">Lokalizacja:</asp:Label>&nbsp&nbsp
        <asp:TextBox ID="Lokalizacja" runat="server" CssClass="textDA" Height="20px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="AdresLabel" runat="server" Text="Adres">Adres:</asp:Label>&nbsp&nbsp
        <asp:TextBox ID="Adres" runat="server" CssClass="textDA" Height="20px"></asp:TextBox>
    </p>
     <p>
        <asp:Label ID="IloscMiejscLabel" runat="server" Text="IloscMiejsc">Ilość miejsc:</asp:Label>&nbsp&nbsp
        <asp:TextBox ID="IloscMiejsc" runat="server" CssClass="textDA" Height="20px" Width="31px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="WyposazenieLabel" runat="server" Text="Wyposażenie">Wyposażenie:</asp:Label>&nbsp&nbsp
        <asp:TextBox ID="Wyposazenie" runat="server" CssClass="textDA" Height="20px" Width="586px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Dodaj apartament" 
            onclick="Button1_Click" />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Pomyślnie dodano apartament" Visible="False"></asp:Label>&nbsp&nbsp
        
    </p>
    </fieldset>
    
</asp:Content>

