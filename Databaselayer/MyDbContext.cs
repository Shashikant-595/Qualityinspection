using Databaselayer.Migration;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Databaselayer
{
    public class MyDbContext : DbContext
    {
        static MyDbContext()
        {
            var ensureDLLIsCopied = System.Data.Entity.SqlServer.SqlProviderServices.Instance;
        }

        public MyDbContext() : base("MyDbContext")
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<MyDbContext, Configuration>());
        }

        public DbSet<Exportpacking> Exportpacking { get; set; }

        
    }

}

