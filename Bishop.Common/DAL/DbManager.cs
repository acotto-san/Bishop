using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Common.DAL
{
    public class DbManager
    {
        private static ConnectionStringSettings connectionStringSettings;
        static DbManager()
        {
     
        }

        public static ConnectionStringSettings GetconnectionStringSettings()
        {
            return connectionStringSettings;
        }

        /// <summary>
        /// Crea la conexión a la base de datos
        /// </summary>
        /// <returns>Un <see cref="DbConnection"/> instanciado y con el <see cref="DbConnection.ConnectionString"/> establecido</returns>
        public static DbConnection CreateConnection()
        {
            var dbProviderFactory = DbProviderFactories.GetFactory(connectionStringSettings.ProviderName);

            var connection = dbProviderFactory.CreateConnection();
            connection.ConnectionString = connectionStringSettings.ConnectionString;

            return connection;
        }

    }
}
