<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StronaInternetowaConnectionString %>" 
        
        SelectCommand="SELECT [Opis], [Lokalizacja], [Adres], [Ilość_miejsc], [Wyposazenie] FROM [Apartament]">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
        AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
            <asp:BoundField DataField="Lokalizacja" HeaderText="Lokalizacja" 
                SortExpression="Lokalizacja" />
            <asp:BoundField DataField="Adres" HeaderText="Adres" SortExpression="Adres" />
            <asp:BoundField DataField="Ilość_miejsc" HeaderText="Ilość_miejsc" 
                SortExpression="Ilość_miejsc" />
            <asp:BoundField DataField="Wyposazenie" HeaderText="Wyposazenie" 
                SortExpression="Wyposazenie" />
        </Columns>
    </asp:GridView>

</asp:Content>
