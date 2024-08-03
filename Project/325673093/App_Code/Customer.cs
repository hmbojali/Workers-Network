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
/// Summary description for Customers
/// </summary>

//**************Class  CustomerDetails - begin ***************
public class CustomerDetails
{
    private string _CustomerID;
    private string _FirstName;
    private string _LastName;
    private DateTime _DateOfBirth;
    private string _Email;
    private string _UserName;
    private string _Password;
    private string _PhoneNumber;
    private string _AddressDescription;


    public CustomerDetails()
    {

    }

    //Properties
    public string CustomerID
    {
        get { return _CustomerID; }
        set { _CustomerID = value; }
    }
    public string FirstName
    {
        get { return _FirstName; }
        set { _FirstName = value; }
    }
    public string LastName
    {
        get { return _LastName; }
        set { _LastName = value; }
    }
    public DateTime DateOfBirth
    {
        get { return _DateOfBirth; }
        set { _DateOfBirth = value; }
    }
    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }
    public string UserName
    {
        get { return _UserName; }
        set { _UserName= value; }
    }
    public string Password
    {
        get { return _Password; }
        set { _Password = value; }
    }
    public string PhoneNumber
    {
        get { return _PhoneNumber; }
        set { _PhoneNumber = value; }
    }
    public string AddressDescription
    {
        get { return _AddressDescription; }
        set { _AddressDescription = value; }
    }


}
//**************Class  CustomerDetails - end ***************
//**************Class  Customer - begin ********************
public class Customer
{
    //Encapsulation
    ArrayList prmList;
    OleDbParameter prm;
    string strSQLName;

    //Constructor
    public Customer()
    {
    }
    //Methods

    //___________________AddCustomer_______________________

    public void AddCustomer(CustomerDetails cstDetails)
    {
        strSQLName = "spAddCustomer";
        prmList = new ArrayList();

        prm = new OleDbParameter("@CustomerID", OleDbType.VarChar);
        prm.Value = cstDetails.CustomerID;
        prmList.Add(prm);
        
        prm = new OleDbParameter("@FirstName", OleDbType.VarChar);
        prm.Value = cstDetails.FirstName;
        prmList.Add(prm);

        prm = new OleDbParameter("@LastName", OleDbType.VarChar);
        prm.Value = cstDetails.LastName;
        prmList.Add(prm);

        prm = new OleDbParameter("@DateOfBirth", OleDbType.VarChar);
        prm.Value = cstDetails.DateOfBirth;
        prmList.Add(prm);

        prm = new OleDbParameter("@PhoneNumber", OleDbType.VarChar);
        prm.Value = cstDetails.PhoneNumber;
        prmList.Add(prm);

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = cstDetails.Email;
        prmList.Add(prm);

        prm = new OleDbParameter("@UserName", OleDbType.VarChar);
        prm.Value = cstDetails.UserName;
        prmList.Add(prm);

        prm = new OleDbParameter("@Password", OleDbType.VarChar);
        prm.Value = cstDetails.Password;
        prmList.Add(prm);
        
        prm = new OleDbParameter("@AddressDescription", OleDbType.VarChar);
        prm.Value = cstDetails.AddressDescription;
        prmList.Add(prm);


        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }
    //___________________ExistCustomer_________________________________

    public Boolean ExistCustomer(string Email,bool useless)
    {
        strSQLName = "spExistCustomer";
        prmList = new ArrayList();

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = Email;
        prmList.Add(prm);

        prm = new OleDbParameter("@CustomerID", OleDbType.VarChar);
        prm.Value = "a-1-8-8-8-7-9";
        prmList.Add(prm);

        int intCount = (int)DoQueries.ExecuteSPScalar(strSQLName, prmList);
        return intCount > 0;
    }
    public Boolean ExistCustomer(CustomerDetails cstDetails)
    {
        strSQLName = "spExistCustomer";
        prmList = new ArrayList();

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = cstDetails.Email;
        prmList.Add(prm);

        prm = new OleDbParameter("@CustomerID", OleDbType.VarChar);
        prm.Value = "a-1-8-8-8-7-9";
        prmList.Add(prm);

        int intCount = (int)DoQueries.ExecuteSPScalar(strSQLName, prmList);
        return intCount > 0;
    }
    public Boolean ExistCustomer(string ID)
    {
        strSQLName = "spExistCustomer";
        prmList = new ArrayList();

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value ="a-1-8-8-8-7-9";
        prmList.Add(prm);

        prm = new OleDbParameter("@CustomerID", OleDbType.VarChar);
        prm.Value = ID;
        prmList.Add(prm);

        int intCount = (int)DoQueries.ExecuteSPScalar(strSQLName, prmList);
        return intCount > 0;
    }


