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
/// Summary description for AccessDB
/// </summary>
public class DoQueries
{
    
    private static string strConnection = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source = " + 
        System.Web.HttpContext.Current.Server.MapPath("~\\App_Data\\Game.accdb");
    public DoQueries()
    {
    }
    public static OleDbConnection Connection()
    {
        OleDbConnection cnn = new OleDbConnection(strConnection);
        return cnn;
    }
    //---------------------------
    public static OleDbDataReader ExecuteReader(string strSQLName, ArrayList prmList)
    {
        OleDbConnection cnn = Connection();

        OleDbCommand cmd = new OleDbCommand(strSQLName, cnn);
        cmd.CommandType = CommandType.StoredProcedure;

        foreach (OleDbParameter prm in prmList)
        {
            cmd.Parameters.Add(prm);
        }

        OleDbDataReader dr = null;
        cnn.Open();
        dr = cmd.ExecuteReader();
        cnn.Close();
        return dr;
    }
    public static OleDbDataReader ExecuteReader(string strSQLName)
    {
        OleDbConnection cnn = Connection();

        OleDbCommand cmd = new OleDbCommand(strSQLName, cnn);
        cmd.CommandType = CommandType.StoredProcedure;

        OleDbDataReader dr = null;
        cnn.Open();
        dr = cmd.ExecuteReader();
        cnn.Close();
        return dr;
    }

    //---------------------------

    public static Object ExecuteSPScalar(string strSQLName, ArrayList prmList)
    {
        OleDbConnection cnn = Connection();

        OleDbCommand cmd = new OleDbCommand(strSQLName, cnn);
        cmd.CommandType = CommandType.StoredProcedure;

        foreach (OleDbParameter prm in prmList)
        {
            cmd.Parameters.Add(prm);
        }
        Object val = new Object();
        val = null;
        cnn.Open();
        val = cmd.ExecuteScalar();
        cnn.Close();

        return val;

    }

    public static Object ExecuteSPScalar(string strSQLName)
    {
        OleDbConnection cnn = Connection();

        OleDbCommand cmd = new OleDbCommand(strSQLName, cnn);
        cmd.CommandType = CommandType.StoredProcedure;

        Object val = new Object();
        val = null;

        cnn.Open();
        val = cmd.ExecuteScalar();
        cnn.Close();

        return val;

    }
    //---------------------------
    public static Object ExecuteScalar(string strSQL)
    {
        OleDbConnection cnn = Connection();
        OleDbCommand cmd = new OleDbCommand(strSQL, cnn);

        Object val = new Object();
        val = null;

        cnn.Open();
        val = cmd.ExecuteScalar();
        cnn.Close();

        return val;

    }
    //---------------------------
    public static bool ExecuteSPNonQuery(string strSQLName, ArrayList prmList)
    {
        OleDbConnection cnn = Connection();

        OleDbCommand cmd = new OleDbCommand(strSQLName, cnn);
        cmd.CommandType = CommandType.StoredProcedure;

        foreach (OleDbParameter prm in prmList)
        {
            cmd.Parameters.Add(prm);
        }
        bool r = false;

        cnn.Open();
        r = (cmd.ExecuteNonQuery() != 0);
        cnn.Close();

        return r;
    }
    public static bool ExecuteSPNonQuery(string strSQLName)
    {
        OleDbConnection cnn = Connection();

        OleDbCommand cmd = new OleDbCommand(strSQLName, cnn);
        cmd.CommandType = CommandType.StoredProcedure;

        bool r = false;

        cnn.Open();
        r = (cmd.ExecuteNonQuery() != 0);
        cnn.Close();

        return r;
    }
    //---------------------------
    public static bool ExecuteNonQuery(string strSQL)
    {
        OleDbConnection cnn = Connection();

        OleDbCommand cmd = new OleDbCommand(strSQL, cnn);
        bool r = false;

        cnn.Open();
        r = (cmd.ExecuteNonQuery() != 0);
        cnn.Close();

        return r;
    }
    //---------------------------
    public static void UpdateTableInDataBase(string strSQL, DataTable dtNew)
    {
        OleDbDataAdapter adp = new OleDbDataAdapter(strSQL, strConnection);
        OleDbCommandBuilder autoCmdBuild = new OleDbCommandBuilder(adp);

        adp.UpdateCommand = autoCmdBuild.GetUpdateCommand();
        adp.DeleteCommand = autoCmdBuild.GetDeleteCommand();
        adp.InsertCommand = autoCmdBuild.GetInsertCommand();
        adp.Update(dtNew);

        dtNew.Clear();
        return;
    }
    //---------------------------
    public static DataSet ExecuteDataSet(string strSQL)
    {
        DataSet ds = new DataSet();
        OleDbDataAdapter adp = new OleDbDataAdapter(strSQL, strConnection);

        adp.Fill(ds);

        return ds;
    }

    //---------------------------
    public static DataTable ExecuteDataTable(string strSQL)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter adp = new OleDbDataAdapter(strSQL, strConnection);

        adp.Fill(dt);

        return dt;
    }
     public static string GetStrConncetion()
    {
        return strConnection;
    }
}
