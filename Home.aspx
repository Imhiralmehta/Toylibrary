<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HiralMehta_Project.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 273px;
        }
        #btnSubmitHome {
           text-align:center;
           padding:1%;
           
        }
    .auto-style3 {
        width: 451px;
        height: 160px;
    }
        .auto-style6 {
            width: 451px;
        }
        .auto-style7 {
            width: 485px;
        }
        .auto-style8 {
            width: 485px;
            height: 160px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <div id ='wanted'> Want a toy?        
            <table class='toy'>        
                          
             <tr>
                 <td class="auto-style6">City*</td>
                 <td class="auto-style7">
                     <asp:TextBox ID="txtCityHome" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="reqValdHomeCity" runat="server" ControlToValidate="txtCityHome" ErrorMessage="Required field" Font-Size="Small" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                 </td>
             </tr>
             
             <tr>
                 <td class="auto-style6">Type of Toy/Game*</td>
                 <td class="auto-style7">
                     <asp:DropDownList ID="ddlTypeHome" runat="server">
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="reqValdHomeType" runat="server" ControlToValidate="ddlTypeHome" ErrorMessage="Required field" Font-Size="Small" ForeColor="Red" InitialValue="-1">*Required</asp:RequiredFieldValidator>
                 </td>
             </tr>
             
             <tr>
                 <td class="auto-style3">Good for kids in age group*</td>
                 <td class="auto-style8">                            
                     <asp:RadioButtonList ID="rblHomeAgeGroup" runat="server" Width="212px">
                         <asp:ListItem>Infant</asp:ListItem>
                         <asp:ListItem>Toddler</asp:ListItem>
                         <asp:ListItem>Between 5 - 8</asp:ListItem>
                         <asp:ListItem>Between 8 - 12</asp:ListItem>
                     </asp:RadioButtonList>
                        
                     <asp:RequiredFieldValidator ID="reqValdHomeAge" runat="server" ControlToValidate="rblHomeAgeGroup" ErrorMessage="Required field" Font-Size="Small" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                        
                    </td>                 
             </tr>
             <tr>
                 <td class="auto-style6">Availability in weeks*</td>
                 <td class="auto-style7"> <asp:TextBox ID="txtAvailHome" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="reqValdHomeAvail" runat="server" ControlToValidate="txtAvailHome" ErrorMessage="Required field" Font-Size="Small" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                 </td>
             </tr>
                <tr>
                 <td align="center" class="auto-style2" colspan="2" style="color: #FF0000;">fields marked with * are Required fields</td>
		     </tr>
             <tr>
                 <td align="center" class="auto-style2" colspan="2"><asp:Button ID="btnSubmitHome" runat="server" Text="Submit" BackColor="Maroon" BorderColor="#000066" BorderStyle="Ridge" Font-Bold="True" ForeColor="White" Width="100px" OnClick="btnSubmitHome_Click" /></td>
		     </tr>
                <tr>
                    <td align ="center" class="auto-style2" colspan ="2" >
                    <asp:Label ID="lblHome" runat="server" BorderStyle="None" Width="391px"></asp:Label></td></tr>
             
    </table>
   
        <asp:GridView ID="gvHome" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" style="margin-left: 6px" Width="391px">
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
            </div>  
</asp:Content>