    public CustomerDetails GetCustomerByID(string id)
    {
        CustomerDetails e = new CustomerDetails();

        if (ExistCustomer(id))
        {
            string strDetails =
                string.Format("SELECT * FROM tblCustomers" +
                " WHERE customerID='{0}'", id);
            DataSet ds = DoQueries.ExecuteDataSet(strDetails);
            e.CustomerID = ds.Tables[0].Rows[0]["customerID"].ToString();
            e.FirstName = ds.Tables[0].Rows[0]["firstName"].ToString();
            e.LastName = ds.Tables[0].Rows[0]["lastName"].ToString();
            {
                int day, month, year;
                DateTime date;
                string strDate = ds.Tables[0].Rows[0]["dateOfBirth"].ToString();

                month = int.Parse(strDate.Substring(0, strDate.IndexOf("/")));
                strDate = strDate.Substring(strDate.IndexOf("/") + 1);
                day = int.Parse(strDate.Substring(0, strDate.IndexOf("/")));
                strDate = strDate.Substring(strDate.IndexOf("/") + 1);
                year = int.Parse(strDate.Substring(0, strDate.IndexOf(" ")));

                date = new DateTime(year, month, day);

                e.DateOfBirth = date;
            }//getting the date
            e.PhoneNumber = ds.Tables[0].Rows[0]["phoneNumber"].ToString();
            e.Email = ds.Tables[0].Rows[0]["email"].ToString();
            e.UserName = ds.Tables[0].Rows[0]["userName"].ToString();
            e.Password = ds.Tables[0].Rows[0]["password"].ToString();
            e.AddressDescription = ds.Tables[0].Rows[0]["addressDescription"].ToString();
        }
        return e;
    }

    public CustomerDetails GetCustomerByEmail(string email)
    {
        CustomerDetails e = new CustomerDetails();

        if (ExistCustomer(email,true))
        {
            string strDetails =
                string.Format("SELECT * FROM tblCustomers" +
                " WHERE email='{0}'", email);
            DataSet ds = DoQueries.ExecuteDataSet(strDetails);
            e.CustomerID = ds.Tables[0].Rows[0]["customerID"].ToString();
            e.FirstName = ds.Tables[0].Rows[0]["firstName"].ToString();
            e.LastName = ds.Tables[0].Rows[0]["lastName"].ToString();
            {
                int day, month, year;
                DateTime date;
                string strDate = ds.Tables[0].Rows[0]["dateOfBirth"].ToString();

                month = int.Parse(strDate.Substring(0, strDate.IndexOf("/")));
                strDate = strDate.Substring(strDate.IndexOf("/") + 1);
                day = int.Parse(strDate.Substring(0, strDate.IndexOf("/")));
                strDate = strDate.Substring(strDate.IndexOf("/") + 1);
                year = int.Parse(strDate.Substring(0, strDate.IndexOf(" ")));

                date = new DateTime(year, month, day);

                e.DateOfBirth = date;
            }//getting the date
            e.PhoneNumber = ds.Tables[0].Rows[0]["phoneNumber"].ToString();
            e.Email = ds.Tables[0].Rows[0]["email"].ToString();
            e.UserName = ds.Tables[0].Rows[0]["userName"].ToString();
            e.Password = ds.Tables[0].Rows[0]["password"].ToString();
            e.AddressDescription = ds.Tables[0].Rows[0]["addressDescription"].ToString();
        }
        return e;
    }

    //___________________Update Customer-Update_______________________

    public void UpdateAllDetails(CustomerDetails e)
    {

        strSQLName = "spUpdateCustomer";
        prmList = new ArrayList();


        prm = new OleDbParameter("@FirstName", OleDbType.VarChar);
        prm.Value = e.FirstName;
        prmList.Add(prm);

        prm = new OleDbParameter("@LastName", OleDbType.VarChar);
        prm.Value = e.LastName;
        prmList.Add(prm);

        prm = new OleDbParameter("@DateOfBirth", OleDbType.VarChar);
        prm.Value = e.DateOfBirth;
        prmList.Add(prm);

        prm = new OleDbParameter("@PhoneNumber", OleDbType.VarChar);
        prm.Value = e.PhoneNumber;
        prmList.Add(prm);

        prm = new OleDbParameter("@UserName", OleDbType.VarChar);
        prm.Value = e.UserName;
        prmList.Add(prm);

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = e.Email;
        prmList.Add(prm);

        prm = new OleDbParameter("@Password", OleDbType.VarChar);
        prm.Value = e.Password;
        prmList.Add(prm);

        prm = new OleDbParameter("@AddressDescription", OleDbType.VarChar);
        prm.Value = e.AddressDescription;
        prmList.Add(prm);


        prm = new OleDbParameter("@ID", OleDbType.VarChar);
        prm.Value = e.CustomerID;
        prmList.Add(prm);

        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }
}


//**************Class  Customer - end **********************