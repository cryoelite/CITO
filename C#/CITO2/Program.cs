using System.Configuration;
using System.Data.SqlClient;




namespace Kell
{

    public class Connect
    {
        SqlConnection _con;
        SqlCommand _cmd;

        SqlTransaction _transaction;

        public Connect()
        {
            var _conString = ConfigurationManager.ConnectionStrings["CryoSQL"].ConnectionString;
            _con = new SqlConnection(_conString);
        }

        private void connectDB()
        {
            if (_con.State == System.Data.ConnectionState.Closed || _con.State != System.Data.ConnectionState.Open)
                _con.Open();
        }

        public void initDB()
        {
            try
            {
                connectDB();
                _transaction = _con.BeginTransaction();
                _cmd = new SqlCommand("create table HelloWorld(PersonID int);", _con, _transaction);
                _cmd.ExecuteNonQuery();
                _transaction.Commit();
                _con.Close();
            }
            catch (SqlException ex)
            {
                System.Console.WriteLine($"Failed with {ex.Message} ");
                _transaction.Rollback();
            }
        }

        public void displayDB()
        {
            connectDB();
            _transaction = _con.BeginTransaction();
            _cmd = new SqlCommand("Select * from HelloWorld where ");

        }
    }
    public class CITO
    {
        public static void Main()
        {
            Connect connect = new Connect();
            connect.initDB();
            System.Console.WriteLine("aa");
        }
    }
}
