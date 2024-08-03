<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForWorkers/mpWorkers.master" AutoEventWireup="true" CodeFile="wfWorkerProfileSettings.aspx.cs" Inherits="PagesForWorkers_wfWorkerProfileSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div style="margin:50px auto 0; padding-bottom:10px; width:60%; height:stretch; background-color:#FFCC66" >
             <asp:Panel runat="server" style=" margin:35px" DefaultButton="btnSumbit">
                 <ul style="flex-direction:row; display:flex; list-style-type:none; padding-left:0px">
                     <li style="display:flex; flex-direction:column; align-items:center; width:150px; margin-right:60px; margin-top:20px">
                         <asp:Image ID="imgPFP" runat="server" Height="150px" Width="150px" />
                         <asp:FileUpload ID="inputUploadImage" runat="server" style="margin-bottom:0" Width="88px" ForeColor="Red" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" BorderWidth="3px"/><br />
                         <asp:TextBox ID="txtbxPhoneNumber" runat="server" Text="" style="text-align:center; padding:0px" Font-Bold="True" Height="46px" Width="146px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="X-Large" ForeColor="Red"></asp:TextBox>
                     </li>
                     <li style="max-width:700px; width: contain auto;">
                         <div style="max-width:700px; width: contain auto;display: block; margin-top:30px; margin-bottom:20px">
                             <asp:TextBox ID="txtbxUsername" runat="server" placeholder="Username" Text="Username" style=" padding:0px; max-width:192px; width:auto; height: 46px;  margin-right:50px;" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Bold="True" Font-Size="30px" ToolTip="You can change your Username here." ForeColor="Red"></asp:TextBox>
                             <asp:TextBox ID="txtbxProfession" runat="server" placeholder="Profession" Text="Profession" style=" padding:0px; max-width:192px; width:auto; height: 46px; margin-right:5px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="30px" ToolTip="You can change your Profession here." ForeColor="Red"></asp:TextBox>                             
                             <asp:DropDownList ID="ddlStatus" runat="server" style="width:auto; height: 20px; padding:0px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" ToolTip="Chose your current status.">
                                 <asp:ListItem Selected="True" Value="Free">Free</asp:ListItem>
                                 <asp:ListItem>Not Busy</asp:ListItem>
                                 <asp:ListItem>Busy</asp:ListItem>
                                 <asp:ListItem>Very Busy</asp:ListItem>
                                 <asp:ListItem>Unavailable</asp:ListItem>
                             </asp:DropDownList>
                         </div>
                         <div style="max-width:700px; width: contain auto; display: block; margin-bottom:15px">
                             <span style="font-weight:700; font-size:x-large; margin-right:20px; font-weight:700; color:red">Ratings:</span>
                             <asp:Label ID="lblRatingQuality" runat="server" Text="Quality 5&#10029;" style="width: 207px; height: 50px; margin-right:15px" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
                             <asp:Label ID="lblRatingSpeed" runat="server" Text="Speed 5&#10029;" style="width: 207px; height: 50px; margin-right:15px" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
                             <asp:Label ID="lblRatingComfort" runat="server" Text="Comfort 5&#10029;" style="width: 207px; height: 50px; margin-right:15px" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
                             <asp:Label ID="lblTimesRated" runat="server" Text="Ratings" style="width: 207px; height: 50px;" ForeColor="Red" Font-Bold="True"></asp:Label>
                         </div>
                         <div style="max-width:700px; width: contain auto; display: block;  margin-bottom:15px">
                             <asp:TextBox ID="txtbxName" runat="server" placeholder="Firstname LastName" Text="Firstname LastName" style=" padding:0px; width: auto; height: 20px; margin-right:10px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="Large" ForeColor="Red"></asp:TextBox>
                             <asp:Label ID="lblBirthDate" runat="server" Text="Birth date" style=" width: 207px; height: 50px" Font-Size="Large" ForeColor="Red" Font-Bold="True"></asp:Label>
                             <asp:TextBox ID="txtbxBirthDate" runat="server" style=" padding:0px; width:80px; height:20px; margin-right:20px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="Medium" ForeColor="Red"></asp:TextBox>
                             <asp:Label ID="lblExperienceYears" runat="server" Text="Experience years " style="width: 207px; height: 50px" Font-Size="Large" ForeColor="Red" Font-Bold="True"></asp:Label>
                             <asp:TextBox ID="txtbxExperienceYears" runat="server" style=" padding:0px; width:30px; height:20px; margin-right:20px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="Medium" ForeColor="Red"></asp:TextBox>
                         </div>
                         <div style="max-width:700px; width: contain auto; display: block;  margin-bottom:15px">
                             <asp:Label ID="lblAvgPayment" runat="server" Text="Average payment: " style="width: 207px; height: 50px;" Font-Size="Large" ForeColor="Red" Font-Bold="True"></asp:Label>
                             <asp:TextBox ID="txtbxAvgPayment" runat="server" style=" padding:0px; width:40px; height:20px;" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="Medium" ForeColor="Red"></asp:TextBox>
                             <span style=" margin-right:20px; font-weight:700; color:red">&#8362;/h</span>
                             <asp:Label ID="lblAvgHours" runat="server" Text="Average work time: " style="width: 207px; height: 50px;" Font-Size="Large" ForeColor="Red" Font-Bold="True"></asp:Label>
                             <asp:TextBox ID="txtbxAvgHours" runat="server" style=" padding:0px; width:20px; height:20px;" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="Medium" ForeColor="Red"></asp:TextBox>
                             <span style=" margin-right:20px; font-weight:700; color:red">h</span>
                             <asp:Label ID="lblTimesOrdered" runat="server" Text="Orders" style="width: 207px; height: 50px; margin-right:20px" Font-Size="Large" ForeColor="Red" Font-Bold="True"></asp:Label>
                         </div>
                         <div style="display:flex; flex-direction:row; align-items:center; max-width:700px; width:contain auto; margin-bottom:15px">
                             <div style="width:70%">
                                <asp:Label ID="lblTags" runat="server" Text="Tags: " style="height: 50px;" Font-Size="Large" ForeColor="Red" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="txtbxTags" runat="server" style=" padding:0px; width:80%; height:20px;" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="Medium" ForeColor="Red"></asp:TextBox>
                             </div>
                             <div style="width:25%; display:flex; flex-direction:row-reverse;">
                                 <asp:Button ID="btnAccountSettings" runat="server" Text="Account Settings" BackColor="#FF5500" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Width="120px" Height="40px" OnClick="btnAccountSettings_Click"/>
                             </div>
                         </div>

                     </li>
                 </ul>
                 <div style="display:flex; align-items:start; margin-bottom:10px">
                     <asp:Label ID="lblBiograph" runat="server" Text="Bio: " style="width:max-content; height: auto; margin-right:10px" Font-Bold="True" Font-Size="22px" ForeColor="Red"></asp:Label>
                    <div style="width:-webkit-fill-available">
                        <asp:TextBox ID="txtbxBiographContent" runat="server" placeholder="Type other information that you want to share with people about yourself" Text=" hey i do c# and java and java-script" style="overflow:hidden ;padding:0px; width:100%; height: 200px;" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="18px" TextMode="MultiLine" ForeColor="Red"></asp:TextBox>
                    </div>
                 </div>
                 <div style="display:flex; flex-direction:row;">
                     <div style="display:flex; flex-direction:row-reverse; width:-webkit-fill-available">
                         <asp:Button ID="btnSumbit" runat="server" Text="Submit" BackColor="#FF5500" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Width="120px" Height="40px" OnClick="btnSumbit_Click"/>
                         <div style="display:flex; align-items:center">
                                <asp:RegularExpressionValidator ID="ValidatorPhoneNumber" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" ControlToValidate="txtbxPhoneNumber" ErrorMessage="Wrong Phone Number Format" ValidationExpression="0\d{1,2}-?\d{7}"></asp:RegularExpressionValidator>

                                <asp:Label ID="lblErrorMessage" runat="server"  style="border-left:solid; border-color:red; padding-left:2px" Font-Size="21px" Font-Bold="True" ForeColor="Red" Visible="false">Error</asp:Label>
                         </div>
                     </div>
                 </div>
                 
             </asp:Panel>
            </div>
</asp:Content>

