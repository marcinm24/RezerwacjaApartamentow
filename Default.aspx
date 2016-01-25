<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix=ajaxToolkit %>
    

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StronaInternetowaConnectionString %>" 
        
        
        SelectCommand="SELECT [Opis], [Lokalizacja], [Adres], [Ilość_miejsc], [Wyposazenie], [ID_Apartamentu] FROM [Apartament]">
    </asp:SqlDataSource>

     <fieldset class="Rezerwacja">
        <legend>Wprowadź date rezerwacji i kliknij "Rezerwuj"</legend>

             <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" Text="Label" 
                 Visible="False"></asp:Label>
             <asp:Label ID="ErrorData" runat="server" ForeColor="Red" Text="Label" 
                 Visible="False"></asp:Label>
             <br />
             <asp:ScriptManager ID="ScriptManager1" runat="server">
             </asp:ScriptManager>
             Data od :&nbsp;
             <asp:TextBox ID="Czas_od" runat="server"></asp:TextBox>
             <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" 
                 ImageUrl="~/kalendarz.jpg" Width="25px" />
             <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                 Format="yyyy-MM-dd" PopupButtonID="ImageButton1" PopupPosition="BottomRight" 
                 TargetControlID="Czas_od" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Data do :
          
       
             <asp:TextBox ID="Czas_do" runat="server"> </asp:TextBox>
             <asp:ImageButton ID="ImageButton2" runat="server" Height="25px" 
                 ImageUrl="~/kalendarz.jpg" Width="25px" />
             <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                 Format="yyyy-MM-dd" PopupButtonID="ImageButton2" PopupPosition="BottomRight" 
                 TargetControlID="Czas_do"  />

         &nbsp;<asp:TextBox ID="TextBox11" runat="server" Visible="False"></asp:TextBox>

         <p>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" DataKeyNames="ID_Apartamentu" 
            AllowPaging="True" onrowcommand="GridView1_RowCommand" 
             onselectedindexchanged="GridView1_SelectedIndexChanged" BackColor="White" 
                 BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                 ForeColor="Black" GridLines="Horizontal">
            <Columns>
                    
                <asp:BoundField DataField="ID_Apartamentu" HeaderText="ID Apartamentu" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ID_Apartamentu" >
                    
                <HeaderStyle Width="171px" />
                </asp:BoundField>
                    
                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" >
                <HeaderStyle Width="171px" />
                </asp:BoundField>
                <asp:BoundField DataField="Lokalizacja" HeaderText="Lokalizacja" 
                    SortExpression="Lokalizacja" >
                <HeaderStyle Width="171px" />
                </asp:BoundField>
                <asp:BoundField DataField="Ilość_miejsc" HeaderText="Ilość miejsc" 
                    SortExpression="Ilość_miejsc" >
                    
                <HeaderStyle Width="171px" />
                </asp:BoundField>
                    
                <asp:BoundField DataField="Adres" HeaderText="Adres" SortExpression="Adres" >
                <HeaderStyle Width="171px" />
                </asp:BoundField>
                <asp:BoundField DataField="Wyposazenie" HeaderText="Wyposażenie" 
                    SortExpression="Wyposazenie" >
                                    
                <HeaderStyle Width="171px" />
                </asp:BoundField>
                                    
                <asp:TemplateField HeaderText="Rezerwuj">
                    <ItemTemplate>
                        <asp:Button ID="Button1" CommandArgument=<%# Container.DataItemIndex %> runat="server" CausesValidation="false"  
                            CommandName="rezerwuj" Text="Rezerwuj" />
                    </ItemTemplate>
                    <HeaderStyle Width="171px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                    
            </Columns>
             <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
             <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
             <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F7F7F7" />
             <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
             <SortedDescendingCellStyle BackColor="#E5E5E5" />
             <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
         </p>
          

         </fieldset>


</asp:Content>
