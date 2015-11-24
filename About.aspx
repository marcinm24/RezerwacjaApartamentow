<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2 align="left" style="color: #0000FF">
        Rezerwowane apartamenty
        
        </h2>
    &nbsp;
             <fieldset class="accountInfo">   
             <legend>Twoje rezerwacje</legend>
    <p>
       <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Wlasciciel">
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Klient">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
            AutoGenerateColumns="False" DataKeyNames="ID_Rezerwacji">
            <Columns>
                <asp:BoundField DataField="ID_Rezerwacji" HeaderText="Numer rezerwacji" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ID_Rezerwacji" />
                <asp:BoundField DataField="Czas_od" HeaderText="Czas od" 
                    SortExpression="Czas_od" />
                <asp:BoundField DataField="Czas_do" HeaderText="Czas do" 
                    SortExpression="Czas_do" />
                <asp:BoundField DataField="Status" HeaderText="Status" 
                    SortExpression="Status" />
                <asp:BoundField DataField="Komentarz" HeaderText="Komentarz" 
                    SortExpression="Komentarz" />
                <asp:BoundField DataField="ID_Apartamentu" HeaderText="ID apartamentu" 
                    SortExpression="ID_Apartamentu" />
            </Columns>
        </asp:GridView>
            </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Administrator">
            </asp:RoleGroup>
        </RoleGroups>
        <AnonymousTemplate runat="server">
        <p>Musisz być zalogowany aby przeglądać swoje rezerwacje !!!</p>
        </AnonymousTemplate>

    </asp:LoginView> 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:StronaInternetowaConnectionString2 %>" 
            SelectCommand="SELECT * FROM [Rezerwacja] WHERE ([ID_Klienta] = @ID_Klienta)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="ID_Klienta" SessionField="Login" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </fieldset>
        <fieldset class="accountInfo">
        <legend>Dodaj komentarz</legend>
        <p>Wprowadź numer rezerwacji do której chcesz dodać komentarz, wpisz go w odpowiednie pole i kliknij "Dodaj"</p>
        
        <p>
            <asp:Label ID="LabelIDRezerwacji" runat="server" Text="Numer rezerwacji"></asp:Label>&nbsp
            <asp:TextBox ID="IDRezerwacjiText" runat="server" CssClass="style1" 
                Width="49px"></asp:TextBox>&nbsp
            <asp:Label ID="LabelKomentarz" runat="server" Text="Komentarz"></asp:Label>&nbsp
            <asp:TextBox ID="KomentarzText" runat="server" CssClass="style1" 
                Width="456px" Height="22px"></asp:TextBox>&nbsp
            <asp:Button ID="KomentarzButton" runat="server" Text="Dodaj" 
                onclick="KomentarzButton_Click" />
        </p>
        <p>
            <asp:Label ID="LabelIstniejeKomentarz" runat="server" Text="Label" 
                Visible="False" ForeColor="Red"></asp:Label>
        </p>

        </fieldset>
            
    
    
        
</asp:Content>
