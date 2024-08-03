using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Collections;
using System.Web.Configuration;

public partial class wucCustomerOrderListItem : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Status.Text== "Accepted")
        {
            btnRemoveOrder.Visible = false;
        }
        else
        {
            btnRemoveOrder.Visible = true;
        }
    }
    private string orderID;
    public string OrderID
    {
        get { return orderID; }
        set { orderID = value; }
    }
    public bool Enabled
    {
        get { return btnRemoveOrder.Enabled; }
        set { btnRemoveOrder .Enabled= value; }

    }


    public Label Title
    {
        get { return lblTitle; }
        set { lblTitle = value; }
    }
    public Label Status
    {
        get { return lblStatus; }
        set { lblStatus = value; }
    }
    public Label Description
    {
        get { return lblDescription; }
        set { lblDescription = value; }
    }
    public Label WorkerName
    {
        get { return lblWorkerName; }
        set { lblWorkerName = value; }
    }
    public Label WorkerProfession
    {
        get { return lblWorkerProfession; }
        set { lblWorkerProfession = value; }
    }
    public Label OrderDate
    {
        get { return lblOrderDate; }
        set { lblOrderDate = value; }
    }

    protected void btnRemoveOrder_Click(object sender, EventArgs e)
    {
        btnCancel.Visible = true;
        btnConfirm.Visible = true;
        btnRemoveOrder.Visible = false;
    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        btnCancel.Visible = false;
        btnConfirm.Visible = false;
        btnRemoveOrder.Visible = true;
    }

    protected void btnConfirm_Click(object sender, ImageClickEventArgs e)
    {
        Order order = new Order();
        order.DeleteCustomerOrder(orderID);
        btnCancel.Visible = false;
        btnConfirm.Visible = false;
        btnRemoveOrder.Visible = true;
    }
}