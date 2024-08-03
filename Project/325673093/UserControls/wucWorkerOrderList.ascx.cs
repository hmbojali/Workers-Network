using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public partial class UserControls_wucWorkerOrderList : System.Web.UI.UserControl
{
    public string DateToString(DateTime dt)
    {
        string res = dt.Day + "/" + dt.Month + "/" + dt.Year;
        return res;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            string ListDisplay = "flex";
 
            Order ord = new Order();
            DataTable dt = ord.GetWorkerOrders(Session["ID"].ToString());
            foreach (DataRow r in dt.Rows)
            {
                wucWorkerOrderListItem order = (wucWorkerOrderListItem)Page.LoadControl("~/UserControls/wucWorkerOrderListItem.ascx");
                order.Title.Text = r["title"].ToString();
                order.Status.Text = r["status"].ToString();
                order.Description.Text = r["description"].ToString();
                order.OrderID = r["orderID"].ToString();


                Customer customer = new Customer();
                CustomerDetails details = customer.GetCustomerByID(r["customerID"].ToString());
                order.CustomerName.Text = details.FirstName + " " + details.LastName;
                order.CustomerPhoneNumber.Text = details.PhoneNumber;
                order.CustomerAddressDescription.Text = details.AddressDescription;
                order.OrderDate.Text += DateToString((DateTime)r["orderDate"]);

                List.Controls.Add(order);

                if (order.Status.Text.Contains("?"))//the order list item code behind works AFTER this one so i have to make it backwards
                    ListDisplay = "none";
                if(!IsPostBack)
                    ListDisplay = "none";

            }
            if (List.Controls.Count > 3)
                List.Attributes.Add("style", "display:" + ListDisplay + "; flex-direction:column; align-items:center; background-color:#CC1100; width:490px; max-height:500px; border-block-color:black; border-style:solid; border-width:1px; position:absolute; overflow-y:scroll;");
            else if(dt.Rows.Count==0)
                List.Attributes.Add("style", "display:none; flex-direction:column; align-items:center; background-color:#CC1100; width:490px; max-height:500px; border-block-color:black; border-style:solid; border-width:1px; position:absolute; overflow-y:scroll;");
            else
                List.Attributes.Add("style", "display:" + ListDisplay + "; flex-direction:column; align-items:center; background-color:#CC1100; width:490px; max-height:500px; border-block-color:black; border-style:solid; border-width:1px; position:absolute;");
        }
        catch (Exception ex)
        {
            btnDropOrderList.AlternateText = ex.Message;
        }

    }
}