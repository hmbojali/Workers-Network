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

public partial class wucWorkerOrderListItem : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Status.Text=="Pending")
        {
            btnFinish.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
        }
        else if(Status.Text== "Accepted")
        {
            btnAccept.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnDeny.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
        }
        else if(Status.Text.Contains("?"))
        {
            btnFinish.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnAccept.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnDeny.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnCancel.Attributes.Add("style", "display:block; height: 25px; width: 25px; margin-right:15px");
            btnConfirm.Attributes.Add("style", "display:block; height: 25px; width: 25px; margin-right:15px");
        }
        else
        {
            btnFinish.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnAccept.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnDeny.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
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
        get { return btnAccept.Enabled&&btnDeny.Enabled; }
        set { btnAccept.Enabled = value; btnDeny.Enabled = value; }
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
    public Label CustomerName
    {
        get { return lblCustomerName; }
        set { lblCustomerName = value; }
    }
    public Label CustomerPhoneNumber
    {
        get { return lblCustomerPhoneNumber; }
        set { lblCustomerPhoneNumber = value; }
    }
    public Label CustomerAddressDescription
    {
        get { return lblAddressDescription; }
        set { lblAddressDescription = value; }
    }
    public Label OrderDate
    {
        get { return lblOrderDate; }
        set { lblOrderDate = value; }
    }

    protected void btnAccept_Click(object sender, EventArgs e)
    {
        Status.Text = "Accepted?";
        Order order = new Order();
        order.UpdateStatus("Accepted?", OrderID);
        btnAccept.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
        btnDeny.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
        btnCancel.Attributes.Add("style", "display:block; height: 25px; width: 25px; margin-right:15px");
        btnConfirm.Attributes.Add("style", "display:block; height: 25px; width: 25px; margin-right:15px");
        btnFinish.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
    }
    protected void btnDeny_Click(object sender, EventArgs e)
    {
        Status.Text = "Denied?";
        Order order = new Order();
        order.UpdateStatus("Denied?", OrderID);
        btnAccept.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
        btnDeny.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
        btnCancel.Attributes.Add("style", "display:block; height: 25px; width: 25px; margin-right:15px");
        btnConfirm.Attributes.Add("style", "display:block; height: 25px; width: 25px; margin-right:15px");
        btnFinish.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        if (Status.Text == "Denied?" || Status.Text == "Accepted?")
        {
            Status.Text = "Pending";
            Order order = new Order();
            order.UpdateStatus("Pending", OrderID);
            btnAccept.Attributes.Add("style", "display:block; text - align:center; height: 25px; width: 90px");
            btnDeny.Attributes.Add("style", "display:block; text - align:center; height: 25px; width: 90px");
            btnCancel.Attributes.Add("style", "display:none; height: 25px; width: 25px; margin-right:15px");
            btnConfirm.Attributes.Add("style", "display:none; height: 25px; width: 25px; margin-right:15px");
            btnFinish.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            //lblStatus.Parent...
        }
        else if (Status.Text == "Finished?")
        {
            Status.Text = "Accepted";
            Order order = new Order();
            order.UpdateStatus("Accepted", OrderID);
            btnCancel.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnConfirm.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnFinish.Attributes.Add("style", "display:block; text - align:center; height: 25px; width: 90px");
        }
    }


    protected void btnConfirm_Click(object sender, ImageClickEventArgs e)
    {
        //        if (Status.Text == "Pending")
        //this refers to the previous status,
        //this is because js updates that i made dont do post back which is what is responsible for updating code behind
        //
        //this method did NOT work :(

        if (Status.Text == "Denied?")
        {
            Status.Text = "Denied";
            Order order = new Order();
            order.UpdateStatus("Denied", OrderID);
            btnAccept.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnDeny.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnCancel.Attributes.Add("style", "display:none; height: 25px; width: 25px; margin-right:15px");
            btnConfirm.Attributes.Add("style", "display:none; height: 25px; width: 25px; margin-right:15px");
            btnFinish.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
        }
        else if(Status.Text == "Accepted?")
        {
            Status.Text = "Accepted";
            Order order = new Order();
            order.UpdateStatus("Accepted", OrderID);
            btnAccept.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnDeny.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
            btnCancel.Attributes.Add("style", "display:none; height: 25px; width: 25px; margin-right:15px");
            btnConfirm.Attributes.Add("style", "display:none; height: 25px; width: 25px; margin-right:15px");
            btnFinish.Attributes.Add("style", "display:block; text - align:center; height: 25px; width: 90px");
        }

        else if(Status.Text == "Finished?")
        {
            Status.Text = "Finished";
            Order order = new Order();
            order.UpdateStatus("Finished", OrderID);
            WorkerAttributes workerAttributes = new WorkerAttributes();
            workerAttributes.IncreaseTimesOrdered(Session["ID"].ToString());
            btnCancel.Attributes.Add("style", "display:none; height: 25px; width: 25px; margin-right:15px");
            btnConfirm.Attributes.Add("style", "display:none; height: 25px; width: 25px; margin-right:15px");
            btnFinish.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");
        }

    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        Status.Text = "Finished?";
        Order order = new Order();
        order.UpdateStatus("Finished?", OrderID);
        btnCancel.Attributes.Add("style", "display:block; height: 25px; width: 25px; margin-right:15px");
        btnConfirm.Attributes.Add("style", "display:block; height: 25px; width: 25px; margin-right:15px");
        btnFinish.Attributes.Add("style", "display:none; text - align:center; height: 25px; width: 90px");

    }


}