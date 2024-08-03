<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForCustomers/mpCustomers.master" AutoEventWireup="true" CodeFile="wfWorkersProfileCustomer.aspx.cs" Inherits="PagesForCustomers_wfWorkersProfileCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <MyUserControls:WorkerProfileInSearch ID="wucWorkerProfileInSearch1" runat="server" Visible="false"/>
         <div style="width:100%; height:100%; display:flex; flex-direction:row; align-items:center;margin:40px 0 0 0;" >
             <div style=" width:22%; height:100%; display:flex; flex-direction:row; align-items:center" >
                 <div style="width:100%; height:fit-content; display:flex; flex-direction:column; align-items:center; margin-left:50px" >
                     <div style="height:450px; width:auto; display:flex; flex-direction:row; align-items:center; z-index:1">
                        <div style= "display:flex; flex-direction:column; align-items:center; padding:40px 30px; background-color:#FFCC66">

                            <asp:Label ID="lblRatingLabel" runat="server" Text="Add A Rating!" style="width: auto; margin-bottom:10px" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="20pt"></asp:Label>

                            <div style= "display:flex; flex-direction:column; margin-bottom:15px">
                                 
                                <div style= "display:flex; flex-direction:Row; align-items:center; background-color:#FFCC66; margin-bottom:10px">
                                    <asp:Label ID="lblRatingQualityLabel" runat="server" Text="Quality Rating:" style="width: auto; margin-right:3px" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="16px"></asp:Label>
                                    <asp:DropDownList ID="ddlRatingQuality" runat="server" style="width:auto; height: 20px; padding:0px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" ToolTip="Chose Quality Rating.">
                                        <asp:ListItem Selected="True" Value="5">5</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div style= "display:flex; flex-direction:Row; align-items:center; margin-bottom:10px">
                                    <asp:Label ID="lblRatingSpeedLabel" runat="server" Text="Speed Rating:" style="width: auto; margin-right:3px" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="16px"></asp:Label>
                                    <asp:DropDownList ID="ddlRatingSpeed" runat="server" style="width:auto; height: 20px; padding:0px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" ToolTip="Chose Speed Ratings.">
                                        <asp:ListItem Selected="True" Value="5">5</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div style= "display:flex; flex-direction:Row; align-items:center; margin-bottom:10px">
                                    <asp:Label ID="lblRatingComfortLabel" runat="server" Text="Comfort Rating:" style="width: auto; margin-right:3px" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="16px"></asp:Label>
                                    <asp:DropDownList ID="ddlRatingComfort" runat="server" style="width:auto; height: 20px; padding:0px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" ToolTip="Chose Comfort Rating.">
                                        <asp:ListItem Selected="True" Value="5">5</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <asp:Button ID="btnSubmitRating" runat="server" Text="Submit" ForeColor="#BB0000" Font-Size="14px" BackColor="#FF5500" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Width="80px" Height="30px" OnClick="btnSubmitRating_Click"/>
                        </div>
                     </div>
                 </div>
             </div>
             <div style="width:50%; height:stretch; background-color:#FFCC66" >
                 <div style=" margin:40px">
                     <ul style="flex-direction:row; display:flex; list-style-type:none; padding-left:0px">
                         <li style="height:200px; width:150px; margin-right:60px; margin-top:20px">
                             <asp:Image ID="imgPFP" runat="server" Height="150px" Width="150px" />
                             <asp:Label ID="lblPhoneNumber" runat="server" Text="0543124798" style="text-align:center" Font-Bold="True" Height="50px" Width="150px" Font-Size="X-Large"></asp:Label>
                         </li>
                         <li style="height:auto; max-width:700px; width: contain auto;">
                             <div style="max-width:700px; width: contain auto;display: block; margin-top:30px; margin-bottom:20px">
                                 <asp:Label ID="lblUsername" runat="server" Text="Username" style="width: 207px; height: 50px;  margin-right:50px" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                                 <asp:Label ID="lblProfession" runat="server" Text="Profession" style="width: 207px; height: 50px; margin-right:5px" Font-Size="XX-Large"></asp:Label>                             
                                 <asp:Label ID="lblStatus" runat="server" Text="(Status)" style="width: 50px; height: 20px;" Font-Bold="True"></asp:Label>
                             </div>
                             <div style="max-width:700px; width: contain auto; display: block; margin-bottom:15px">
                                 <span style="font-weight:700; font-size:21px; margin-right:10px">Ratings:</span>
                                 <asp:Label ID="lblRatingQuality" runat="server" Text="Quality 5&#10029;" style="width: 207px; height: 50px; margin-right:15px" Font-Bold="True" Font-Size="17px"></asp:Label>
                                 <asp:Label ID="lblRatingSpeed" runat="server" Text="Speed 5&#10029;" style="width: 207px; height: 50px; margin-right:15px" Font-Bold="True" Font-Size="17px"></asp:Label>
                                 <asp:Label ID="lblRatingComfort" runat="server" Text="Comfort 5&#10029;" style="width: 207px; height: 50px; margin-right:15px" Font-Bold="True" Font-Size="17px"></asp:Label>
                                 <asp:Label ID="lblTimesRated" runat="server" Text="Ratings" style="width: 207px; height: 50px;"></asp:Label>
                             </div>
                             <div style="max-width:700px; width: contain auto; display: block;  margin-bottom:15px">
                                 <asp:Label ID="lblName" runat="server" Text="Firstname LastName" style="width: 207px; height: 50px; margin-right:20px" Font-Size="Large"></asp:Label>
                                 <asp:Label ID="lblAge" runat="server" Text="" style=" width: 207px; height: 50px; margin-right:20px" Font-Size="Large"></asp:Label>
                                 <asp:Label ID="lblExperienceYears" runat="server" Text="Experience years " style="width: 207px; height: 50px; margin-right:20px" Font-Size="Large"></asp:Label>
                             </div>
                             <div style="max-width:700px; width: contain auto; display: block;  margin-bottom:15px">
                                 <asp:Label ID="lblAvgPayment" runat="server" Text="Average payment: " style="width: 207px; height: 50px; margin-right:20px" Font-Size="Large"></asp:Label>
                                 <asp:Label ID="lblAvgHours" runat="server" Text="Average work time: " style="width: 207px; height: 50px; margin-right:20px" Font-Size="Large"></asp:Label>
                                 <asp:Label ID="lblTimesOrdered" runat="server" Text="Orders" style="width: 207px; height: 50px; margin-right:20px" Font-Size="Large"></asp:Label>
                             </div>

                         </li>
                     </ul>

                     <div style="display:flex; align-items:start; margin-bottom:10px">
                         <asp:Label ID="Label1" runat="server" Text="Bio: " style="width:max-content; height: auto; margin-right:10px" Font-Bold="True" Font-Size="22px"></asp:Label>
                        <div style="width:-webkit-fill-available">
                            <asp:TextBox ID="txtbxBiographContent" runat="server" placeholder="No Bio Available" Text=" hey i do c# and java and java-script" style="overflow:hidden ;padding:0px; width:100%; height: 200px;" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="18px" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                 </div>
                 <br />
                    <asp:Label ID="lblEmail" runat="server" Text="Email address: " style="width: 412px; height: 50px;"></asp:Label>



                </div>
             <div style=" width:25%; height:100%; display:flex; flex-direction:row; align-items:center" >
                 <div style="width:100%; height:fit-content; display:flex; flex-direction:column; align-items:center;" >
                     <div style="height:450px; width:auto; display:flex; flex-direction:row; align-items:center; z-index:1">
                        <asp:Panel runat="server" style= "display:flex; flex-direction:column; align-items:center; padding:40px 15px; background-color:#FFCC66" DefaultButton="btnSumbitOrder">

                            <asp:Label ID="lblOrderLabel" runat="server" Text="Make An Order!" style="width: auto; margin-bottom:10px" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="20pt"></asp:Label>

                            <asp:TextBox ID="txtbxOrderTitle" runat="server" placeholder="Order Title.." style="height: 30px; width:80%; margin-bottom:20px" BackColor="#FF9922" ForeColor="Red" Font-Size="20px" BorderColor="#FF7700" BorderStyle="Outset" Visible="True"></asp:TextBox>
                            <asp:TextBox ID="txtbxOrderDescription" runat="server" placeholder="Order Description..." style="height: 100px; width:80%; margin-bottom:30px" BackColor="#FF9922" ForeColor="Red" Font-Size="16px" BorderColor="#FF7700" BorderStyle="Outset" Visible="True" TextMode="MultiLine"></asp:TextBox>
                
                            <asp:Button ID="btnSumbitOrder" runat="server" Text="Submit Order" ForeColor="#BB0000" Font-Size="18px" BackColor="#FF5500" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Width="130px" Height="40px" OnClick="btnSumbitOrder_Click"/>

                            <div style="width:auto; display:flex; flex-direction:row; align-items:center; z-index:1">

                                <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Images/Icons/XCancel.png" style="height: 40px; width: 40px; margin-right:20px" BackColor="#DD0000" BorderColor="#DD0000" BorderStyle="Outset" BorderWidth="5px" Visible="false" OnClick="btnCancel_Click"/>
                                <asp:ImageButton ID="btnConfirm" runat="server" ImageUrl="~/Images/Icons/VConfirm.png" style="height: 40px; width: 40px;" BackColor="#099000" BorderColor="#099000" BorderStyle="Outset" BorderWidth="5px" Visible="false" OnClick="btnConfirm_Click"/>

                            </div>
                        </asp:Panel>
                     </div>
                 </div>
             </div>
         </div>





        <script>

            //this is to make the textbox like a label, but has multi-lines
            document.getElementById("txtbxBiographContent").onfocus =//check if "txtbxBiographContent" has focus and remove it
                function (e) {
                    e.target.blur();
                }
        </script>
</asp:Content>

