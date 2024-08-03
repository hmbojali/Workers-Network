<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForWorkers/mpWorkers.master" AutoEventWireup="true" CodeFile="wfWorkersProfileWorker.aspx.cs" Inherits="PagesForWorkers_wfWorkersProfileWorker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <MyUserControls:WorkerProfileInSearch ID="wucWorkerProfileInSearch1" runat="server" Visible="false"/>
         <div style="width:100%; height:100%; display:flex; flex-direction:row; align-items:center;margin:40px 0 0 0;" >
             <div style=" width:25%; height:100%; display:flex; flex-direction:row; align-items:center" >
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
                                 <span style="font-weight:700; font-size:x-large; margin-right:20px">Ratings:</span>
                                 <asp:Label ID="lblRatingQuality" runat="server" Text="Quality 5&#10029;" style="width: 207px; height: 50px; margin-right:15px" Font-Bold="True" Font-Size="Large"></asp:Label>
                                 <asp:Label ID="lblRatingSpeed" runat="server" Text="Speed 5&#10029;" style="width: 207px; height: 50px; margin-right:15px" Font-Bold="True" Font-Size="Large"></asp:Label>
                                 <asp:Label ID="lblRatingComfort" runat="server" Text="Comfort 5&#10029;" style="width: 207px; height: 50px; margin-right:15px" Font-Bold="True" Font-Size="Large"></asp:Label>
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
            </div>





        <script>

            //this is to make the textbox like a label, but has multi-lines
            document.getElementById("txtbxBiographContent").onfocus =//check if "txtbxBiographContent" has focus and remove it
                function (e) {
                    e.target.blur();
                }
        </script>
</asp:Content>

