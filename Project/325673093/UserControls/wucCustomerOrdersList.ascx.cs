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

public partial class UserControls_wucCustomerOrdersList : System.Web.UI.UserControl
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
            Order ord = new Order();
            DataTable dt = ord.GetCutomerOrders(Session["ID"].ToString());
            foreach (DataRow r in dt.Rows)
            {
                wucCustomerOrderListItem order = (wucCustomerOrderListItem)Page.LoadControl("~/UserControls/wucCustomerOrderListItem.ascx");
                order.Title.Text = r["title"].ToString();
                order.Status.Text = r["status"].ToString();
                order.Description.Text = r["description"].ToString();
                order.OrderID= r["orderID"].ToString();

                Worker worker = new Worker();
                WorkerDetails details = worker.GetWorkerByID(r["workerID"].ToString());
                order.WorkerName.Text = details.FirstName + " " + details.LastName;
                order.WorkerProfession.Text = details.Profession;

                order.OrderDate.Text +=  DateToString((DateTime)r["orderDate"]);

                List.Controls.Add(order);
            }
        }
        catch (Exception ex)
        {
            btnDropOrderList.AlternateText = ex.Message;
        }
        if(List.Controls.Count>3)
        {
            List.Attributes.Add("style", "display:none; flex-direction:column; align-items:center; background-color:#CC1100; width:490px; max-height:500px; border-block-color:black; border-style:solid; border-width:1px; position:absolute; overflow-y:scroll;");
        }
    }
}