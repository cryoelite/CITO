using System.Configuration;
using System.Data.SqlClient;




namespace PP
{

    public class Connect
    {
        SqlConnection _con = null;
        SqlCommand _cmd = null;
        int _reader = 0;
        SqlTransaction _transaction;

        public Connect()
        {
            var _conString = ConfigurationManager.ConnectionStrings["CryoSQL"].ConnectionString;
            _con = new SqlConnection(_conString);
        }

        public void initDB()
        {
            _cmd = new SqlCommand("create table StuDB (PersonID int, FirstName varchar(255),LastName varchar(255) );");
            try
            {
                if (_con.State == System.Data.ConnectionState.Closed)
                    _con.Open();
                _con.BeginTransaction();
                _reader = _cmd.ExecuteNonQuery();
                _transaction.Commit();

            }
            catch (SqlException ex)
            {
                System.Console.WriteLine($"Failed with {ex.Message} ");
                _transaction.Rollback();
            }
        }
    }
    public class Default
    {
        public static void Main()
        {
            Connect connect = new Connect();
            connect.initDB();
            System.Console.WriteLine("aa");
        }
    }
}
