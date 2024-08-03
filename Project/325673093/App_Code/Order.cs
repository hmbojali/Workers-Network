using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Collections;

/// <summary>
/// Summary description for Order
/// </summary>
///

//**************Class  OrderDetails - begin ***************
public class OrderDetails
{
    private int _OrderID;
    private string _CustomerID;
    private string _WorkerID;
    private string _Title;
    private string _Description;
    private DateTime _OrderDate;
    private string _Status;


    public OrderDetails()
    {

    }

    //Properties
    public int OrderID
    {
        get { return _OrderID; }
        set { _OrderID = value; }
    }
    public string CustomerID
    {
        get { return _CustomerID; }
        set { _CustomerID = value; }
    }
    public string WorkerID
    {
        get { return _WorkerID; }
        set { _WorkerID = value; }
    }

    public string Title
    {
        get { return _Title; }
        set { _Title = value; }
    }
    public string Description
    {
        get { return _Description; }
        set { _Description = value; }
    }
    public DateTime OrderDate
    {
        get { return _OrderDate; }
        set { _OrderDate = value; }
    }
    public string Status
    {
        get { return _Status; }
        set { _Status = value; }
    }
}
//**************Class  OrderDetails - end ***************
//**************Class  Order - begin ********************
public class Order
{

    //Encapsulation
    ArrayList prmList;
    OleDbParameter prm;
    string strSQLName;

    //Constructor
    public Order()
    {
    }
    //Methods

    //___________________AddOrder_______________________

    public void AddOrder(OrderDetails details)
    {
        strSQLName = "spAddOrder";
        prmList = new ArrayList();

        prm = new OleDbParameter("@CustomerID", OleDbType.VarChar);
        prm.Value = details.CustomerID;
        prmList.Add(prm);

        prm = new OleDbParameter("@WorkerID", OleDbType.VarChar);
        prm.Value = details.WorkerID;
        prmList.Add(prm);

        prm = new OleDbParameter("@Title", OleDbType.VarChar);
        prm.Value = details.Title;
        prmList.Add(prm);

        prm = new OleDbParameter("@Description", OleDbType.VarChar);
        prm.Value = details.Description;
        prmList.Add(prm);


        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }
    public DataTable GetCutomerOrders(string id)
    {
        string strSQL = "SELECT * FROM tblOrders WHERE customerID=\"" +
            id + "\";";
        DataTable dt = DoQueries.ExecuteDataTable(strSQL);
        return dt;
    }
    public DataTable GetWorkerOrders(string id)
    {
        string strSQL = "SELECT * FROM tblOrders WHERE workerID=\"" +
            id + "\";";
        DataTable dt = DoQueries.ExecuteDataTable(strSQL);
        return dt;
    }
    public DataTable DeleteCustomerOrder(string OrderID)
    {
        string strSQL = "DELETE * " +
            "FROM tblOrders " +
            "WHERE orderID ="+OrderID+";";
        DataTable dt = DoQueries.ExecuteDataTable(strSQL);//useless
        return dt;
    }
    public DataTable UpdateStatus(string Status, string OrderID)
    {
        string strSQL = "UPDATE tblOrders SET " +
            "status= \"" + Status + "\" " +
            "WHERE orderID =" + OrderID + ";";
        DataTable dt = DoQueries.ExecuteDataTable(strSQL);//useless
        return dt;
    }
}
//**************Class  Order - end ********************
