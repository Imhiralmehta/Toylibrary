<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Available.aspx.cs" Inherits="HiralMehta_Project.WebForm2"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
    <style type="text/css">
    .auto-style1 {
        width: 99px;
    }
    .auto-style2 {
        width: 229px;
    }
        .auto-style3 {
        }
    </style>
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id ='available'>Advertise toy
        <table class='toy' >    
        <tr>
                 <td class="auto-style2">Name</td>
                 <td>
                     <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style2">City*</td>
                 <td>
                     <asp:TextBox ID="txtCity" runat="server" Width="106px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="reqVald1" runat="server" ControlToValidate="txtCity" ErrorMessage="Required field" Font-Size="Small" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style2">Phone</td>
                 <td>
                     <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style2">Email*</td>
                 <td>
                     <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="reqVald2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required" Font-Size="Small" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style2">Type of Toy/Game*</td>
                 <td>
                     <asp:DropDownList ID="ddlType" runat="server">
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="reqVald3" runat="server" ControlToValidate="ddlType" ErrorMessage="Required" Font-Size="Small" ForeColor="Red" InitialValue="-1">*Required</asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style2">Toy Description</td>
                 <td>
                     <asp:TextBox ID="txtDesc" runat="server" Height="70px" Width="240px"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style2">Good for kids in age group*</td>
                 <td class="auto-style1">
                        
                     <asp:RadioButtonList ID="rblAvailAgeGroup" runat="server" Width="229px">
                         <asp:ListItem>Infant</asp:ListItem>
                         <asp:ListItem>Toddler</asp:ListItem>
                         <asp:ListItem>Between 5 - 8</asp:ListItem>
                         <asp:ListItem>Between 8 - 12</asp:ListItem>
                     </asp:RadioButtonList>
                        
                     <asp:RequiredFieldValidator ID="reqVald5" runat="server" ControlToValidate="rblAvailAgeGroup" ErrorMessage="Required" Font-Size="Small" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                        
                    </td>                 
             </tr>
             <tr>
                 <td class="auto-style2">Availability in weeks*</td>
                 <td>
                     <asp:TextBox ID="txtAvail" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="reqVald4" runat="server" ControlToValidate="txtAvail" ErrorMessage="Required" Font-Size="Small" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                 </td>
             </tr>
                <tr>
                 <td align="center" class="auto-style2" colspan="2" style="color: #FF0000;">fields marked with * are Required fields</td>
		     </tr>
                    
                <tr>
                    <td align ="center" class="auto-style2" colspan ="2" >
                        <asp:Button ID="btnSubmitAvail" runat="server" Text="Submit" OnClick="btnSubmitAvail_Click" />
                        <br />
                    </td>
                </tr>
                
                    
                <tr>
                    <td align ="center" class="auto-style2" colspan ="2" >
                        <asp:Label ID="lblAvailable" runat="server" BorderStyle="None" Width="391px"></asp:Label>
                    </td>
                </tr>                   
            </table>
        <br /><br />
         <table class='toy' id="del" >Delete a toy? Provide your email    
        <tr>
                 <td class="auto-style3">Your Email:</td>
                 <td>
                     <asp:TextBox ID="txtEmailDel" runat="server" Width="166px"></asp:TextBox>
                     <asp:Button ID="btnLoad" runat="server" Text="Search" OnClick="btnLoad_Click" CausesValidation="False" />
                     <asp:Button ID="btnDelete" runat="server" Text="Delete" CausesValidation="False" OnClick="btnDelete_Click" />
                 </td>
             </tr>           
        <tr>
                 <td class="auto-style3" colspan="2">
                     <asp:Label ID="lblDel" runat="server" Text=""></asp:Label>
                 </td>
             </tr>           
        </table>
                     <asp:GridView ID="gvDel" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                         <AlternatingRowStyle BackColor="White" />
                         <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                         <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                         <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                         <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                         <SortedAscendingCellStyle BackColor="#FDF5AC" />
                         <SortedAscendingHeaderStyle BackColor="#4D0000" />
                         <SortedDescendingCellStyle BackColor="#FCF6C0" />
                         <SortedDescendingHeaderStyle BackColor="#820000" />
                     </asp:GridView>                        
       
        </div>
    

</asp:Content>
