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

//**************Class  AdminDetails - begin ***************
public class AdminDetails
{
    //Encapsulation
    private int _AdminID;
    private string _FirstName;
    private string _LastName;
    private string _Email;
    private string _UserName;
    private string _Password;

    //Properties
    public int AdminID
    {
        get { return _AdminID; }
        set { _AdminID = value; }
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
    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }
    public string UserName
    {
        get { return _UserName; }
        set { _UserName = value; }
    }
    public string Password
    {
        get { return _Password; }
        set { _Password = value; }
    }
    public AdminDetails()
    {
    }
}
//**************Class  AdminDetails - end   ***************
//**************Class  Admin - begin **********************
public class Admin
{
    //Encapsulation
    ArrayList prmList;
    OleDbParameter prm;
    string strSQLName;

    //Constructor
    public Admin()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //Methods

    //___________________AddAdmin_______________________

    public void AddAdmin(AdminDetails admDetails)
    {
        strSQLName = "spAddAdmin";
        prmList = new ArrayList();

        prm = new OleDbParameter("@FirstName", OleDbType.VarChar);
        prm.Value = admDetails.FirstName;
        prmList.Add(prm);

        prm = new OleDbParameter("@LastName", OleDbType.VarChar);
        prm.Value = admDetails.LastName;
        prmList.Add(prm);

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = admDetails.Email;
        prmList.Add(prm);

        prm = new OleDbParameter("@UserName", OleDbType.VarChar);
        prm.Value = admDetails.UserName;
        prmList.Add(prm);

        prm = new OleDbParameter("@Password", OleDbType.VarChar);
        prm.Value = admDetails.Password;
        prmList.Add(prm);

        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }
    //___________________ExistAdmin_________________________________

    public Boolean ExistAdmin(AdminDetails admDetails)
    {
        strSQLName = "spExistAdmin";
        prmList = new ArrayList();

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = admDetails.Email;
        prmList.Add(prm);

        int intCount = (int)DoQueries.ExecuteSPScalar(strSQLName, prmList);
        return intCount > 0;
    }


    public Boolean ExistAdmin(string email)
    {
        strSQLName = "spExistAdmin";
        prmList = new ArrayList();

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = email;
        prmList.Add(prm);

        int intCount = (int)DoQueries.ExecuteSPScalar(strSQLName, prmList);
        return intCount > 0;
    }

    public AdminDetails GetAdminByEmail(string email)
    {
        AdminDetails e = new AdminDetails();

        if (ExistAdmin(email))
        {
            string strDetails =
                string.Format("SELECT * FROM tblAdmins" +
                " WHERE email='{0}'", email);
            DataSet ds = DoQueries.ExecuteDataSet(strDetails);
            e.AdminID = int.Parse(ds.Tables[0].Rows[0]["adminID"].ToString());
            e.FirstName = ds.Tables[0].Rows[0]["firstName"].ToString();
            e.LastName = ds.Tables[0].Rows[0]["lastName"].ToString();
            e.Email = ds.Tables[0].Rows[0]["email"].ToString();
            e.UserName = ds.Tables[0].Rows[0]["userName"].ToString();
            e.Password = ds.Tables[0].Rows[0]["password"].ToString();
        }
        return e;
    }
}
//**************Class  Admin - end   **********************